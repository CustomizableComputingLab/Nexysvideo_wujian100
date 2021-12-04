#ifndef oled_128_32_h
#define oled_128_32_h
 	 

#define  u16 unsigned int
#define  u32 unsigned int
	
#define OLED_CMD  0	//写命令
#define OLED_DATA 1	//写数据


//OLED控制用函数
void delay_ms(unsigned int ms);
void OLED_ColorTurn(char i);
void OLED_DisplayTurn(char i);
void OLED_WR_Byte(char dat,char cmd);
void OLED_Set_Pos(char x, char y);
void OLED_Display_On(void);
void OLED_Display_Off(void);
void OLED_Clear(void);
void OLED_ShowChar(char x,char y,char chr,char sizey);
u32  oled_pow(char m,char n);
void OLED_ShowNum(char x,char y,u32 num,char len,char sizey);
void OLED_ShowString(char x,char y,char *chr,char sizey);
void OLED_ShowChinese(char x,char y,char no,char sizey);
void OLED_DrawBMP(char x,char y,char sizex, char sizey,char BMP[]);
void OLED_Init(void);

void OLED_TEST();


#endif  
	 



