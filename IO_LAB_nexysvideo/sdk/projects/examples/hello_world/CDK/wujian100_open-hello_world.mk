##
## Auto Generated makefile by CDK
## Do not modify this file, and any manual changes will be erased!!!   
##
## BuildSet
ProjectName            :=wujian100_open-hello_world
ConfigurationName      :=BuildSet
WorkspacePath          :=./
ProjectPath            :=./
IntermediateDirectory  :=Obj
OutDir                 :=$(IntermediateDirectory)
User                   :=hnaym
Date                   :=03/12/2021
CDKPath                :=D:/C-Sky/CDK
LinkerName             :=riscv64-unknown-elf-gcc
LinkerNameoption       :=
SIZE                   :=riscv64-unknown-elf-size
READELF                :=riscv64-unknown-elf-readelf
CHECKSUM               :=crc32
SharedObjectLinkerName :=
ObjectSuffix           :=.o
DependSuffix           :=.d
PreprocessSuffix       :=.i
DisassemSuffix         :=.asm
IHexSuffix             :=.ihex
BinSuffix              :=.bin
ExeSuffix              :=.elf
LibSuffix              :=.a
DebugSwitch            :=-g 
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
ElfInfoSwitch          :=-hlS
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
UnPreprocessorSwitch   :=-U
SourceSwitch           :=-c 
ObjdumpSwitch          :=-S
ObjcopySwitch          :=-O ihex
ObjcopyBinSwitch       :=-O binary
OutputFile             :=$(ProjectName)
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
ObjectsFileList        :=wujian100_open-hello_world.txt
MakeDirCommand         :=mkdir
LinkOptions            := -mabi=ilp32e -march=rv32emc  -nostartfiles -Wl,--gc-sections -T"$(ProjectPath)/../../../../board/wujian100_open_evb/gcc_csky.ld"
LinkOtherFlagsOption   :=-Wl,-zmax-page-size=1024
IncludePackagePath     :=
IncludeCPath           := $(IncludeSwitch). $(IncludeSwitch)../../../../board/wujian100_open_evb/include $(IncludeSwitch)../../../../csi_core/include $(IncludeSwitch)../../../../csi_driver/include $(IncludeSwitch)../../../../csi_driver/wujian100_open/include $(IncludeSwitch)../../../../csi_kernel/include $(IncludeSwitch)../../../../libs/include $(IncludeSwitch)../configs $(IncludeSwitch)../LED $(IncludeSwitch)../key_gpio_intr $(IncludeSwitch)../oled128_32 $(IncludeSwitch)../sd_driver  
IncludeAPath           := $(IncludeSwitch). $(IncludeSwitch)../configs $(IncludeSwitch)../LED $(IncludeSwitch)../key_gpio_intr $(IncludeSwitch)../oled128_32 $(IncludeSwitch)../sd_driver  
Libs                   := -Wl,--start-group  -Wl,--end-group $(LibrarySwitch)m  
ArLibs                 := "m" 
PackagesLibPath        :=
LibPath                := $(PackagesLibPath) 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       :=riscv64-unknown-elf-ar rcu
CXX      :=riscv64-unknown-elf-g++
CC       :=riscv64-unknown-elf-gcc
AS       :=riscv64-unknown-elf-gcc
OBJDUMP  :=riscv64-unknown-elf-objdump
OBJCOPY  :=riscv64-unknown-elf-objcopy
CXXFLAGS := -mabi=ilp32e -march=rv32emc    -Os  -g3  -Wall -ffunction-sections -fdata-sections 
CFLAGS   := -mabi=ilp32e -march=rv32emc    -Os  -g3  -Wall -ffunction-sections -fdata-sections 
ASFLAGS  := -mabi=ilp32e -march=rv32emc    -Wa,--gdwarf2    


