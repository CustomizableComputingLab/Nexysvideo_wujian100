#include "stdio.h"
#include "pin_name.h"
#include "soc.h"
#include "drv_gpio.h"
#include "oled128_32.h"
#include "oledfont.h"

//cs is wired to gnd default

gpio_pin_handle_t OLED_vdd_pin_handle_t = NULL;		//OLED_vdd_			PA26            low enable
gpio_pin_handle_t OLED_vbat_pin_handle_t = NULL;	//OLED_vbat_		PA25            low enable

gpio_pin_handle_t OLED_res_pin_handle_t = NULL;		//OLED_res_			PA22
gpio_pin_handle_t OLED_scl_pin_handle_t = NULL;		//OLED_scl_			PA23
gpio_pin_handle_t OLED_dc_pin_handle_t = NULL;		//OLED_dc_			PA21
gpio_pin_handle_t OLED_sda_pin_handle_t = NULL;		//OLED_sda_			PA24


#define OLED_SCL_Clr() csi_gpio_pin_write(OLED_scl_pin_handle_t,0)
#define OLED_SCL_Set() csi_gpio_pin_write(OLED_scl_pin_handle_t,1)

#define OLED_SDA_Clr() csi_gpio_pin_write(OLED_sda_pin_handle_t,0)
#define OLED_SDA_Set() csi_gpio_pin_write(OLED_sda_pin_handle_t,1)

#define OLED_RES_Clr() csi_gpio_pin_write(OLED_res_pin_handle_t,0)
#define OLED_RES_Set() csi_gpio_pin_write(OLED_res_pin_handle_t,1)

#define OLED_DC_Clr() csi_gpio_pin_write(OLED_dc_pin_handle_t,0)
#define OLED_DC_Set() csi_gpio_pin_write(OLED_dc_pin_handle_t,1)

#define OLED_VDD_Clr() csi_gpio_pin_write(OLED_vdd_pin_handle_t,0)
#define OLED_VDD_Set() csi_gpio_pin_write(OLED_vdd_pin_handle_t,1)

#define OLED_VBAT_Clr() csi_gpio_pin_write(OLED_vbat_pin_handle_t,0)
#define OLED_VBAT_Set() csi_gpio_pin_write(OLED_vbat_pin_handle_t,1)


extern void mdelay(uint32_t ms);

static void gpio_interrupt_handler(int32_t idx)
{

}

static void oled_pin_init()
{	
	printf("OLED_SPI_INIT \n");																   

    OLED_vdd_pin_handle_t = csi_gpio_pin_initialize(PA26, gpio_interrupt_handler);         //                         				            PA26
    csi_gpio_pin_config_mode(OLED_vdd_pin_handle_t, GPIO_MODE_PULLNONE);
    csi_gpio_pin_config_direction(OLED_vdd_pin_handle_t, GPIO_DIRECTION_OUTPUT);
    
    OLED_vbat_pin_handle_t = csi_gpio_pin_initialize(PA25, gpio_interrupt_handler);        //                         				            PA25    
    csi_gpio_pin_config_mode(OLED_vbat_pin_handle_t, GPIO_MODE_PULLNONE);
    csi_gpio_pin_config_direction(OLED_vbat_pin_handle_t, GPIO_DIRECTION_OUTPUT);

    OLED_res_pin_handle_t = csi_gpio_pin_initialize(PA22, gpio_interrupt_handler);         //                         				            PA22
    csi_gpio_pin_config_mode(OLED_res_pin_handle_t, GPIO_MODE_PULLNONE);
    csi_gpio_pin_config_direction(OLED_res_pin_handle_t, GPIO_DIRECTION_OUTPUT);

    OLED_scl_pin_handle_t = csi_gpio_pin_initialize(PA23, gpio_interrupt_handler);        //                                                    PA23
    csi_gpio_pin_config_mode(OLED_scl_pin_handle_t, GPIO_MODE_PULLNONE);
    csi_gpio_pin_config_direction(OLED_scl_pin_handle_t, GPIO_DIRECTION_OUTPUT);

    OLED_dc_pin_handle_t = csi_gpio_pin_initialize(PA21, gpio_interrupt_handler);         //                                                    PA21                                                
    csi_gpio_pin_config_mode(OLED_dc_pin_handle_t, GPIO_MODE_PULLNONE);
    csi_gpio_pin_config_direction(OLED_dc_pin_handle_t, GPIO_DIRECTION_OUTPUT);

    OLED_sda_pin_handle_t = csi_gpio_pin_initialize(PA24, gpio_interrupt_handler);        //                                                    PA24
    csi_gpio_pin_config_mode(OLED_sda_pin_handle_t, GPIO_MODE_PULLNONE);
    csi_gpio_pin_config_direction(OLED_sda_pin_handle_t, GPIO_DIRECTION_OUTPUT);
    
}


