.PHONY: clean All

All:
	@echo "----------Building project:[ wujian100_open-hello_world - BuildSet ]----------"
	@
	@make -f "wujian100_open-hello_world.mk" MakeIntermediateDirs && make -f "wujian100_open-hello_world.mk" -j 16
	@echo Executing Post Build commands ...
	@export CDKPath="D:/CDK/C-sky" ProjectPath="D:/wujian100/wujian100_open-master/wujian100_open-master/sdk/projects/examples/spi_sd/CDK" && "D:/wujian100/wujian100_open-master/wujian100_open-master/sdk/projects/examples/spi_sd/CDK//../../../../utilities//aft_build.sh"
	@echo Done

clean:
	@echo "----------Cleaning project:[ wujian100_open-hello_world - BuildSet ]----------"
	@make -f  "wujian100_open-hello_world.mk" clean