Objects0=$(IntermediateDirectory)/wujian100_open_evb_board_init$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_wj_dmac_v2$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_wj_irq$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_wj_pwm$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_wj_rtc$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_wj_usi$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_wj_usi_iic$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_wj_usi_spi$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_wj_usi_usart$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_wj_usi_wrap$(ObjectSuffix) \
	$(IntermediateDirectory)/wujian100_open_devices$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_wj_oip_gpio$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_wj_oip_timer$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_wj_oip_wdt$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_isr$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_lib$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_novic_irq_tbl$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_pinmux$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_startup$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_sys_freq$(ObjectSuffix) \
	$(IntermediateDirectory)/wujian100_open_system$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_trap_c$(ObjectSuffix) $(IntermediateDirectory)/wujian100_open_vectors$(ObjectSuffix) $(IntermediateDirectory)/libc_clock_gettime$(ObjectSuffix) $(IntermediateDirectory)/libc__init$(ObjectSuffix) $(IntermediateDirectory)/libc_malloc$(ObjectSuffix) $(IntermediateDirectory)/libc_minilibc_port$(ObjectSuffix) $(IntermediateDirectory)/mm_dq_addlast$(ObjectSuffix) $(IntermediateDirectory)/mm_dq_rem$(ObjectSuffix) $(IntermediateDirectory)/mm_lib_mallinfo$(ObjectSuffix) \
	$(IntermediateDirectory)/mm_mm_addfreechunk$(ObjectSuffix) $(IntermediateDirectory)/mm_mm_free$(ObjectSuffix) $(IntermediateDirectory)/mm_mm_initialize$(ObjectSuffix) $(IntermediateDirectory)/mm_mm_leak$(ObjectSuffix) $(IntermediateDirectory)/mm_mm_mallinfo$(ObjectSuffix) $(IntermediateDirectory)/mm_mm_malloc$(ObjectSuffix) $(IntermediateDirectory)/mm_mm_size2ndx$(ObjectSuffix) $(IntermediateDirectory)/ringbuffer_ringbuffer$(ObjectSuffix) $(IntermediateDirectory)/syslog_syslog$(ObjectSuffix) $(IntermediateDirectory)/hello_world_main$(ObjectSuffix) \
	$(IntermediateDirectory)/key_gpio_intr_key$(ObjectSuffix) 

Objects1=$(IntermediateDirectory)/LED_led$(ObjectSuffix) $(IntermediateDirectory)/oled128_32_oled128_32$(ObjectSuffix) $(IntermediateDirectory)/sd_driver_all$(ObjectSuffix) $(IntermediateDirectory)/sd_driver_ff$(ObjectSuffix) $(IntermediateDirectory)/sd_driver_softspi_sd_mmc$(ObjectSuffix) 



Objects=$(Objects0) $(Objects1) 

##
## Main Build Targets 
##
.PHONY: all
all: $(IntermediateDirectory)/$(OutputFile)

$(IntermediateDirectory)/$(OutputFile):  $(Objects) Always_Link 
	$(LinkerName) $(OutputSwitch) $(IntermediateDirectory)/$(OutputFile)$(ExeSuffix) $(LinkerNameoption) $(LinkOtherFlagsOption)  @$(ObjectsFileList) $(LibraryPathSwitch)C:/Users/hnaym/Desktop/T_head_data/nexys_video/IO_LAB_nexysvideo/sdk/libs  -Wl,--whole-archive $(LibrarySwitch)newlib_wrap   -Wl,--no-whole-archive  $(LinkOptions) $(LibPath) $(Libs)
	$(OBJDUMP) $(ObjdumpSwitch) $(ProjectPath)/$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix)  > $(ProjectPath)/Lst/$(OutputFile)$(DisassemSuffix) 
	@echo size of target:
	@$(SIZE) $(ProjectPath)$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix) 
	@echo -n checksum value of target:  
	@$(CHECKSUM) $(ProjectPath)/$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix) 
	@$(ProjectName).modify.bat $(IntermediateDirectory) $(OutputFile)$(ExeSuffix) 

Always_Link:


##
## Objects
##
$(IntermediateDirectory)/wujian100_open_evb_board_init$(ObjectSuffix): ../../../../board/wujian100_open_evb/board_init.c  
	$(CC) $(SourceSwitch) ../../../../board/wujian100_open_evb/board_init.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_evb_board_init$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_evb_board_init$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_evb_board_init$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_evb_board_init$(PreprocessSuffix): ../../../../board/wujian100_open_evb/board_init.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_evb_board_init$(PreprocessSuffix) ../../../../board/wujian100_open_evb/board_init.c

