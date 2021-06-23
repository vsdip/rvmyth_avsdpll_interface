//`include "mythcore_test.v"
//`include "avsd_pll_1v8.v"
`include "avsd_pll_1v8.synth.v"
//`include "sky130_fd_sc_hd__tt_025C_1v80.lib"
`include "primitives.v"
`include "sky130_fd_sc_hd.v"
`timescale 1ns / 1ps
module gls();
wire [9:0] out;
reg reset;
reg EN_VCO;
reg REF;
reg VCO_IN;
reg VDDA;
reg VDDD;
reg VSSA;
reg VSSD;

//avsd_pll_1v8 dut(CLK, VCO_IN, VDDA, VDDD, VSSA, VSSD, EN_VCO, REF);

rvmyth_pll_interface uut ( .VCO_IN(VCO_IN), .VDDA(VDDA), .VDDD(VDDD), .VSSA(VSSA), .VSSD(VSSD), 
.EN_VCO(EN_VCO), .REF(REF), .reset(reset), .out(out));

 initial
   begin
   {REF,EN_VCO}=0;
   VCO_IN = 1'b0 ;
   VDDA = 1.8;
   VDDD = 1.8;
   VSSA = 0;
   VSSD = 0;
   reset = 0;
   #20 reset = 1;
   #100 reset = 0;

   end
   
   initial
 begin
    $dumpfile("gls.vcd");
    $dumpvars(0,gls);
 end
 
   initial
    begin
    //#20 ;
    //repeat(2)
  //begin
   //EN_VCO = 1;
  //#100 REF = ~REF;
     
  //end
 //repeat(2)
 // begin
   //  EN_VCO = 1;
     //#50 REF = ~REF;

     //end

    repeat(400)
  begin
     EN_VCO = 1;
     #100 REF = ~REF;
     #(83.33/2)  VCO_IN = ~VCO_IN;
     
     end
     
      $finish;
    end


endmodule
