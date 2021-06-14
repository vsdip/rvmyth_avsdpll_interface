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


##OpenLANE and sky130 Installation steps