$(IntermediateDirectory)/wujian100_open_wj_dmac_v2$(ObjectSuffix): ../../../../csi_driver/wujian100_open/wj_dmac_v2.c  
	$(CC) $(SourceSwitch) ../../../../csi_driver/wujian100_open/wj_dmac_v2.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_wj_dmac_v2$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_wj_dmac_v2$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_wj_dmac_v2$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_wj_dmac_v2$(PreprocessSuffix): ../../../../csi_driver/wujian100_open/wj_dmac_v2.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_wj_dmac_v2$(PreprocessSuffix) ../../../../csi_driver/wujian100_open/wj_dmac_v2.c

$(IntermediateDirectory)/wujian100_open_wj_irq$(ObjectSuffix): ../../../../csi_driver/wujian100_open/wj_irq.c  
	$(CC) $(SourceSwitch) ../../../../csi_driver/wujian100_open/wj_irq.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_wj_irq$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_wj_irq$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_wj_irq$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_wj_irq$(PreprocessSuffix): ../../../../csi_driver/wujian100_open/wj_irq.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_wj_irq$(PreprocessSuffix) ../../../../csi_driver/wujian100_open/wj_irq.c

$(IntermediateDirectory)/wujian100_open_wj_pwm$(ObjectSuffix): ../../../../csi_driver/wujian100_open/wj_pwm.c  
	$(CC) $(SourceSwitch) ../../../../csi_driver/wujian100_open/wj_pwm.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_wj_pwm$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_wj_pwm$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_wj_pwm$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_wj_pwm$(PreprocessSuffix): ../../../../csi_driver/wujian100_open/wj_pwm.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_wj_pwm$(PreprocessSuffix) ../../../../csi_driver/wujian100_open/wj_pwm.c

$(IntermediateDirectory)/wujian100_open_wj_rtc$(ObjectSuffix): ../../../../csi_driver/wujian100_open/wj_rtc.c  
	$(CC) $(SourceSwitch) ../../../../csi_driver/wujian100_open/wj_rtc.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_wj_rtc$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_wj_rtc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_wj_rtc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_wj_rtc$(PreprocessSuffix): ../../../../csi_driver/wujian100_open/wj_rtc.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_wj_rtc$(PreprocessSuffix) ../../../../csi_driver/wujian100_open/wj_rtc.c

$(IntermediateDirectory)/wujian100_open_wj_usi$(ObjectSuffix): ../../../../csi_driver/wujian100_open/wj_usi.c  
	$(CC) $(SourceSwitch) ../../../../csi_driver/wujian100_open/wj_usi.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_wj_usi$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_wj_usi$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_wj_usi$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_wj_usi$(PreprocessSuffix): ../../../../csi_driver/wujian100_open/wj_usi.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_wj_usi$(PreprocessSuffix) ../../../../csi_driver/wujian100_open/wj_usi.c

$(IntermediateDirectory)/wujian100_open_wj_usi_iic$(ObjectSuffix): ../../../../csi_driver/wujian100_open/wj_usi_iic.c  
	$(CC) $(SourceSwitch) ../../../../csi_driver/wujian100_open/wj_usi_iic.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_wj_usi_iic$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_wj_usi_iic$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_wj_usi_iic$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_wj_usi_iic$(PreprocessSuffix): ../../../../csi_driver/wujian100_open/wj_usi_iic.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_wj_usi_iic$(PreprocessSuffix) ../../../../csi_driver/wujian100_open/wj_usi_iic.c

$(IntermediateDirectory)/wujian100_open_wj_usi_spi$(ObjectSuffix): ../../../../csi_driver/wujian100_open/wj_usi_spi.c  
	$(CC) $(SourceSwitch) ../../../../csi_driver/wujian100_open/wj_usi_spi.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_wj_usi_spi$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_wj_usi_spi$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_wj_usi_spi$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_wj_usi_spi$(PreprocessSuffix): ../../../../csi_driver/wujian100_open/wj_usi_spi.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_wj_usi_spi$(PreprocessSuffix) ../../../../csi_driver/wujian100_open/wj_usi_spi.c

