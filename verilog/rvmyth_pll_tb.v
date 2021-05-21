module rvmyth_pll_interface_tb;
  reg VSSD;
  reg EN_VCO;
  reg VSSA;
  reg VDDD;
  reg VDDA;
  reg VCO_IN;
  reg REF; 
  
  reg reset; 
  wire [9:0] out;

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
    $dumpfile("test1.vcd");
    $dumpvars(0,rvmyth_pll_interface_tb);
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
