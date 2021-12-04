# NexysVideo IO/LAB
run wujian100 rtthread example in NexysVideo Board 
==========
# Usage
- Configure the FPGA using the wujian100_open_top.bit/wujian100_open_top.bin.
- Connect the T-head debugger and USB wire to NexysVideo board
- Open the IO/LAB sdk project(located in sdk/projects/examples/hello_world/CDK) and using debug button in CDK to load program to wujian100 soc. Open the serial pane in CDK and configure the Uart Settings with 115200-8-N-1.
- When over, you can see  
    - The serial pane will show two threads output alternately.
    - enter "help" in the serial pane to see the basic commands rtthread finsh component surports.  
    - enter each command to see the results.
