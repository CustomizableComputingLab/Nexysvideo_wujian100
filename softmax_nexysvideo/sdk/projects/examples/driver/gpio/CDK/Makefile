.PHONY: clean All

All:
	@echo "----------Building project:[ wujian100_open-gpio - BuildSet ]----------"
	@
	@make -f "wujian100_open-gpio.mk" MakeIntermediateDirs && make -f "wujian100_open-gpio.mk" -j 16
	@echo Executing Post Build commands ...
	@export CDKPath="D:/CDK/C-sky" ProjectPath="D:/wujian100/wujian100_open-master/wujian100_open-master/sdk/projects/examples/driver/gpio/CDK" && "D:/wujian100/wujian100_open-master/wujian100_open-master/sdk/projects/examples/driver/gpio/CDK//../../../../../utilities//aft_build.sh"
	@echo Done

clean:
	@echo "----------Cleaning project:[ wujian100_open-gpio - BuildSet ]----------"
	@make -f  "wujian100_open-gpio.mk" clean
