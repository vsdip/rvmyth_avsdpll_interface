# rvmyth_avsdpll_interface

The aim of this repository is to integrate rvmyth (RISC-V CPU core) with Phase Locked Looop (PLL) using open-source EDA tools. The whole project focuses on Mixed Signal Physical Design. The rvmyth is a digital block whereas the pll is an ananlog block. To achieve the integration firstly we need to generate a verilog block for the PLL and take the output of the PLL and give it as an input to the rvmyth.

### Tools Required

iverilog and gtkwave


### Problem Statement

<img src = "https://github.com/vsdip/rvmyth_avsdpll_interface/blob/main/pics/1.png" width = 700>

### PLL Specs

<img src = "https://github.com/vsdip/rvmyth_avsdpll_interface/blob/main/pics/2.png" width = 700>


## Installation steps

1.Install iverilog and gtkwave

2.Simulate rvmyth using the following steps:

 a. git clone https://github.com/kunalg123/rvmyth/
 b. cd rvmyth
 c. iverilog mythcore_test.v tb_mythcore_test.v
 d. ./a.out
 e. gtkwave tb_mythcore_test.vcd
