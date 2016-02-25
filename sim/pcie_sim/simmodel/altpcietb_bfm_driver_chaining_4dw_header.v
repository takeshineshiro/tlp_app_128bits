// /**
//  * This Verilog HDL file is used for simulation in
//  * the chained DMA design example.
//  */
`timescale 1 ps / 1 ps
//-----------------------------------------------------------------------------
// Title         : PCI Express BFM Root Port Driver for the chained DMA
//                 design example
// Project       : PCI Express MegaCore function
//-----------------------------------------------------------------------------
// File          : altpcietb_bfm_driver.v
// Author        : Altera Corporation
//-----------------------------------------------------------------------------
// Description : This module is driver for the Root Port BFM for the chained DMA
//               design example.
//     The main process (begin : main) operates in two stages:
//        - EP configuration using the task ebfm_cfg_rp_ep
//        - Run a chained DMA transfer with the task chained_dma_test
//
//    Chained DMA operation:
//       The chained DMA consist of a DMA Write and a DMA Read sub-module
//       Each DMA use a separate descriptor table mapped in the share memeory
//       The descriptor table contains a header with 3 DWORDs (DW0, DW1, DW2)
//
//       |31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16|15 .................0
//   ----|---------------------------------------------------------------------
//       | R|        |         |              |  | E|M| D |
//   DW0 | E| MSI    |         |              |  | P|S| I |
//       | S|TRAFFIC |         |              |  | L|I| R |
//       | E|CLASS   | RESERVED|  MSI         |1 | A| | E |      SIZE:Number
//       | R|        |         |  NUMBER      |  | S| | C |   of DMA descriptor
//       | V|        |         |              |  | T| | T |
//       | E|        |         |              |  |  | | I |
//       | D|        |         |              |  |  | | O |
//       |  |        |         |              |  |  | | N |
//   ----|---------------------------------------------------------------------
//   DW1 |                                       BDT_MSB
//   ----|---------------------------------------------------------------------
//   DW2 |                                       BDT_LSB
//   ----|---------------------------------------------------------------------
//
// RC memory map Overview - Descriptor section
//
//   RC memory  : 2Mbyte 0h -> 200000h
//   BRC+00000h : Descriptor table write
//   BRC+00100h : Descriptor table read
//   BRC+01000h : Data for write
//   BRC+05000h : Data for read
//
//-----------------------------------------------------------------------------
//
// Abreviation:
//     EP      : End Point
//     RC      : Root complex
//     DT      : Descriptor Table
//     MWr     : Memory write
//     MRd     : Memory read
//     CPLD    : Completion with data
//     MSI     : PCIe Message Signaled Interrupt
//     BDT     : Base address of the descriptor header table in RC memory
//     BDT_LSB : Base address of the descriptor header table in RC memory
//     BDT_MSB : Base address of the descriptor header table in RC memory
//     BRC     : [BDT_MSB:BDT_LSB]
//     DW0     : First DWORD of the descriptor table header
//     DW1     : Second DWORD of the descriptor table header
//     DW2     : Third DWORD of the descriptor table header
//     RCLAST  : RC MWr RCLAST in EP memeory to reflects the number
//               of DMA transfers ready to start
//     EPLAST  : EP MWr EPLAST in shared memeory to reflects the number
//               of completed DMA transfers
//
//-----------------------------------------------------------------------------
// Copyright ??? 2009 Altera Corporation. All rights reserved.  Altera products are
// protected under numerous U.S. and foreign patents, maskwork rights, copyrights and
// other intellectual property laws.
//
// This reference design file, and your use thereof, is subject to and governed by
// the terms and conditions of the applicable Altera Reference Design License Agreement.
// By using this reference design file, you indicate your acceptance of such terms and
// conditions between you and Altera Corporation.  In the event that you do not agree with
// such terms and conditions, you may not use the reference design file. Please promptly
// destroy any copies you have made.
//
// This reference design file being provided on an "as-is" basis and as an accommodation
// and therefore all warranties, representations or guarantees of any kind
// (whether express, implied or statutory) including, without limitation, warranties of
// merchantability, non-infringement, or fitness for a particular purpose, are
// specifically disclaimed.  By making this reference design file available, Altera
// expressly does not recommend, suggest or require that this reference design file be
// used in combination with any other product not provided by Altera.
//-----------------------------------------------------------------------------
`define STR_SEP "---------"

