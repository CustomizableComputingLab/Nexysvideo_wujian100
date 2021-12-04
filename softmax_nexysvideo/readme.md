# NexysVideo SoftMax integrated in wujian100 SoC
run softmax hardware acceleration integrated in wujian100 SoC in NexysVideo Board 
==========
# Work On PC
- generate random number of original data and store the date in SD card
- get the results from wujian100 SoC
- compare the results from wujian100 SoC with PC and show the error
==========
# Work On wujian100 SoC
- get the original data from SD card
- work out the results and send to PC using uart
==========
# Usage
- run data_gen.py(located in pc_work) to generate random number of original data.(eg. run "python data_gen.py 4096" to generate 4096 original data) The original data will be stored in data.txt and the results in PC_result.txt.
- move file data.txt to SD card and load it to NexysVideo board.
- Configure the FPGA using the wujian100_open_top.bit/wujian100_open_top.bin located in vivado_work.
- Connect the T-head debugger and USB wire to NexysVideo board.
- Open the SoftMax sdk project(located in sdk/projects/examples/spi_sd/CDK) and using debug button in CDK to load program to wujian100 SoC. 
- using uart assistant software provided to connect with wujian100 SoC. Press CPU_RESET button and uart assistant software will receive the data send from wujian100 SoC. Save the data to a file named FPGA_result.txt and save it in the pc_work path. The file name must be accurate and should only contains the calculation results which means you should manually handle the received data.
- run draw_error.py(located in pc_work) to show the error between PC and wujian100 SoC.

