module hdmi (
    input  wire         clk         ,
    input  wire         rst         , 
    
    output  wire        ddc_scl     ,
    output  wire        ddc_sda     , 

    output wire          clk_p       ,
    output wire          clk_n       ,
    output wire          r_p         ,
    output wire          r_n         ,    
    output wire          g_p         ,
    output wire          g_n         , 
    output wire          b_p         ,
    output wire          b_n    

    
);


wire [11:0]   pix_x       ;
wire [11:0]   pix_y       ;
wire [23:0]   data        ;
wire [23:0]  pix_data     ;

assign  ddc_scl = 1'b1;
assign  ddc_sda = 1'b1;


wire         hsync       ;
wire         vsync       ;
wire         tft_de      ;
wire [23:0]  rgb         ;

wire tft_clk_s           ;

encode_par encode_par_inst
(
    .clk        (tft_clk_s   ) ,
    .rst        (rst   ) ,
    .hsync      (hsync ) ,
    .vsync      (vsync ) ,
    .de         (tft_de    ) ,
    .rgb        (rgb   ) ,

    .clk_p      (clk_p ) ,
    .clk_n      (clk_n ) ,
    .r_p        (r_p   ) ,
    .r_n        (r_n   ) ,    
    .g_p        (g_p   ) ,
    .g_n        (g_n   ) , 
    .b_p        (b_p   ) ,
    .b_n        (b_n   )      
);


tft_colorbar tft_colorbar_inst
(
    .sys_clk    ( clk  ) ,   //���빤��ʱ��,Ƶ��50MHz
    .sys_rst_n  ( rst  ) ,   //���븴λ�ź�,�͵�ƽ��Ч

    .rgb_tft    ( rgb      ) ,   //���������Ϣ
    .hsync      ( hsync    ) ,   //�����ͬ���ź�
    .vsync      ( vsync    ) ,   //�����ͬ���ź�
    .tft_clk_s  ( tft_clk_s) ,   //���TFTʱ���ź�
    .tft_de     ( tft_de   ) ,   //���TFTʹ���ź�
    .tft_bl     ( tft_bl   )     //��������ź�

);



endmodule //hdmi