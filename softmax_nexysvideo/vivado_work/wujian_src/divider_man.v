//parameter N means the actual width of dividend
//using 29/5=5...4

module    divider_man
  #(parameter N=40,
    parameter M=32,
    parameter N_ACT = M+N-1)
   (
      input                     clk,
      input                     rstn,

      input                     data_rdy ,
      input [N-1:0]             dividend,
      input [M-1:0]             divisor,

      output                    res_rdy ,
      output [N_ACT-M:0]        merchant , //width = N_ACT-M+1
      output [M-1:0]            remainder
    );

   wire [N_ACT-M-1:0]   dividend_t [N_ACT-M:0] ;
   wire [M-1:0]         divisor_t [N_ACT-M:0] ;
   wire [M-1:0]         remainder_t [N_ACT-M:0];
   wire [N_ACT-M:0]     rdy_t ;
   wire [N_ACT-M:0]     merchant_t [N_ACT-M:0] ;


   divider_cell      #(.N(N_ACT), .M(M))
   u_divider_step0
     (
      .clk              (clk),
      .rstn             (rstn),
      //input
      .en               (data_rdy),
      .dividend         ({{(M){1'b0}}, dividend[N-1]}), //minimal cell to calculate
      .divisor          (divisor),                  //divisor
      .merchant_ci      ({(N_ACT-M+1){1'b0}}),   //merchant info from last cell
      .dividend_ci      (dividend[N_ACT-M-1:0]), //original dividend remained
      //output
      .dividend_kp      (dividend_t[N_ACT-M]),   //keep remaind-dividend for pipeline
      .divisor_kp       (divisor_t[N_ACT-M]),    //keep divisor for pipeline
      .rdy              (rdy_t[N_ACT-M]),
      .merchant         (merchant_t[N_ACT-M]),
      .remainder        (remainder_t[N_ACT-M])
      );

   genvar               i ;
   generate
      for(i=1; i<=N_ACT-M; i=i+1) begin: sqrt_stepx
         divider_cell      #(.N(N_ACT), .M(M))
         u_divider_step
         (
          .clk              (clk),
          .rstn             (rstn),
          //input
          .en               (rdy_t[N_ACT-M-i+1]),
          .dividend         ({remainder_t[N_ACT-M-i+1], dividend_t[N_ACT-M-i+1][N_ACT-M-i]}),
          .divisor          (divisor_t[N_ACT-M-i+1]),
          .merchant_ci      (merchant_t[N_ACT-M-i+1]),
          .dividend_ci      (dividend_t[N_ACT-M-i+1]),
          //output
          .divisor_kp       (divisor_t[N_ACT-M-i]),
          .dividend_kp      (dividend_t[N_ACT-M-i]),
          .rdy              (rdy_t[N_ACT-M-i]),
          .merchant         (merchant_t[N_ACT-M-i]),
          .remainder        (remainder_t[N_ACT-M-i])
          );
      end // block: sqrt_stepx
   endgenerate

   assign res_rdy       = rdy_t[0];
   assign merchant      = merchant_t[0];
   assign remainder     = remainder_t[0];

endmodule