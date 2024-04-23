`timescale  1ns/1ns
module  tft_colorbar
(
    input   wire            sys_clk     ,   //输入工作时钟,频率50MHz
    input   wire            sys_rst_n   ,   //输入复位信号,低电平有效
    

    output  wire    [23:0]  rgb_tft     ,   //输出像素信息
    output  wire            hsync       ,   //输出行同步信号
    output  wire            vsync       ,   //输出场同步信号
    output  wire            tft_clk_s   ,   //输出TFT时钟信号
    output  wire            tft_de      ,   //输出TFT使能信号
    output  wire            tft_bl          //输出背光信号

);


wire            tft_clk     ;
wire            locked      ;   
wire            rst_n       ;   
wire    [11:0]   pix_x      ;   
wire    [11:0]   pix_y      ;   
wire    [23:0]  pix_data    ;   

wire    [19:0]  data        ;  
wire    [23:0]  data_s      ; 

assign  rst_n = (sys_rst_n & locked);

clk_wiz_0 clk_wiz_0_inst
(
// Clock out ports  
.clk_out1(tft_clk),
// Status and control signals               
.reset(~sys_rst_n), 

.locked(locked),
// Clock in ports
.clk_in1(sys_clk)
);

//hcrs hcrs_inst(
//    .clk     (sys_clk  )       ,
//    .rstn    (rst_n )       ,
//    .ech     (ech  )       ,

//    .trg     (trg  )       ,
//    .data    (data )
    
//);

//bcd_8421 bcd_8421_inst
//(
//     .clk       (sys_clk)   ,
//     .rst       (rst_n )   ,
//     .data      (data  )   ,

//     .data_s    (data_s)
//);

tft_ctrl    tft_ctrl_inst
(
    .tft_clk     (tft_clk   ),
    .sys_rst_n   (rst_n     ),   
    .pix_data    (pix_data  ),   

    .pix_x       (pix_x     ),   
    .pix_y       (pix_y     ),   
    .rgb_tft     (rgb_tft   ),   
    .hsync       (hsync     ),   
    .vsync       (vsync     ),   
    .tft_clk_s   (tft_clk_s ),   
    .tft_de      (tft_de    ),   
    .tft_bl       (tft_bl    )    

);

tft_pic tft_pic_inst
(
    .tft_clk     (tft_clk   ),
    .sys_rst_n   (rst_n     ),   
    .pix_x       (pix_x     ),   
    .pix_y       (pix_y     ),  
    .data        (data_s    ), 

    .pix_data    (pix_data  )    

);

endmodule