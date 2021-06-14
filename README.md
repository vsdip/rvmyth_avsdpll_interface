# rvmyth_avsdpll_interface

The aim of this repository is to integrate rvmyth (RISC-V CPU core) with Phase Locked Looop (PLL) using open-source EDA tools. The whole project focuses on Mixed Signal Physical Design. The rvmyth is a digital block whereas the pll is an ananlog block. To achieve the integration firstly we need to generate a verilog block for the PLL and take the output of the PLL and give it as an input to the rvmyth.

### Tools Required

iverilog and gtkwave


### Problem Statement

<img src = "https://github.com/vsdip/rvmyth_avsdpll_interface/blob/main/pics/1.png" width = 700>

### PLL Specs

<img src = "https://github.com/vsdip/rvmyth_avsdpll_interface/blob/main/pics/2.png" width = 700>


## Installation steps

1. Install iverilog and gtkwave

2. Simulate rvmyth using the following steps: 

   -  git clone https://github.com/kunalg123/rvmyth/ <br />
   -  cd rvmyth <br />
   -  iverilog mythcore_test.v tb_mythcore_test.v <br />
   -  ./a.out <br />
   -  gtkwave tb_mythcore_test.vcd <br />


<img src = "https://github.com/vsdip/rvmyth_avsdpll_interface/blob/main/pics/3a.PNG" width = 700>

Design a PLL as a clock multiplier using verilog and test the functionality.

  - iverilog avsd_pll_1v8.v pll_tb.v
  - ./a.out
  - gtkwave test.vcd


<img src = "https://github.com/vsdip/rvmyth_avsdpll_interface/blob/main/pics/3aa.PNG" width = 700>


Now integrate both rvmyth and avsdpll using a top level testbench and test it to verify.

 - iverilog rvmyth_pll.v rvmyth_pll_tb.v
 - ./a.out
 - gtkwave test1.vcd


<img src = "https://github.com/vsdip/rvmyth_avsdpll_interface/blob/main/pics/4.PNG" width = 700>


## OpenLANE and sky130 Installation steps

OpenLANE is an automated RTL to GDSII flow based on several components including OpenROAD, Yosys, Magic, Netgen, Fault,SPEF-Extractor and custom methodology scripts for design exploration and optimization. The OpenLANE and sky130 installation can be done by following the steps in this repository https://github.com/nickson-jose/openlane_build_script.

More information on OpenLANE can be found in this repository https://github.com/efabless/openlane .

After finishing off the installation, the first step in the design flow is to synthesize the generated RTL code.

### Synthesis in yosys
In OpenLANE the RTL synthesis is performed by yosys.
The technolgy mapping is performed by abc.
Finally, the timing reports are generated for the resulting synthesized netlist by OpenSTA.
Inorder to perform synthesis, you will need:

Verilog file(.v) of the avsddac and its LIB(.lib) file.
To generate the LIB file run the perl script given on this link, with the command given below.
perl verilog_to_lib.pl avsddac.v avsddac

To perform synthesys in yosys --> Just type yosys in linux shell. --> Then follow the script

The synthesized netlist can be found here.

--> Now, simulate the generated netlist in iverilog & gtkwave to compare the pre - synthesis and post- synthesis simulations.

For that you'd need to create a verilog code for gate level simulation that must include the synthesized netlist verilog file obtained from yosys. The files necessary for pre and post synthesis can be found here.

Both pre-synth and post-synth simulations must give out the same output.