//OLED的显存
//存放格式如下.
//[0]0 1 2 3 ... 127	
//[1]0 1 2 3 ... 127	
//[2]0 1 2 3 ... 127	
//[3]0 1 2 3 ... 127	
//[4]0 1 2 3 ... 127	
//[5]0 1 2 3 ... 127	
//[6]0 1 2 3 ... 127	
//[7]0 1 2 3 ... 127 			   


//反显函数
void OLED_ColorTurn(char i)
{
	if(i==0)
		{
			OLED_WR_Byte(0xA6,OLED_CMD);//正常显示
		}
	if(i==1)
		{
			OLED_WR_Byte(0xA7,OLED_CMD);//反色显示
		}
}

//屏幕旋转180度
void OLED_DisplayTurn(char i)
{
	if(i==0)
		{
			OLED_WR_Byte(0xC8,OLED_CMD);//正常显示
			OLED_WR_Byte(0xA1,OLED_CMD);
		}
	if(i==1)
		{
			OLED_WR_Byte(0xC0,OLED_CMD);//反转显示
			OLED_WR_Byte(0xA0,OLED_CMD);
		}
}


void OLED_WR_Byte(char dat,char cmd)
{	
	char i;			  
	if(cmd)
	  OLED_DC_Set();
	else 
	  OLED_DC_Clr();		  
	for(i=0;i<8;i++)
	{			  
		OLED_SCL_Clr();
		if(dat&0x80)
		{
		 OLED_SDA_Set();
		}
		else
		{
		 OLED_SDA_Clr();
		}
	  OLED_SCL_Set();
		dat<<=1;   
	}				 		  
	OLED_DC_Set();   	  
} 

//坐标设置

void OLED_Set_Pos(char x, char y) 
{
	OLED_WR_Byte(0xb0+y,OLED_CMD);
	OLED_WR_Byte(((x&0xf0)>>4)|0x10,OLED_CMD);
	OLED_WR_Byte((x&0x0f),OLED_CMD);
}   	  
//开启OLED显示    
void OLED_Display_On(void)
{
	OLED_WR_Byte(0X8D,OLED_CMD);  //SET DCDC命令
	OLED_WR_Byte(0X14,OLED_CMD);  //DCDC ON
	OLED_WR_Byte(0XAF,OLED_CMD);  //DISPLAY ON
}
//关闭OLED显示     
void OLED_Display_Off(void)
{
	OLED_WR_Byte(0X8D,OLED_CMD);  //SET DCDC命令
	OLED_WR_Byte(0X10,OLED_CMD);  //DCDC OFF
	OLED_WR_Byte(0XAE,OLED_CMD);  //DISPLAY OFF
}		   			 
//清屏函数,清完屏,整个屏幕是黑色的!和没点亮一样!!!	  
void OLED_Clear(void)  
{  
	char i,n;		    
	for(i=0;i<4;i++)  
	{  
		OLED_WR_Byte (0xb0+i,OLED_CMD);    //设置页地址（0~7）
		OLED_WR_Byte (0x00,OLED_CMD);      //设置显示位置—列低地址
		OLED_WR_Byte (0x10,OLED_CMD);      //设置显示位置—列高地址   
		for(n=0;n<128;n++)OLED_WR_Byte(0,OLED_DATA); 
	} //更新显示
}