$(IntermediateDirectory)/wujian100_open_wj_usi_usart$(ObjectSuffix): ../../../../csi_driver/wujian100_open/wj_usi_usart.c  
	$(CC) $(SourceSwitch) ../../../../csi_driver/wujian100_open/wj_usi_usart.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_wj_usi_usart$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_wj_usi_usart$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_wj_usi_usart$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_wj_usi_usart$(PreprocessSuffix): ../../../../csi_driver/wujian100_open/wj_usi_usart.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_wj_usi_usart$(PreprocessSuffix) ../../../../csi_driver/wujian100_open/wj_usi_usart.c

$(IntermediateDirectory)/wujian100_open_wj_usi_wrap$(ObjectSuffix): ../../../../csi_driver/wujian100_open/wj_usi_wrap.c  
	$(CC) $(SourceSwitch) ../../../../csi_driver/wujian100_open/wj_usi_wrap.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_wj_usi_wrap$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_wj_usi_wrap$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_wj_usi_wrap$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_wj_usi_wrap$(PreprocessSuffix): ../../../../csi_driver/wujian100_open/wj_usi_wrap.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_wj_usi_wrap$(PreprocessSuffix) ../../../../csi_driver/wujian100_open/wj_usi_wrap.c

$(IntermediateDirectory)/wujian100_open_devices$(ObjectSuffix): ../../../../csi_driver/wujian100_open/devices.c  
	$(CC) $(SourceSwitch) ../../../../csi_driver/wujian100_open/devices.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_devices$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_devices$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_devices$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_devices$(PreprocessSuffix): ../../../../csi_driver/wujian100_open/devices.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_devices$(PreprocessSuffix) ../../../../csi_driver/wujian100_open/devices.c

$(IntermediateDirectory)/wujian100_open_wj_oip_gpio$(ObjectSuffix): ../../../../csi_driver/wujian100_open/wj_oip_gpio.c  
	$(CC) $(SourceSwitch) ../../../../csi_driver/wujian100_open/wj_oip_gpio.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_wj_oip_gpio$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_wj_oip_gpio$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_wj_oip_gpio$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_wj_oip_gpio$(PreprocessSuffix): ../../../../csi_driver/wujian100_open/wj_oip_gpio.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_wj_oip_gpio$(PreprocessSuffix) ../../../../csi_driver/wujian100_open/wj_oip_gpio.c

$(IntermediateDirectory)/wujian100_open_wj_oip_timer$(ObjectSuffix): ../../../../csi_driver/wujian100_open/wj_oip_timer.c  
	$(CC) $(SourceSwitch) ../../../../csi_driver/wujian100_open/wj_oip_timer.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_wj_oip_timer$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_wj_oip_timer$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_wj_oip_timer$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_wj_oip_timer$(PreprocessSuffix): ../../../../csi_driver/wujian100_open/wj_oip_timer.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_wj_oip_timer$(PreprocessSuffix) ../../../../csi_driver/wujian100_open/wj_oip_timer.c

$(IntermediateDirectory)/wujian100_open_wj_oip_wdt$(ObjectSuffix): ../../../../csi_driver/wujian100_open/wj_oip_wdt.c  
	$(CC) $(SourceSwitch) ../../../../csi_driver/wujian100_open/wj_oip_wdt.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_wj_oip_wdt$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_wj_oip_wdt$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_wj_oip_wdt$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_wj_oip_wdt$(PreprocessSuffix): ../../../../csi_driver/wujian100_open/wj_oip_wdt.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_wj_oip_wdt$(PreprocessSuffix) ../../../../csi_driver/wujian100_open/wj_oip_wdt.c

$(IntermediateDirectory)/wujian100_open_isr$(ObjectSuffix): ../../../../csi_driver/wujian100_open/isr.c  
	$(CC) $(SourceSwitch) ../../../../csi_driver/wujian100_open/isr.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_isr$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_isr$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_isr$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_isr$(PreprocessSuffix): ../../../../csi_driver/wujian100_open/isr.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_isr$(PreprocessSuffix) ../../../../csi_driver/wujian100_open/isr.c