module altpcietb_bfm_driver_chaining (input clk_in,
                             input INTA,
                             input INTB,
                             input INTC,
                             input INTD,
                             input rstn,
                             output dummy_out);

   // TEST_LEVEL is a parameter passed in from the top level test bench that
   // could control the amount of testing done. It is not currently used.

   // Global parameter
   parameter  TEST_LEVEL            = 1;
   localparam DISPLAY_ALL           = 1;
   localparam NUMBER_OF_DESC 	    = 3;
   localparam SCR_MEM               = 2048;  // Share memory base address used by DMA
   localparam SCR_MEMSLAVE          = 64;    // Share memory base address used by RC Slave module
   localparam SCR_MEM_DOWNSTREAM_WR = SCR_MEMSLAVE;
   localparam SCR_MEM_DOWNSTREAM_RD = SCR_MEMSLAVE+1024;
   localparam MAX_RCPAYLOAD         = 128;
   localparam RCSLAVE_MAXLEN = 1;  // maximum number of read/write

   localparam TIMEOUT_POLLING       = 2048;  // number of clock' for timout
   localparam USE_CDMA              = 1;     // When set enable EP upstream MRd/MWr
                                             // using the chaining DMA module

   // Write DMA DESCRIPTOR TABLE Content
   localparam integer WR_DIRECTION        = 1;
   localparam integer WR_DESCRIPTOR_DEPTH = 4;        // 4 DWORDS
   localparam integer DESC_BASE           = SCR_MEM;

   localparam integer RD_BUFF_LSB         = SCR_MEM+'h4000;
   localparam integer RD_BUFF_MSB         = 32'h1;
   localparam integer RD_DESC0_INIT_BFM_MEM = 32'h1000_0000;

   localparam integer WR_BUFF_LSB         = SCR_MEM+'h8000;
   localparam integer WR_BUFF_MSB         = 32'h2;
   localparam integer WR_DESC0_INIT_BFM_MEM = 32'h0;



   localparam SOF = (1 << 28);
   localparam EOF = (1 << 27);
   localparam INT = (1 << 30);
   localparam DEF_LEN = 256;


   // Information used by driver for polling Chaining DMA status for completion.
   // These must correspond to the _DESCx_CTL_MSI and _DESCx_CTL_EPLAST parameters above.

   localparam EPLAST_DONE_VALUE   = 2;                                                                  // The EPLast Number that the driver expects to receive from each DMA after all data transfers have completed
   localparam NUM_EPLAST_EXPECTED = 0; // Number of Descriptors programmed to send EPLAST status update to root port
   localparam NUM_MSI_EXPECTED    = 0;             // Number of MSI's that the driver expects to receive from each DMA after all data transfers have completed


   localparam DEBUG_PRG = 0;