//在指定位置显示一个字符,包括部分字符
//x:0~127
//y:0~63				 
//sizey:选择字体 6x8  8x16
void OLED_ShowChar(char x,char y,char chr,char sizey)
{      	
	char c=0,sizex=sizey/2;
	u16 i=0,size1;
	if(sizey==8)size1=6;
	else size1=(sizey/8+((sizey%8)?1:0))*(sizey/2);
	c=chr-' ';//得到偏移后的值
	OLED_Set_Pos(x,y);
	for(i=0;i<size1;i++)
	{
		if(i%sizex==0&&sizey!=8) OLED_Set_Pos(x,y++);
		if(sizey==8) OLED_WR_Byte(asc2_0806[c][i],OLED_DATA);//6X8字号
		else if(sizey==16) OLED_WR_Byte(asc2_1608[c][i],OLED_DATA);//8x16字号
//		else if(sizey==xx) OLED_WR_Byte(asc2_xxxx[c][i],OLED_DATA);//用户添加字号
		else return;
	}
}
//m^n函数
u32 oled_pow(char m,char n)
{
	u32 result=1;	 
	while(n--)result*=m;    
	return result;
}				  
//显示数字
//x,y :起点坐标
//num:要显示的数字
//len :数字的位数
//sizey:字体大小		  
void OLED_ShowNum(char x,char y,u32 num,char len,char sizey)
{         	
	char t,temp,m=0;
	char enshow=0;
	if(sizey==8)m=2;
	for(t=0;t<len;t++)
	{
		temp=(num/oled_pow(10,len-t-1))%10;
		if(enshow==0&&t<(len-1))
		{
			if(temp==0)
			{
				OLED_ShowChar(x+(sizey/2+m)*t,y,' ',sizey);
				continue;
			}else enshow=1;
		}
	 	OLED_ShowChar(x+(sizey/2+m)*t,y,temp+'0',sizey);
	}
} 
//显示一个字符号串
void OLED_ShowString(char x,char y,char *chr,char sizey)
{
	char j=0;
	while (chr[j]!='\0')
	{		
		OLED_ShowChar(x,y,chr[j++],sizey);
		if(sizey==8)x+=6;
		else x+=sizey/2;
	}
}
//显示汉字
void OLED_ShowChinese(char x,char y,char no,char sizey)
{
	u16 i,size1=(sizey/8+((sizey%8)?1:0))*sizey;
	for(i=0;i<size1;i++)
	{
		if(i%sizey==0) OLED_Set_Pos(x,y++);
		if(sizey==16) OLED_WR_Byte(Hzk[no][i],OLED_DATA);//16x16字号
//		else if(sizey==xx) OLED_WR_Byte(xxx[c][i],OLED_DATA);//用户添加字号
		else return;
	}				
}


//显示图片
//x,y显示坐标
//sizex,sizey,图片长宽
//BMP：要显示的图片
void OLED_DrawBMP(char x,char y,char sizex, char sizey,char BMP[])
{ 	
  u16 j=0;
	char i,m;
	sizey=sizey/8+((sizey%8)?1:0);
	for(i=0;i<sizey;i++)
	{
		OLED_Set_Pos(x,i+y);
    for(m=0;m<sizex;m++)
		{      
			OLED_WR_Byte(BMP[j++],OLED_DATA);	    	
		}
	}
} 