$(IntermediateDirectory)/wujian100_open_lib$(ObjectSuffix): ../../../../csi_driver/wujian100_open/lib.c  
	$(CC) $(SourceSwitch) ../../../../csi_driver/wujian100_open/lib.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_lib$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_lib$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_lib$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_lib$(PreprocessSuffix): ../../../../csi_driver/wujian100_open/lib.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_lib$(PreprocessSuffix) ../../../../csi_driver/wujian100_open/lib.c

$(IntermediateDirectory)/wujian100_open_novic_irq_tbl$(ObjectSuffix): ../../../../csi_driver/wujian100_open/novic_irq_tbl.c  
	$(CC) $(SourceSwitch) ../../../../csi_driver/wujian100_open/novic_irq_tbl.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_novic_irq_tbl$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_novic_irq_tbl$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_novic_irq_tbl$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_novic_irq_tbl$(PreprocessSuffix): ../../../../csi_driver/wujian100_open/novic_irq_tbl.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_novic_irq_tbl$(PreprocessSuffix) ../../../../csi_driver/wujian100_open/novic_irq_tbl.c

$(IntermediateDirectory)/wujian100_open_pinmux$(ObjectSuffix): ../../../../csi_driver/wujian100_open/pinmux.c  
	$(CC) $(SourceSwitch) ../../../../csi_driver/wujian100_open/pinmux.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_pinmux$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_pinmux$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_pinmux$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_pinmux$(PreprocessSuffix): ../../../../csi_driver/wujian100_open/pinmux.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_pinmux$(PreprocessSuffix) ../../../../csi_driver/wujian100_open/pinmux.c