parameter
        /* DMA write control DCR reg map */
        DMA_RD_REG_OFFSET       = 'h10*4,//32'h00000000,32'h00000400
        DMA_WR_REG_OFFSET       = 'h11*4,//32'h00000020
        DMA_ADDR_OFFSET         = 'h12*4,
        DMA_LEN_OFFSET          = 'h13*4,
        DMA_INTERRUPT_OFFSET    = 'h14*4,
        DMA_SOF_OFFSET          = 'h15*4,
        /* DMA read DCR reg map */
        READ_DMA_REG1_OFFSET    = 'h00*4,//32'h12345678
        READ_DMA_REG2_OFFSET    = 'h01*4,//32'hfedcba98
        READ_DMA_RD_REG_OFFSET  = 'h02*4,//dma2dcr_data[31]
        READ_DMA_WR_REG_OFFSET  = 'h03*4,//dma2dcr_data[31]
        READ_DMA_ADDR_OFFSET    = 'h04*4,
        READ_DMA_LEN_OFFSET     = 'h05*4,
        READ_DMA_INTERRUPT_OFFSET    = 'h06*4;


   `include "altpcietb_bfm_constants.v"
   `include "altpcietb_bfm_log.v"
   `include "altpcietb_bfm_shmem.v"
   `include "altpcietb_bfm_rdwr.v"
   `include "altpcietb_bfm_configure.v"

   // The clk_in and rstn signals are provided for possible use in controlling
   // the transactions issued, they are not currently used.

// ebfm_display_verb
// overload ebfm_display by turning on/off verbose when DISPLAY_ALL>0
function ebfm_display_verb(
   input integer msg_type,
   input [EBFM_MSG_MAX_LEN*8:1] message);
   reg do ;
   begin
      if (DISPLAY_ALL==1)
         do = ebfm_display(msg_type, message);
      ebfm_display_verb = 1'b0 ;
   end
endfunction

/////////////////////////////////////////////////////////////////////////
//
// TASK:dma_set_header :
//
// RC issues MWr to write Descriptor table header DW0, DW1, DW2
// RC initializaed RC shared memory with MSI_DATA, DW0, DW1, DW2
//
// Descriptor header table in EP shared memory :
//
//  |----------------------------------------------
//  | DMA 
//  |----------------------------------------------
//  | 0h     | DW0
//  |--------|-------------------------------------
//  | 04h    | DW1
//  |--------|-------------------------------------
//  | 08h    | DW2
//  |--------|-------------------------------------
//  | 0ch    | RCLast
//  |        | RC MWr RCLast : Available DMA number
//  |----------------------------------------------
task dma_set_header (
   input integer bar_table    , // Pointer to the BAR sizing and
   input integer setup_bar    , // BAR to be used for setting up
   input integer dt_size      , // total number of descriptors in the descriptor table
   input integer dt_bdt_msb   , // upper 32 bits base address of the descriptor table location in Root Port memory space
   input [31:0] dt_bdt_lsb     //lower 32 bits base address of the descriptor table location in Root Port memory space
   );
integer ep_offset;
reg do;
   begin
      ep_offset = 0;
      //DMA READ 
      ebfm_barwr_imm(bar_table, setup_bar, ep_offset + DMA_ADDR_OFFSET,   32'h00000000, 4, 0);//0
      ebfm_barwr_imm(bar_table, setup_bar, ep_offset + DMA_LEN_OFFSET,    32'h00000020, 4, 0);//32
      ebfm_barwr_imm(bar_table, setup_bar, ep_offset + DMA_SOF_OFFSET,    32'h00000003, 4, 0);//3
      ebfm_barwr_imm(bar_table, setup_bar, ep_offset + DMA_RD_REG_OFFSET, 32'h00000001, 4, 0);//01
      // DMA_WRITE
      ebfm_barwr_imm(bar_table, setup_bar, ep_offset + DMA_ADDR_OFFSET,   32'h00000400, 4, 0);//1024
      ebfm_barwr_imm(bar_table, setup_bar, ep_offset + DMA_LEN_OFFSET,    32'h00000020, 4, 0);//32
      ebfm_barwr_imm(bar_table, setup_bar, ep_offset + DMA_WR_REG_OFFSET, 32'h00000001, 4, 0); //01
   end

endtask


task int_del (
   input integer bar_table    , // Pointer to the BAR sizing and
   input integer setup_bar      // BAR to be used for setting up
   );
integer ep_offset;
   begin
      ep_offset = 0;
      ebfm_barwr_imm(bar_table, setup_bar, ep_offset+'h4, 32'h0, 4, 0);
   end

endtask

/////////////////////////////////////////////////////////////////////////
//
// TASK: dma_set_desc_data :
//
//  write 'write descriptor table in the RC Memory
//
/////////////////////////////////////////////////////
//           |-------------------------------------
//           | header write
//           |-------------------------------------
// BRC+0h    | ctrl_len 
// BRC+4h    | 0
// BRC+8h    | desc MSB
// BRC+ch    | desc LSB 
// BRC+10h   | src  MSB 
// BRC+14h   | src  LSB
// BRC+18h   | dst  MSB
// BRC+1ch   | dst  LSB
//           |-------------------------------------
//
task dma_set_desc_data (
   );

   integer descriptor_addr,i,ctrl_len;
   reg do;
   begin
      //program BFM share memeory
      do = ebfm_display_verb(EBFM_MSG_INFO, "TASK:dma set desc data");
	  

      if(NUMBER_OF_DESC<2)
            do = ebfm_display(EBFM_MSG_ERROR_FATAL, "desc num less than 2!"); 	

         for (i=0;i<NUMBER_OF_DESC;i=i+1)
         begin

	     if(i == 0)
	       ctrl_len = SOF | DEF_LEN;
	     else if(i == NUMBER_OF_DESC-1)
	       ctrl_len = INT | EOF | DEF_LEN;
	     else if(i > 0 && i < NUMBER_OF_DESC-1)
	       ctrl_len = DEF_LEN;
	    descriptor_addr = DESC_BASE + i*'h20;

            shmem_write(descriptor_addr+'h0 ,  ctrl_len, 4);
            shmem_write(descriptor_addr+'h4 ,  0, 4);
            shmem_write(descriptor_addr+'h8 ,  0, 4);
            shmem_write(descriptor_addr+'hc ,  descriptor_addr + 'h20, 4);
            shmem_write(descriptor_addr+'h10,  RD_BUFF_MSB ,4);
            shmem_write(descriptor_addr+'h14,  RD_BUFF_LSB+DEF_LEN*i, 4);
            shmem_write(descriptor_addr+'h18,  WR_BUFF_MSB, 4);
            shmem_write(descriptor_addr+'h1c,  WR_BUFF_LSB+DEF_LEN*i, 4);

      end

      shmem_fill(32'h00000020,SHMEM_FILL_DWORD_INC,
                 DEF_LEN*NUMBER_OF_DESC*4,RD_DESC0_INIT_BFM_MEM);
      shmem_fill(32'h00000400,SHMEM_FILL_ZERO,
                 DEF_LEN*NUMBER_OF_DESC*4,WR_DESC0_INIT_BFM_MEM);

   end
endtask


/////////////////////////////////////////////////////////////////////////
//
// rcmem_poll
//
// Polling routine waiting for rc_data at location rc_addr
//
task rcmem_poll(
   input integer rc_addr,
   input integer rc_data,
   input integer rc_data_mask);

   reg do;
   integer rc_current;
   integer rc_last;
   reg [31:0] timout_limit;
   reg pol_ip;

   begin

    //  do = ebfm_display_verb(EBFM_MSG_INFO, `STR_SEP);
    //  do = ebfm_display_verb(EBFM_MSG_INFO, "TASK:rcmem_poll  Start polling");
      pol_ip=0;
      timout_limit[31:0]=0;

      fork

      begin:wait_for_rcmem
         forever
            begin
               repeat (50) @(posedge clk_in);
               rc_current = (shmem_read (rc_addr, 4) & (rc_data_mask));
               if (pol_ip==0) begin
                  timout_limit[31:0]=0;
                  rc_last    = rc_current;
                  do = ebfm_display_verb(EBFM_MSG_INFO,
                        {"TASK:rcmem_poll  Polling RC Address"   ,himage8(rc_addr),
                         "   current data (" ,himage8(rc_current),
                         ")  expected data (",himage8(rc_data),")"});
               end
               if (rc_current != rc_last ) begin
                  do = ebfm_display(EBFM_MSG_INFO,
                        {"TASK:rcmem_poll  Polling RC Address"   ,himage8(rc_addr),
                         "   current data (" ,himage8(rc_current),
                         ")  expected data (",himage8(rc_data),")"});
                  timout_limit[31:0]=0;
               end
               else
                  timout_limit[31:0]=timout_limit[31:0]+1;

               rc_last    = rc_current;
               pol_ip=1;

               if (timout_limit[31:0]>TIMEOUT_POLLING) begin
                  do = ebfm_display(EBFM_MSG_INFO,
                            "   ---> TASK:rcmem_poll timeout occured");
                  do = ebfm_display(EBFM_MSG_ERROR_FATAL,
                           {"   ---> Test Fails: RC Address:",
                           himage8(rc_addr)," contains ", himage8(rc_current)});
                  disable wait_for_rcmem;
               end
               if (rc_current == rc_data)
                  begin
                     do = ebfm_display(EBFM_MSG_INFO,
                     {"TASK:rcmem_poll   ---> Received Expected Data (",himage8(rc_current),")"});
                     disable wait_for_rcmem;
                  end
            end
      end
      join
   end
