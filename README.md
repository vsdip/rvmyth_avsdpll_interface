# RISC-V based SOC Design with PLL using Open-Source EDA Tools

> ## Table of Contents
> 1. [Introduction](https://github.com/vsdip/rvmyth_avsdpll_interface/blob/main/README.md#introduction) <br />
> 2. [Required Tools](https://github.com/vsdip/rvmyth_avsdpll_interface/blob/main/README.md#required-tools)
> 3. [Problem Statement](https://github.com/vsdip/rvmyth_avsdpll_interface/blob/main/README.md#problem-statement) <br />
> 4. [PLL Specs](https://github.com/vsdip/rvmyth_avsdpll_interface#pll-specs) <br />
> 5. [Methodology](https://github.com/vsdip/rvmyth_avsdpll_interface/blob/main/README.md#methodology)
> 6. [Installation & Runs](https://github.com/vsdip/rvmyth_avsdpll_interface#installation--runs) <br />
> 7. [OpenLANE and sky130 Installation ](https://github.com/vsdip/rvmyth_avsdpll_interface#openlane-and-sky130-installation) <br />
> 8. [Synthesis in yosys](https://github.com/vsdip/rvmyth_avsdpll_interface#synthesis-in-yosys) <br />
> 9. [Acknowledgements](https://github.com/vsdip/rvmyth_avsdpll_interface#acknowledgements)

### **Introduction**
**The aim of this repository is to integrate rvmyth (RISC-V CPU core developed by VSD) with a PLL (Phase Locked Loop) as a clock multiplier using open-source EDA tools. The whole project focuses on Mixed Signal Physical Design.** 

### **Required Tools**

*iverilog and gtkwave*


### **Problem Statement**

Integration of *rvmyth* with *avsd_pll_1v8*. <br />
<img src = "https://github.com/vsdip/rvmyth_avsdpll_interface/blob/main/pics/1.png" width = 700>

### **PLL Specs**

<img src = "https://github.com/vsdip/rvmyth_avsdpll_interface/blob/main/pics/2.png" width = 700>

### **Methodology**
The rvmyth is a digital block whereas the pll is an ananlog block. To achieve the integration firstly we need to generate a verilog block for the PLL and take the output of the PLL and give it as an input to the rvmyth. This will create the interface then the PNR flow must be implemented.

### **Installation & Runs**

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


### **OpenLANE and sky130 Installation**

OpenLANE is an automated RTL to GDSII flow based on several components including OpenROAD, Yosys, Magic, Netgen, Fault,SPEF-Extractor and custom methodology scripts for design exploration and optimization (https://github.com/efabless/openlane). <br />

The OpenLANE and sky130 installation can be done by referring this repository https://github.com/nickson-jose/openlane_build_script.

Once installation is done the next step is synthesis. <br />


### **Synthesis in yosys**
In OpenLANE the RTL synthesis, technology mapping and timing reports are performed by different tools. <br />
- RTL synthesis by *yosys*.
- Technology mapping by *abc*.
- Timing reports are generated by *OpenSTA*. <br />

Verilog file (.v) of the avsdpll and its LIB (.lib) file.
To generate the LIB file run the below perl script. <br />
*perl verilog_to_lib.pl avsdpll.v avsdpll*

To perform synthesys in yosys

- Just type *yosys* in linux shell and follow the script. <br />

```
read_verilog rvmyth_pll.v 
read_liberty -lib avsd_pll_1v8.lib 
read_liberty -lib sky130_fd_sc_hd__tt_025C_1v80.lib 
synth -top rvmyth_pll_interface 
dfflibmap -liberty sky130_fd_sc_hd__tt_025C_1v80.lib 
opt 
abc -liberty sky130_fd_sc_hd__tt_025C_1v80.lib -script +strash;scorr;ifraig;retime;{D};strash;dch,-f;map,-M,1,{D} 
flatten 
setundef -zero 
clean -purge 
rename -enumerate
stat 
write_verilog -noattr avsd_pll_1v8.synth.v 
```

The synthesized netlist is *avsd_pll_1v8.synth.v* <br />

The snapshot of the synthesized netlist.


<img src = "https://github.com/vsdip/rvmyth_avsdpll_interface/blob/main/pics/5.PNG" width = 700>



 Now, with the generated netist simulate it in iverilog and check the results in gtkwave to compare the pre-synth and post-synth simulations. To achieve that first a GLS testbench file should be written in verilog to compare the results. The pre-synth and post-synth simulation output must be same.



## **Acknowledgements**
Mr.[Kunal Ghosh](https://www.vlsisystemdesign.com/about-me/) Co-founder of [VLSI System Design Pvt. Ltd](https://www.vlsisystemdesign.com/).