$(IntermediateDirectory)/wujian100_open_startup$(ObjectSuffix): ../../../../csi_driver/wujian100_open/startup.S  
	$(AS) $(SourceSwitch) ../../../../csi_driver/wujian100_open/startup.S $(ASFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_startup$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_startup$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_startup$(ObjectSuffix) $(IncludeAPath) $(IncludePackagePath)
Lst/wujian100_open_startup$(PreprocessSuffix): ../../../../csi_driver/wujian100_open/startup.S
	$(CC) $(CFLAGS)$(IncludeAPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_startup$(PreprocessSuffix) ../../../../csi_driver/wujian100_open/startup.S

$(IntermediateDirectory)/wujian100_open_sys_freq$(ObjectSuffix): ../../../../csi_driver/wujian100_open/sys_freq.c  
	$(CC) $(SourceSwitch) ../../../../csi_driver/wujian100_open/sys_freq.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_sys_freq$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_sys_freq$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_sys_freq$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_sys_freq$(PreprocessSuffix): ../../../../csi_driver/wujian100_open/sys_freq.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_sys_freq$(PreprocessSuffix) ../../../../csi_driver/wujian100_open/sys_freq.c

$(IntermediateDirectory)/wujian100_open_system$(ObjectSuffix): ../../../../csi_driver/wujian100_open/system.c  
	$(CC) $(SourceSwitch) ../../../../csi_driver/wujian100_open/system.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_system$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_system$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_system$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_system$(PreprocessSuffix): ../../../../csi_driver/wujian100_open/system.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_system$(PreprocessSuffix) ../../../../csi_driver/wujian100_open/system.c

$(IntermediateDirectory)/wujian100_open_trap_c$(ObjectSuffix): ../../../../csi_driver/wujian100_open/trap_c.c  
	$(CC) $(SourceSwitch) ../../../../csi_driver/wujian100_open/trap_c.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_trap_c$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_trap_c$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_trap_c$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/wujian100_open_trap_c$(PreprocessSuffix): ../../../../csi_driver/wujian100_open/trap_c.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_trap_c$(PreprocessSuffix) ../../../../csi_driver/wujian100_open/trap_c.c

$(IntermediateDirectory)/wujian100_open_vectors$(ObjectSuffix): ../../../../csi_driver/wujian100_open/vectors.S  
	$(AS) $(SourceSwitch) ../../../../csi_driver/wujian100_open/vectors.S $(ASFLAGS) -MMD -MP -MT$(IntermediateDirectory)/wujian100_open_vectors$(ObjectSuffix) -MF$(IntermediateDirectory)/wujian100_open_vectors$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/wujian100_open_vectors$(ObjectSuffix) $(IncludeAPath) $(IncludePackagePath)
Lst/wujian100_open_vectors$(PreprocessSuffix): ../../../../csi_driver/wujian100_open/vectors.S
	$(CC) $(CFLAGS)$(IncludeAPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/wujian100_open_vectors$(PreprocessSuffix) ../../../../csi_driver/wujian100_open/vectors.S

$(IntermediateDirectory)/libc_clock_gettime$(ObjectSuffix): ../../../../libs/libc/clock_gettime.c  
	$(CC) $(SourceSwitch) ../../../../libs/libc/clock_gettime.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libc_clock_gettime$(ObjectSuffix) -MF$(IntermediateDirectory)/libc_clock_gettime$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libc_clock_gettime$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libc_clock_gettime$(PreprocessSuffix): ../../../../libs/libc/clock_gettime.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libc_clock_gettime$(PreprocessSuffix) ../../../../libs/libc/clock_gettime.c

$(IntermediateDirectory)/libc__init$(ObjectSuffix): ../../../../libs/libc/_init.c  
	$(CC) $(SourceSwitch) ../../../../libs/libc/_init.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libc__init$(ObjectSuffix) -MF$(IntermediateDirectory)/libc__init$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libc__init$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libc__init$(PreprocessSuffix): ../../../../libs/libc/_init.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libc__init$(PreprocessSuffix) ../../../../libs/libc/_init.c

$(IntermediateDirectory)/libc_malloc$(ObjectSuffix): ../../../../libs/libc/malloc.c  
	$(CC) $(SourceSwitch) ../../../../libs/libc/malloc.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libc_malloc$(ObjectSuffix) -MF$(IntermediateDirectory)/libc_malloc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libc_malloc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libc_malloc$(PreprocessSuffix): ../../../../libs/libc/malloc.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libc_malloc$(PreprocessSuffix) ../../../../libs/libc/malloc.c

$(IntermediateDirectory)/libc_minilibc_port$(ObjectSuffix): ../../../../libs/libc/minilibc_port.c  
	$(CC) $(SourceSwitch) ../../../../libs/libc/minilibc_port.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libc_minilibc_port$(ObjectSuffix) -MF$(IntermediateDirectory)/libc_minilibc_port$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libc_minilibc_port$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libc_minilibc_port$(PreprocessSuffix): ../../../../libs/libc/minilibc_port.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libc_minilibc_port$(PreprocessSuffix) ../../../../libs/libc/minilibc_port.c

$(IntermediateDirectory)/mm_dq_addlast$(ObjectSuffix): ../../../../libs/mm/dq_addlast.c  
	$(CC) $(SourceSwitch) ../../../../libs/mm/dq_addlast.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/mm_dq_addlast$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_dq_addlast$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/mm_dq_addlast$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/mm_dq_addlast$(PreprocessSuffix): ../../../../libs/mm/dq_addlast.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_dq_addlast$(PreprocessSuffix) ../../../../libs/mm/dq_addlast.c

$(IntermediateDirectory)/mm_dq_rem$(ObjectSuffix): ../../../../libs/mm/dq_rem.c  
	$(CC) $(SourceSwitch) ../../../../libs/mm/dq_rem.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/mm_dq_rem$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_dq_rem$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/mm_dq_rem$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/mm_dq_rem$(PreprocessSuffix): ../../../../libs/mm/dq_rem.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_dq_rem$(PreprocessSuffix) ../../../../libs/mm/dq_rem.c

$(IntermediateDirectory)/mm_lib_mallinfo$(ObjectSuffix): ../../../../libs/mm/lib_mallinfo.c  
	$(CC) $(SourceSwitch) ../../../../libs/mm/lib_mallinfo.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/mm_lib_mallinfo$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_lib_mallinfo$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/mm_lib_mallinfo$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/mm_lib_mallinfo$(PreprocessSuffix): ../../../../libs/mm/lib_mallinfo.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_lib_mallinfo$(PreprocessSuffix) ../../../../libs/mm/lib_mallinfo.c

$(IntermediateDirectory)/mm_mm_addfreechunk$(ObjectSuffix): ../../../../libs/mm/mm_addfreechunk.c  
	$(CC) $(SourceSwitch) ../../../../libs/mm/mm_addfreechunk.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/mm_mm_addfreechunk$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_mm_addfreechunk$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/mm_mm_addfreechunk$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/mm_mm_addfreechunk$(PreprocessSuffix): ../../../../libs/mm/mm_addfreechunk.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_mm_addfreechunk$(PreprocessSuffix) ../../../../libs/mm/mm_addfreechunk.c

$(IntermediateDirectory)/mm_mm_free$(ObjectSuffix): ../../../../libs/mm/mm_free.c  
	$(CC) $(SourceSwitch) ../../../../libs/mm/mm_free.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/mm_mm_free$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_mm_free$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/mm_mm_free$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/mm_mm_free$(PreprocessSuffix): ../../../../libs/mm/mm_free.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_mm_free$(PreprocessSuffix) ../../../../libs/mm/mm_free.c

$(IntermediateDirectory)/mm_mm_initialize$(ObjectSuffix): ../../../../libs/mm/mm_initialize.c  
	$(CC) $(SourceSwitch) ../../../../libs/mm/mm_initialize.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/mm_mm_initialize$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_mm_initialize$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/mm_mm_initialize$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/mm_mm_initialize$(PreprocessSuffix): ../../../../libs/mm/mm_initialize.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_mm_initialize$(PreprocessSuffix) ../../../../libs/mm/mm_initialize.c

$(IntermediateDirectory)/mm_mm_leak$(ObjectSuffix): ../../../../libs/mm/mm_leak.c  
	$(CC) $(SourceSwitch) ../../../../libs/mm/mm_leak.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/mm_mm_leak$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_mm_leak$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/mm_mm_leak$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/mm_mm_leak$(PreprocessSuffix): ../../../../libs/mm/mm_leak.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_mm_leak$(PreprocessSuffix) ../../../../libs/mm/mm_leak.c

$(IntermediateDirectory)/mm_mm_mallinfo$(ObjectSuffix): ../../../../libs/mm/mm_mallinfo.c  
	$(CC) $(SourceSwitch) ../../../../libs/mm/mm_mallinfo.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/mm_mm_mallinfo$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_mm_mallinfo$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/mm_mm_mallinfo$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/mm_mm_mallinfo$(PreprocessSuffix): ../../../../libs/mm/mm_mallinfo.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_mm_mallinfo$(PreprocessSuffix) ../../../../libs/mm/mm_mallinfo.c

$(IntermediateDirectory)/mm_mm_malloc$(ObjectSuffix): ../../../../libs/mm/mm_malloc.c  
	$(CC) $(SourceSwitch) ../../../../libs/mm/mm_malloc.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/mm_mm_malloc$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_mm_malloc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/mm_mm_malloc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/mm_mm_malloc$(PreprocessSuffix): ../../../../libs/mm/mm_malloc.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_mm_malloc$(PreprocessSuffix) ../../../../libs/mm/mm_malloc.c

$(IntermediateDirectory)/mm_mm_size2ndx$(ObjectSuffix): ../../../../libs/mm/mm_size2ndx.c  
	$(CC) $(SourceSwitch) ../../../../libs/mm/mm_size2ndx.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/mm_mm_size2ndx$(ObjectSuffix) -MF$(IntermediateDirectory)/mm_mm_size2ndx$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/mm_mm_size2ndx$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/mm_mm_size2ndx$(PreprocessSuffix): ../../../../libs/mm/mm_size2ndx.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/mm_mm_size2ndx$(PreprocessSuffix) ../../../../libs/mm/mm_size2ndx.c

$(IntermediateDirectory)/ringbuffer_ringbuffer$(ObjectSuffix): ../../../../libs/ringbuffer/ringbuffer.c  
	$(CC) $(SourceSwitch) ../../../../libs/ringbuffer/ringbuffer.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ringbuffer_ringbuffer$(ObjectSuffix) -MF$(IntermediateDirectory)/ringbuffer_ringbuffer$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ringbuffer_ringbuffer$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/ringbuffer_ringbuffer$(PreprocessSuffix): ../../../../libs/ringbuffer/ringbuffer.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ringbuffer_ringbuffer$(PreprocessSuffix) ../../../../libs/ringbuffer/ringbuffer.c

$(IntermediateDirectory)/syslog_syslog$(ObjectSuffix): ../../../../libs/syslog/syslog.c  
	$(CC) $(SourceSwitch) ../../../../libs/syslog/syslog.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/syslog_syslog$(ObjectSuffix) -MF$(IntermediateDirectory)/syslog_syslog$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/syslog_syslog$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/syslog_syslog$(PreprocessSuffix): ../../../../libs/syslog/syslog.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/syslog_syslog$(PreprocessSuffix) ../../../../libs/syslog/syslog.c

$(IntermediateDirectory)/hello_world_main$(ObjectSuffix): ../main.c  
	$(CC) $(SourceSwitch) ../main.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/hello_world_main$(ObjectSuffix) -MF$(IntermediateDirectory)/hello_world_main$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/hello_world_main$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/hello_world_main$(PreprocessSuffix): ../main.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/hello_world_main$(PreprocessSuffix) ../main.c

$(IntermediateDirectory)/key_gpio_intr_key$(ObjectSuffix): ../key_gpio_intr/key.c  
	$(CC) $(SourceSwitch) ../key_gpio_intr/key.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/key_gpio_intr_key$(ObjectSuffix) -MF$(IntermediateDirectory)/key_gpio_intr_key$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/key_gpio_intr_key$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/key_gpio_intr_key$(PreprocessSuffix): ../key_gpio_intr/key.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/key_gpio_intr_key$(PreprocessSuffix) ../key_gpio_intr/key.c

$(IntermediateDirectory)/LED_led$(ObjectSuffix): ../LED/led.c  
	$(CC) $(SourceSwitch) ../LED/led.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/LED_led$(ObjectSuffix) -MF$(IntermediateDirectory)/LED_led$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/LED_led$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/LED_led$(PreprocessSuffix): ../LED/led.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/LED_led$(PreprocessSuffix) ../LED/led.c

$(IntermediateDirectory)/oled128_32_oled128_32$(ObjectSuffix): ../oled128_32/oled128_32.c  
	$(CC) $(SourceSwitch) ../oled128_32/oled128_32.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/oled128_32_oled128_32$(ObjectSuffix) -MF$(IntermediateDirectory)/oled128_32_oled128_32$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/oled128_32_oled128_32$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/oled128_32_oled128_32$(PreprocessSuffix): ../oled128_32/oled128_32.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/oled128_32_oled128_32$(PreprocessSuffix) ../oled128_32/oled128_32.c

$(IntermediateDirectory)/sd_driver_all$(ObjectSuffix): ../sd_driver/all.c  
	$(CC) $(SourceSwitch) ../sd_driver/all.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/sd_driver_all$(ObjectSuffix) -MF$(IntermediateDirectory)/sd_driver_all$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/sd_driver_all$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/sd_driver_all$(PreprocessSuffix): ../sd_driver/all.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/sd_driver_all$(PreprocessSuffix) ../sd_driver/all.c

$(IntermediateDirectory)/sd_driver_ff$(ObjectSuffix): ../sd_driver/ff.c  
	$(CC) $(SourceSwitch) ../sd_driver/ff.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/sd_driver_ff$(ObjectSuffix) -MF$(IntermediateDirectory)/sd_driver_ff$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/sd_driver_ff$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/sd_driver_ff$(PreprocessSuffix): ../sd_driver/ff.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/sd_driver_ff$(PreprocessSuffix) ../sd_driver/ff.c

$(IntermediateDirectory)/sd_driver_softspi_sd_mmc$(ObjectSuffix): ../sd_driver/softspi_sd_mmc.c  
	$(CC) $(SourceSwitch) ../sd_driver/softspi_sd_mmc.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/sd_driver_softspi_sd_mmc$(ObjectSuffix) -MF$(IntermediateDirectory)/sd_driver_softspi_sd_mmc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/sd_driver_softspi_sd_mmc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/sd_driver_softspi_sd_mmc$(PreprocessSuffix): ../sd_driver/softspi_sd_mmc.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/sd_driver_softspi_sd_mmc$(PreprocessSuffix) ../sd_driver/softspi_sd_mmc.c


-include $(IntermediateDirectory)/*$(DependSuffix)
