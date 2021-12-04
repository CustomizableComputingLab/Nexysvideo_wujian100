module myrom5bit
  #(
    parameter RESULT_00 = 16'H8000,
    parameter RESULT_01 = 16'H2F16,
    parameter RESULT_02 = 16'H1152,
    parameter RESULT_03 = 16'H065F,
    parameter RESULT_04 = 16'H0258,
    parameter RESULT_05 = 16'H00DC,
    parameter RESULT_06 = 16'H0051,
    parameter RESULT_07 = 16'H001D,
    parameter RESULT_08 = 16'H000A,
    parameter RESULT_09 = 16'H0004,
    parameter RESULT_10 = 16'H0001,
    parameter RESULT_11 = 16'H0000,
    parameter RESULT_12 = 16'H0000,
    parameter RESULT_13 = 16'H0000,
    parameter RESULT_14 = 16'H0000,
    parameter RESULT_15 = 16'H0000,
    parameter RESULT_16 = 16'H0000,
    parameter RESULT_17 = 16'H0000,
    parameter RESULT_18 = 16'H0000,
    parameter RESULT_19 = 16'H0000,
    parameter RESULT_20 = 16'H0000,
    parameter RESULT_21 = 16'H0000,
    parameter RESULT_22 = 16'H0000,
    parameter RESULT_23 = 16'H0000,
    parameter RESULT_24 = 16'H0000,
    parameter RESULT_25 = 16'H0000,
    parameter RESULT_26 = 16'H0000,
    parameter RESULT_27 = 16'H0000,
    parameter RESULT_28 = 16'H0000,
    parameter RESULT_29 = 16'H0000,
    parameter RESULT_30 = 16'H0000,
    parameter RESULT_31 = 16'H0000
    )
   (
    input [4:0] cur_substrate_N,
    input             clk,
    input             rst_n,
    output reg [15:0] cur_result
    );

   always @ (posedge clk or negedge rst_n)
     begin
        if(rst_n == 0)
          begin
             cur_result <= 0;
          end
        else
          begin
             case(cur_substrate_N)
               5'd0:cur_result <= RESULT_00;
               5'd1:cur_result <= RESULT_01;
               5'd2:cur_result <= RESULT_02;
               5'd3:cur_result <= RESULT_03;
               5'd4:cur_result <= RESULT_04;
               5'd5:cur_result <= RESULT_05;
               5'd6:cur_result <= RESULT_06;
               5'd7:cur_result <= RESULT_07;
               5'd8:cur_result <= RESULT_08;
               5'd9:cur_result <= RESULT_09;
               5'd10:cur_result <= RESULT_10;
               5'd11:cur_result <= RESULT_11;
               5'd12:cur_result <= RESULT_12;
               5'd13:cur_result <= RESULT_13;
               5'd14:cur_result <= RESULT_14;
               5'd15:cur_result <= RESULT_15;
               5'd16:cur_result <= RESULT_16;
               5'd17:cur_result <= RESULT_17;
               5'd18:cur_result <= RESULT_18;
               5'd19:cur_result <= RESULT_19;
               5'd20:cur_result <= RESULT_20;
               5'd21:cur_result <= RESULT_21;
               5'd22:cur_result <= RESULT_22;
               5'd23:cur_result <= RESULT_23;
               5'd24:cur_result <= RESULT_24;
               5'd25:cur_result <= RESULT_25;
               5'd26:cur_result <= RESULT_26;
               5'd27:cur_result <= RESULT_27;
               5'd28:cur_result <= RESULT_28;
               5'd29:cur_result <= RESULT_29;
               5'd30:cur_result <= RESULT_30;
               5'd31:cur_result <= RESULT_31;
               default:cur_result <= 0;
             endcase
          end
     end

endmodule