endtask

/////////////////////////////////////////////////////////////////////////
//
// TASK:dma_copy
//
// Run the chained DMA mem copy
//
// Input argument
//     bar_table :  Pointer to the BAR sizing and
//     setup_bar :  BAR to be used for setting up
//                  4 Write then Read
//     use_global_msi   :  When set, use msi
//     use_global_eplast:  When set, poll for ep last
//
task dma_copy(
   input integer bar_table,
   input integer setup_bar,
   input integer use_global_msi,
   input integer use_global_eplast);

   localparam integer MSI_ADDRESS = SCR_MEM-16;
   localparam integer MSI_DATA    = 16'hb0fe;

   reg do;
   integer RCLast;

   reg [4:0] msi_number          ;
   reg [2:0] msi_traffic_class   ;
   reg [2:0] multi_message_enable;
   integer   msi_address         ;

   integer   msi_expected_dmawr ;
   integer   msi_expected_dmard ;

   integer msi_received ;
   integer msi_count    ;
   integer max_count    ;
   integer i    ;
   reg [31:0] track_rclast_loop;

   reg     use_msi;
   reg     use_eplast;

   reg [4:0] msi_number_int          ;
   reg [2:0] msi_traffic_class_int   ;
   reg [2:0] multi_message_enable_int;

   begin

      do = ebfm_display_verb(EBFM_MSG_INFO,"   DMA: Memory Copy");

      // write 'write descriptor table in the RC Memory
      dma_set_desc_data();

      // Write Descriptor header in EP memory PRG
      dma_set_header( bar_table,               // Pointer to the BAR sizing and
                      setup_bar,               // BAR to be used for setting up
                      NUMBER_OF_DESC,          // number of descriptor
                      32'h0,                   // RC upper 32 bits of bdt
                      DESC_BASE                // RC lower 32 bits of bdt
                      );

      do = ebfm_display_verb(EBFM_MSG_INFO, {"DESC start addr = 0x", himage8(DESC_BASE)});
      do = ebfm_display_verb(EBFM_MSG_INFO, {"DESC end addr = 0x", himage8(DESC_BASE+8'h20*(NUMBER_OF_DESC-1))});

      do = ebfm_display_verb(EBFM_MSG_INFO, "Wait interrupt");
      wait(INTA); 
      int_del(bar_table,setup_bar);
      wait(~INTA);
      
      //rcmem_poll(DESC_BASE+8'h20*(NUMBER_OF_DESC-1), 32'hff,32'hff0000);
      #8000000;
      do = ebfm_display_verb(EBFM_MSG_INFO, `STR_SEP);
      do = ebfm_display_verb(EBFM_MSG_INFO, "Completed DMA Copy");

  end

endtask


/////////////////////////////////////////////////////////////////////////
//
// TASK:chained_dma_test
//
//    task to run the chained DMA read/Write
//
// Input argument
//     bar_table :  Pointer to the BAR sizing and
//     setup_bar :  BAR to be used for setting up
//     direction :  0 read,
//                  1 write,
//                  2 read and write simulataneous
//                  3 Read then Write
//                  4 Write then Read
//
task chained_dma_test(
    input integer bar_table ,
    input integer setup_bar ,
    input integer direction ,
    input integer use_global_msi   ,
    input integer use_global_eplast
   );

   reg do;

   begin

      do = ebfm_display(EBFM_MSG_INFO, `STR_SEP);
      do = ebfm_display(EBFM_MSG_INFO, "TASK:chained_dma_test");
      case (direction)
         2: begin
               do = ebfm_display(EBFM_MSG_INFO,"   DMA Copy");
               dma_copy(bar_table, setup_bar, use_global_msi, use_global_eplast);
            end
          default: do = ebfm_display(EBFM_MSG_INFO,"   Incorrect direction");
      endcase
  end
endtask


// purpose: Examine the DUT's BAR setup and pick a reasonable BAR to use
task find_mem_bar;
   input bar_table;
   integer bar_table;
   input[5:0] allowed_bars;
   input min_log2_size;
   integer min_log2_size;
   output sel_bar;
   integer sel_bar;

   integer cur_bar;
   reg[31:0] bar32;
   integer log2_size;
   reg is_mem;
   reg is_pref;
   reg is_64b;

   begin
      // find_mem_bar
      cur_bar = 0;
      begin : sel_bar_loop
         while (cur_bar < 6)
         begin
            ebfm_cfg_decode_bar(bar_table, cur_bar,
                                log2_size, is_mem, is_pref, is_64b);
            if ((is_mem == 1'b1) &
                (log2_size >= min_log2_size) &
                ((allowed_bars[cur_bar]) == 1'b1))
            begin
               sel_bar = cur_bar;
               disable sel_bar_loop ;
            end
            if (is_64b == 1'b1)
            begin
               cur_bar = cur_bar + 2;
            end
            else
            begin
               cur_bar = cur_bar + 1;
            end
         end
         sel_bar = 7 ; // Invalid BAR if we get this far...
      end
   end
endtask

// memory content checking - check data transferred for specified descriptor
task check_dma_data;
   reg do;
   integer i;
   reg [31:0] dmaread_data;
   reg [31:0] dmawrite_data;
   integer dmaread_addr;
   integer dmawrite_addr;
   input [31:0] wr_desc_length;        // WR_DESC2_LENGTH
   input [31:0] rd_desc_length;        // RD_DESC2_LENGTH
   input [31:0] wr_desc_rcaddr_lsb;    // WR_DESC2_RCADDR_LSB
   input [31:0] rd_desc_rcaddr_lsb;    // RD_DESC2_RCADDR_LSB

   begin
      if ((wr_desc_length == rd_desc_length ) || (wr_desc_length < rd_desc_length ))  begin
         do = ebfm_display(EBFM_MSG_INFO, `STR_SEP);
         do = ebfm_display(EBFM_MSG_INFO, "TASK:check_dma_data ");
         for (i=0;i<wr_desc_length;i=i+1) begin
            dmaread_addr  = rd_desc_rcaddr_lsb+4*i;
            dmaread_data  = shmem_read(dmaread_addr,4);
            dmawrite_addr = wr_desc_rcaddr_lsb+4*i;
            dmawrite_data = shmem_read(dmawrite_addr,4);
            if (dmaread_data != dmawrite_data) begin
               if (DISPLAY_ALL>0) begin
                  do = ebfm_display_verb(EBFM_MSG_INFO,  " DMA read BFM memory");
                  do = shmem_display    (rd_desc_rcaddr_lsb, rd_desc_length*4,4, rd_desc_rcaddr_lsb+(rd_desc_length*4), EBFM_MSG_INFO);
                  do = ebfm_display_verb(EBFM_MSG_INFO,  " DMA write BFM memory");
                  do = shmem_display    (wr_desc_rcaddr_lsb,wr_desc_length*4,4, wr_desc_rcaddr_lsb+(wr_desc_length*4),EBFM_MSG_INFO);
               end
               do = ebfm_display(EBFM_MSG_ERROR_FATAL,
                        {" DMA Read : Address ("   ,himage8(dmaread_addr),
                         ") Data ("   ,himage8(dmaread_data),
                         ") -------> DMA Write : Address (",himage8(dmawrite_addr),
                         ") Data (" ,himage8(dmawrite_data),")"});
            end
         end
         do = ebfm_display(EBFM_MSG_INFO, {"  Passed : ",dimage4(wr_desc_length),
                            " identical dwords."});
      end
   end
endtask


task scr_memory_compare(
   input integer byte_length,     // downstream wr/rd length in byte
   input integer scr_memorya,     //
   input integer scr_memoryb);     //
   integer i;
   reg [7:0] bytea;
   reg [7:0] byteb;
   reg [31:0] addra;
   reg [31:0] addrb;
   reg do;

   begin

      //do = ebfm_display_verb(EBFM_MSG_INFO, "TASK:scr_memory_compare");
      addra = scr_memorya;
      addrb = scr_memoryb;

      for (i=0;i<byte_length;i=i+1) begin
         bytea=shmem_read(addra,1);
         byteb=shmem_read(addrb,1);
         addra=addra+1;
         addrb=addrb+1;
         if (bytea!=byteb) begin

            do = ebfm_display_verb(EBFM_MSG_INFO, "Content of the RC memory A");
            do =shmem_display(scr_memorya,byte_length,4,scr_memorya+byte_length,EBFM_MSG_INFO);
            do = ebfm_display_verb(EBFM_MSG_INFO, "Content of the RC memory B");
            do =shmem_display(scr_memoryb,byte_length,4,scr_memoryb+byte_length,EBFM_MSG_INFO);

            do = ebfm_display(EBFM_MSG_INFO,
                              {" A: 0x", himage8(addra), ": ",himage8(bytea)});
            do = ebfm_display(EBFM_MSG_INFO,
                              {" B: 0x", himage8(addrb), ": ",himage8(byteb)});
            do = ebfm_display(EBFM_MSG_ERROR_FATAL, {"Different memory content for ",
                                                dimage4(byte_length), " bytes test"});
         end
      end

      do = ebfm_display_verb(EBFM_MSG_INFO, {"Passed: ",dimage4(byte_length),
                             " same bytes in BFM mem addr 0x", himage8(scr_memorya),
                             " and 0x", himage8(scr_memoryb)});

   end
endtask
task downstream_loop(
   input integer bar_table,       // Pointer to the BAR sizing and
   input integer setup_bar,       // Pointer to the BAR sizing and
   input  integer loop,           // Number of Write/read iteration
   input integer byte_length,     // downstream wr/rd length in byte
   input integer epmem_address,   // Downstream EP memory address in byte
   input  [63:0] start_val);      // Starting write data value

   reg do;
   reg [63:0] Istart_val;
   reg [31:0] Iepmem_address;
   integer i;
   reg [31:0] Ibyte_length;

   reg [31:0] cfg_reg ;
   reg [31:0] cfg_maxpload_byte ;
   reg [7:0] avalon_waddr ;
   reg [31:0] avalon_waddr_qw_max;
   reg [31:0] avalon_waddr_qw_min;
   reg [31:0] cfg_dw1 ;


   begin
      do = ebfm_display_verb(EBFM_MSG_INFO, `STR_SEP);
      do = ebfm_display_verb(EBFM_MSG_INFO, "TASK:downstream_loop ");


      cfg_maxpload_byte = 0;
      // Retrieve Device cfg from RC Slave
      // Set EP MWr mode

      cfg_reg = 32'h0;

      case (cfg_reg[7:5])
         3'b000 :cfg_maxpload_byte[12:7 ] = 6'b000001;// 128B
         3'b001 :cfg_maxpload_byte[12:7 ] = 6'b000010;// 256B
         3'b010 :cfg_maxpload_byte[12:7 ] = 6'b000100;// 512B
         3'b011 :cfg_maxpload_byte[12:7 ] = 6'b001000;// 1024B
         3'b100 :cfg_maxpload_byte[12:7 ] = 6'b010000;// 2048B
         default:cfg_maxpload_byte[12:7 ] = 6'b100000;// 4096B
      endcase

      Ibyte_length = ((byte_length>cfg_maxpload_byte)||
                                     (byte_length<4))?4:byte_length;
      Istart_val   = start_val;
      for (i=0;i<loop;i=i+1) begin
         downstream_write( bar_table,
                           setup_bar,
                           epmem_address,
                           Istart_val,
                           Ibyte_length);
         downstream_read ( bar_table,
                           setup_bar,
                           epmem_address,
                           Ibyte_length);
         scr_memory_compare(Ibyte_length,
                            SCR_MEM_DOWNSTREAM_WR,
                            SCR_MEM_DOWNSTREAM_RD);
         Istart_val   = Istart_val+cfg_maxpload_byte;
         Ibyte_length = ((Ibyte_length>cfg_maxpload_byte-4)||
                                     (Ibyte_length<4))?4:Ibyte_length+4;
      end
   end
endtask

/////////////////////////////////////////////////////////////////////////
//
// TASK:downstream_write
// Prior to run DMA test, this task clears the performance counters
//
task downstream_write(
   input integer bar_table,          // Pointer to the BAR sizing and
   input integer setup_bar,          // Pointer to the BAR sizing and
   input integer address,            // Downstream EP memeory address in byte
   input [63:0] data,
   input integer byte_length);      // BAR to be used for setting up

   reg do;

   begin

      // Write a data
      shmem_fill(SCR_MEM_DOWNSTREAM_WR,SHMEM_FILL_QWORD_INC,byte_length,data);
      ebfm_barwr(bar_table,setup_bar,address,SCR_MEM_DOWNSTREAM_WR,byte_length,0);

   end

endtask




task dma_reg_test (
   input integer bar_table    , // Pointer to the BAR sizing and
   input integer setup_bar     // BAR to be used for setting up
   );
integer ep_offset;
integer i;
reg do;
   begin
      do = ebfm_display_verb(EBFM_MSG_INFO,{"   DMA: Test DMA Register"});
      do = ebfm_display_verb(EBFM_MSG_INFO,{"   DMA: Test setup_bar", himage4(setup_bar)});
      ep_offset = 0;
      ebfm_barwr_imm(bar_table, setup_bar, ep_offset + 32'h0,    32'h01234567, 4, 0);//0
      ebfm_barwr_imm(bar_table, setup_bar, ep_offset + 32'h4,    32'h89abcdef, 4, 0);//32
      ebfm_barwr_imm(bar_table, setup_bar, ep_offset + 32'h8,    32'h01010101, 4, 0);//3
      downstream_read(bar_table, setup_bar, ep_offset +32'h0, 4);
      downstream_read(bar_table, setup_bar, ep_offset +32'h4, 4);
      downstream_read(bar_table, setup_bar, ep_offset +32'h8, 4);



//      do = ebfm_display_verb(EBFM_MSG_INFO,
//                              {" addr: 0x", himage8(ep_offset + 'h0), ":data 0x ",himage8(bytea)});
   end
endtask
/////////////////////////////////////////////////////////////////////////
//
// TASK:downstream_read
// Prior to run DMA test, this task clears the performance counters
//
task downstream_read(
   input integer bar_table,          // Pointer to the BAR sizing and
   input integer setup_bar,          // Pointer to the BAR sizing and
   input integer address,            // Downstream EP memeory address in byte
   input integer byte_length);      // BAR to be used for setting up

   reg do;
   begin
      // read a data
      shmem_fill(SCR_MEM_DOWNSTREAM_RD,SHMEM_FILL_QWORD_INC,byte_length,64'hFADE_FADE_FADE_FADE);
      ebfm_barrd_wait(bar_table,setup_bar,address,SCR_MEM_DOWNSTREAM_RD,byte_length,0);
   end

endtask

///////////////////////////////////////////////////////////////////////////////
//
//
// Main Program
//
// Start of the test bench driver altpcietb_bfm_driver
//
   reg activity_toggle;
   reg timer_toggle ;
   time time_stamp ;
   localparam TIMEOUT = 2000000000;

   initial
     begin
        time_stamp = $time ;
        activity_toggle = 1'b0;
        timer_toggle    = 1'b0;
   end

   // behavioral
   always
   begin : main
      // If you want to relocate the bar_table, modify the BAR_TABLE_POINTER in altpcietb_bfm_shmem.
      // Directly modifying the bar_table at this location may disable overwrite protection for the bar_table
      // If the bar_table is overwritten incorrectly, this will break the testbench functionality.
      parameter bar_table = BAR_TABLE_POINTER; // Default BAR_TABLE_SIZE is 64 bytes
      integer tgt_bar;
      integer dma_bar, rc_slave_bar;
      reg     addr_map_4GB_limit;
      reg     do ;
      reg [15:0] msi_control_register;

      // This constant defines where we save the sizes and programmed addresses
      // of the Endpoint Device Under Test BARs
      // tgt_bar indicates which bar to use for testing the target memory of the
      // reference design.

      // Setup the Root Port and Endpoint Configuration Spaces
      addr_map_4GB_limit = 1'b0;
      do = ebfm_display_verb(EBFM_MSG_WARNING,
           "----> Starting ebfm_cfg_rp_ep task 0");
      ebfm_cfg_rp_ep(
                     bar_table,         // BAR Size/Address info for Endpoint
                     1,                 // Bus Number for Endpoint Under Test
                     1,                 // Device Number for Endpoint Under Test
                     512,               // Maximum Read Request Size for Root Port
                     1,                 // Display EP Config Space after setup
                     addr_map_4GB_limit // Limit the BAR assignments to 4GB address map
                     );

      activity_toggle <= ~activity_toggle ;

      // Find a memory BAR to use to setup the DMA channel
      // The reference design implements the DMA channel registers on BAR 2 or 3
      // BAR as to be at least 256 B
      find_mem_bar(bar_table, 6'b000011, 8, dma_bar);

      ///////////////////////////////////////////
      // Test the chained DMA example design

      if ((dma_bar < 6) && (USE_CDMA>0)) begin
         dma_reg_test(bar_table, dma_bar);  
         time_stamp = $time ;
         //chained_dma_test(bar_table, dma_bar,2,0,0);  
         time_stamp = $time ;
         // check the data transferred by the last descriptor
         check_dma_data( 2,
                         2,
                        32'h00000400,
                         32'h00000020);


      end
      else if (USE_CDMA>0)
         do = ebfm_display_verb(EBFM_MSG_WARNING,
     "Unable to find a 256B BAR to setup the chaining DMA DUT; skipping test.");
      // Stop the simulator and indicate successful completion


      //////////////////////////////////////////////////////
      // Test downstream access to the Chaining DMA Memory

      find_mem_bar(bar_table, 6'b111111, 8, rc_slave_bar);
      if ((rc_slave_bar<6)) begin

      end
      else
         do = ebfm_display_verb(EBFM_MSG_WARNING,
            "Unable to find a 256B BAR to setup the RC Slave module ; skipping test.");
      do = ebfm_log_stop_sim(1);
      forever #100000;
   end

   always
     begin
        #(TIMEOUT)
          timer_toggle <= ! timer_toggle ;
     end

   // purpose: this is a watchdog timer, if it sees no activity on the activity
   // toggle signal for 200 us it ends the simulation
   always @(activity_toggle or timer_toggle)
     begin : watchdog
        reg dummy ;

        if ( ($time - time_stamp) >= TIMEOUT)
          begin
             dummy = ebfm_display(EBFM_MSG_ERROR_FATAL, "Simulation stopped due to inactivity!");
          end
        time_stamp <= $time ;
     end

endmodule