//refer to nexys video refference to see the power on sequence...
//初始化				    
void OLED_Init(void)
{   
    oled_pin_init();
    OLED_VDD_Clr();
    mdelay(1);
	OLED_RES_Clr();
    mdelay(200);
	OLED_RES_Set();
	
	OLED_WR_Byte(0xAE,OLED_CMD); /*display off*/
	OLED_WR_Byte(0x00,OLED_CMD); /*set lower column address*/ 
	OLED_WR_Byte(0x10,OLED_CMD); /*set higher column address*/
	OLED_WR_Byte(0x00,OLED_CMD); /*set display start line*/ 
	OLED_WR_Byte(0xB0,OLED_CMD); /*set page address*/ 
	OLED_WR_Byte(0x81,OLED_CMD); /*contract control*/ 
	OLED_WR_Byte(0xff,OLED_CMD); /*128*/ 
	OLED_WR_Byte(0xA1,OLED_CMD); /*set segment remap*/ 
	OLED_WR_Byte(0xA6,OLED_CMD); /*normal / reverse*/ 
	OLED_WR_Byte(0xA8,OLED_CMD); /*multiplex ratio*/ 
	OLED_WR_Byte(0x1F,OLED_CMD); /*duty = 1/32*/ 
	OLED_WR_Byte(0xC8,OLED_CMD); /*Com scan direction*/ 
	OLED_WR_Byte(0xD3,OLED_CMD); /*set display offset*/ 
	OLED_WR_Byte(0x00,OLED_CMD); 
	OLED_WR_Byte(0xD5,OLED_CMD); /*set osc division*/ 
	OLED_WR_Byte(0x80,OLED_CMD); 
	OLED_WR_Byte(0xD9,OLED_CMD); /*set pre-charge period*/ 
	OLED_WR_Byte(0x1f,OLED_CMD); 
	OLED_WR_Byte(0xDA,OLED_CMD); /*set COM pins*/ 
	OLED_WR_Byte(0x00,OLED_CMD); 
	OLED_WR_Byte(0xdb,OLED_CMD); /*set vcomh*/ 
	OLED_WR_Byte(0x40,OLED_CMD); 
	OLED_WR_Byte(0x8d,OLED_CMD); /*set charge pump enable*/ 
	OLED_WR_Byte(0x14,OLED_CMD);

    OLED_VBAT_Clr();
    mdelay(100);
	OLED_Clear();
	OLED_WR_Byte(0xAF,OLED_CMD); /*display ON*/
}


void OLED_TEST()
{
    char t=' ';
	OLED_Init();//初始化OLED 
	OLED_ColorTurn(0);//0正常显示，1 反色显示
    OLED_DisplayTurn(1);//0正常显示 1 屏幕翻转显示	
	while(1) 
	{		
		mdelay(500);
		OLED_Clear();
		OLED_ShowChinese(0,0,0,16);//中
		OLED_ShowChinese(18,0,1,16);//景
		OLED_ShowChinese(36,0,2,16);//园
		OLED_ShowChinese(54,0,3,16);//电
		OLED_ShowChinese(72,0,4,16);//子
		OLED_ShowChinese(90,0,5,16);//科
		OLED_ShowChinese(108,0,6,16);//技
		OLED_ShowString(8,2,"ZHONGJINGYUAN",16);
		mdelay(500);
		OLED_Clear();
		OLED_ShowString(20,0,"2014/05/01",16);
		OLED_ShowString(0,2,"ASCII:",16);  
		OLED_ShowString(63,2,"CODE:",16);
		OLED_ShowChar(48,2,t,16);//显示ASCII字符	   
		t++;
		if(t>'~')t=' ';
		OLED_ShowNum(103,2,t,3,16);
		mdelay(500);
		OLED_Clear();
	}
}

void OLED_SHOW()
{
	OLED_Init();//初始化OLED 
	OLED_ColorTurn(0);//0正常显示，1 反色显示
    OLED_DisplayTurn(1);//0正常显示 1 屏幕翻转显示	
	OLED_Clear();
	// OLED_ShowChinese(0,0,0,16);//中
	// OLED_ShowChinese(18,0,1,16);//景
	// OLED_ShowChinese(36,0,2,16);//园
	// OLED_ShowChinese(54,0,3,16);//电
	// OLED_ShowChinese(72,0,4,16);//子
	// OLED_ShowChinese(90,0,5,16);//科
	// OLED_ShowChinese(108,0,6,16);//技
	OLED_ShowString(0,0,"Welcome to use",16);
	OLED_ShowString(16,2,"WujianSoC",16);
}