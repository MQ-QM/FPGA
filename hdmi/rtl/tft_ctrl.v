`timescale  1ns/1ns

module  tft_ctrl
(
    input   wire            tft_clk     ,   //����ʱ��
    input   wire            sys_rst_n   ,   //ϵͳ��λ,�͵�ƽ��Ч
    input   wire    [23:0]  pix_data    ,   //����ʾ����

    output  wire    [11:0]   pix_x       ,   //���TFT��Ч��ʾ�������ص�X������
    output  wire    [11:0]   pix_y       ,   //���TFT��Ч��ʾ�������ص�Y������
    output  wire    [23:0]  rgb_tft     ,   //TFT��ʾ����
    output  wire            hsync       ,   //TFT��ͬ���ź�
    output  wire            vsync       ,   //TFT��ͬ���ź�
    output  wire            tft_clk_s   ,   //TFT����ʱ��
    output  wire            tft_de      ,   //TFT����ʹ��
    output  wire            tft_bl          //TFT�����ź�
);

//4.3' 480*272   9Mhz
//parameter H_SYNC    =   10'd41  ,   //��ͬ��
//           H_BACK    =   10'd2   ,   //��ʱ�����
//           H_VALID   =   10'd480 ,   //����Ч����
//           H_FRONT   =   10'd2   ,   //��ʱ��ǰ��
//           H_TOTAL   =   10'd525 ;   //��ɨ������

//parameter V_SYNC    =   10'd10  ,   //��ͬ��
//           V_BACK    =   10'd2   ,   //��ʱ�����
//           V_VALID   =   10'd272 ,   //����Ч����
//           V_FRONT   =   10'd2   ,   //��ʱ��ǰ��
//           V_TOTAL   =   10'd286 ;   //��ɨ������
 
 //4.3' 800*480     25Mhz      
parameter H_SYNC    =   11'd128 ,   //��ͬ��
           H_BACK    =   11'd88   ,   //��ʱ�����
           H_VALID   =   11'd800  ,   //����Ч����
           H_FRONT   =   11'd40   ,   //��ʱ��ǰ��
           H_TOTAL   =   11'd1056 ;   //��ɨ������

parameter V_SYNC    =   11'd2  ,    //��ͬ��
           V_BACK    =   11'd33 ,   //��ʱ�����
           V_VALID   =   11'd480,   //����Ч����
           V_FRONT   =   11'd10 ,   //��ʱ��ǰ��
           V_TOTAL   =   11'd525;   //��ɨ������           
          
           

wire            rgb_valid       ;   //��Ч��ʾ����
wire            pix_data_req    ;   //���ص�ɫ����Ϣ�����ź�


reg     [11:0]  cnt_h           ;   //��ͬ���źż�����
reg     [11:0]  cnt_v           ;   //��ͬ���źż�����

//tft_clk,tft_de,tft_bl��TFT����ʱ�ӡ�����ʹ�ܡ������ź�
assign  tft_clk_s = tft_clk     ;
assign  tft_de  = rgb_valid     ;
assign  tft_bl  = sys_rst_n     ;

//cnt_h:��ͬ���źż�����
always@(posedge tft_clk or  negedge sys_rst_n)begin 
    if(sys_rst_n == 1'b0)begin 
        cnt_h   <=  12'd0   ;
        end
    else    if(cnt_h == H_TOTAL - 1'd1)begin 
        cnt_h   <=  12'd0   ;
        end
    else begin 
        cnt_h   <=  cnt_h + 1'd1   ;  
        end
end    
//hsync:��ͬ���ź�
assign  hsync = (cnt_h  <=  H_SYNC - 1'd1) ? 1'b1 : 1'b0  ;

//cnt_v:��ͬ���źż�����
always@(posedge tft_clk or negedge sys_rst_n)begin 
    if(sys_rst_n == 1'b0)begin 
        cnt_v   <=  12'd0 ;
        end
    else    if((cnt_v == V_TOTAL - 1'd1) &&  (cnt_h == H_TOTAL-1'd1))begin 
        cnt_v   <=  12'd0 ;
        end
    else    if(cnt_h == H_TOTAL - 1'd1)begin 
        cnt_v   <=  cnt_v + 1'd1 ;
        end
    else begin 
        cnt_v   <=  cnt_v ;
        end
end
//vsync:��ͬ���ź�
assign  vsync = (cnt_v  <=  V_SYNC - 1'd1) ? 1'b1 : 1'b0  ;

//rgb_valid:VGA��Ч��ʾ����
assign  rgb_valid = (((cnt_h >= H_SYNC + H_BACK )
                    && (cnt_h < H_SYNC + H_BACK  + H_VALID))
                    &&((cnt_v >= V_SYNC + V_BACK )
                    && (cnt_v < V_SYNC + V_BACK  + V_VALID)))
                    ? 1'b1 : 1'b0;

//pix_data_req:���ص�ɫ����Ϣ�����ź�,��ǰrgb_valid�ź�һ��ʱ������
assign  pix_data_req = (((cnt_h >= H_SYNC + H_BACK  - 1'b1)
                    && (cnt_h < H_SYNC + H_BACK  + H_VALID - 1'b1))
                    &&((cnt_v >= V_SYNC + V_BACK )
                    && (cnt_v < V_SYNC + V_BACK  + V_VALID)))
                    ? 1'b1 : 1'b0;

//pix_x,pix_y:VGA��Ч��ʾ�������ص�����
assign  pix_x = (pix_data_req == 1'b1)
                ? (cnt_h - (H_SYNC + H_BACK  - 1'b1)) : 12'hfff;
assign  pix_y = (pix_data_req == 1'b1)
                ? (cnt_v - (V_SYNC + V_BACK )) : 12'hfff;
                
//rgb_tft:������ص�ɫ����Ϣ
assign  rgb_tft = (rgb_valid == 1'b1) ? pix_data : 24'b0 ;

endmodule 
