module ahb_softmax (
     input   wire                hclk_1        ,
     input   wire                hreset_n_1    ,
     input   wire                hsel_1        ,
     input   wire    [3:0]       htrans_1      ,
     input   wire                hwrite_1      ,
     input   wire    [2:0]       hsize_1      ,
     input   wire    [31:0]      haddr_1      ,
     input   wire    [31:0]      hwdata_1      ,
     input   wire    [2:0] hprot_1,
     output  wire     [31:0]      hrdata_1      ,
     output                      hready_out_1  ,
     output  wire    [1:0]       hresp_1,
     output	 wire           intr_1,
     
     input   wire                hclk_2        ,
     input   wire                hreset_n_2    ,
     input   wire                hsel_2        ,
     input   wire    [3:0]       htrans_2      ,
     input   wire                hwrite_2      ,
     input   wire    [2:0]       hsize_2      ,
     input   wire    [31:0]      haddr_2      ,
     input   wire    [31:0]      hwdata_2      ,
     input   wire    [2:0] hprot_2,
     output  wire     [31:0]      hrdata_2      ,
     output                      hready_out_2  ,
     output  wire    [1:0]       hresp_2,
     output	 wire           intr_2
     //output data_out_temp
 );
 
 //64K               each ram for 64K   16addr bus   
 parameter  ADDRWIDTH = 16;

 //softmax interface for two double-port ram
 wire[31:0] ram1_to_softmax_dinb;
 wire softmax_to_ram1_enb;
 wire softmax_to_ram1_wenb;
 wire[ADDRWIDTH-3:0] softmax_to_ram1_addrb;
 wire[31:0] softmax_to_ram1_dob;
  
 wire[31:0] ram2_to_softmax_dinb;
 wire softmax_to_ram2_enb;
 wire softmax_to_ram2_wenb;
 wire[ADDRWIDTH-3:0] softmax_to_ram2_addrb;
 wire[31:0] softmax_to_ram2_dob; 
 
 
 assign intr_1 = 1'b0;
 assign intr_2 = 1'b0;       
     
 dual_port_sms #(.BIT_WIDTH(ADDRWIDTH)) u1_dual_port_sms_64K(
  .mem_haddr(haddr_1),
  .mem_hclk(hclk_1),
  .mem_hprot(hprot_1),
  .mem_hrdata(hrdata_1),
  .mem_hready_resp(hready_out_1),
  .mem_hresp(hresp_1),
  .mem_hrst_b(hreset_n_1),
  .mem_hsel(hsel_1),
  .mem_hsize(hsize_1),
  .mem_htrans(htrans_1),
  .mem_hwdata(hwdata_1),
  .mem_hwrite(hwrite_1),
  .intr(),           
  .ram_addr_B(softmax_to_ram1_addrb),
  .ram_rdata_B(ram1_to_softmax_dinb),
  .ram_sel_B(softmax_to_ram1_enb),
  .ram_wdata_B(softmax_to_ram1_dob),
  .ram_write_B(softmax_to_ram1_wenb)
);


 dual_port_sms #(.BIT_WIDTH(ADDRWIDTH)) u2_dual_port_sms_64K(
  .mem_haddr(haddr_2),
  .mem_hclk(hclk_2),
  .mem_hprot(hprot_2),
  .mem_hrdata(hrdata_2),
  .mem_hready_resp(hready_out_2),
  .mem_hresp(hresp_2),
  .mem_hrst_b(hreset_n_2),
  .mem_hsel(hsel_2),
  .mem_hsize(hsize_2),
  .mem_htrans(htrans_2),
  .mem_hwdata(hwdata_2),
  .mem_hwrite(hwrite_2),
  .intr(),           
  .ram_addr_B(softmax_to_ram2_addrb),
  .ram_rdata_B(ram2_to_softmax_dinb),
  .ram_sel_B(softmax_to_ram2_enb),
  .ram_wdata_B(softmax_to_ram2_dob),
  .ram_write_B(softmax_to_ram2_wenb)
);



    softmax
        #(.ADDRWIDTH(ADDRWIDTH-2))
        u_softmax(
       .sys_clk(hclk_1),
       .sys_rst_n(hreset_n_1),
        
        .ram1_dinb(ram1_to_softmax_dinb),
        .ram1_enb(softmax_to_ram1_enb),
        .ram1_wenb(softmax_to_ram1_wenb),
        .ram1_addrb(softmax_to_ram1_addrb),
        .ram1_dob(softmax_to_ram1_dob),
        
        .ram2_dinb(ram2_to_softmax_dinb),
        .ram2_enb(softmax_to_ram2_enb),
        .ram2_wenb(softmax_to_ram2_wenb),
        .ram2_addrb(softmax_to_ram2_addrb),
        .ram2_dob(softmax_to_ram2_dob)
  );





 endmodule
 
 
 
