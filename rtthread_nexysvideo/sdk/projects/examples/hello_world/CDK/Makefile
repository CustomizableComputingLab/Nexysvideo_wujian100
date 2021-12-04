.PHONY: clean All

All:
	@echo "----------Building project:[ wujian100_open-hello_world - BuildSet ]----------"
	@
	@make -f "wujian100_open-hello_world.mk" MakeIntermediateDirs && make -f "wujian100_open-hello_world.mk" -j 16
	@echo Executing Post Build commands ...
	@export CDKPath="D:/CDK/C-sky" ProjectPath="D:/wujian100_rtthread/rtt_sdk_work_finsh/projects/examples/hello_world/CDK" && "D:/wujian100_rtthread/rtt_sdk_work_finsh/projects/examples/hello_world/CDK//../../../../utilities//aft_build.sh"
	@echo Done

clean:
	@echo "----------Cleaning project:[ wujian100_open-hello_world - BuildSet ]----------"
	@make -f  "wujian100_open-hello_world.mk" clean
