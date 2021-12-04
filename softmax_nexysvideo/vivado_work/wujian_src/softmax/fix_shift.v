module fix_shift(
                input [31:0] input_data,
                input wire   clk,
                input wire   rst,
                output [4:0] befor_point,
                output [3:0] after_point_0,
                output [3:0] after_point_1,
                output [3:0] after_point_2,
                output [3:0] after_point_3
    );
   wire [25:0]                temp;
   reg [31:0]      data_reg;
   wire [15:0]     fix_num;
   wire  [2:0]      point_position;
   
   assign fix_num = {data_reg[12:0],3'b0};
   assign point_position = data_reg[15:13];
   
   assign temp = {5'b00000,fix_num,5'b00000} << point_position;
   assign {befor_point,after_point_0,after_point_1,after_point_2,after_point_3} = temp[25:5];
   
   always @ (posedge clk or negedge rst)
   begin
        if(rst == 0)
        begin
            data_reg <= 0;
        end 
        else
            data_reg <= input_data;
   end  
endmodule