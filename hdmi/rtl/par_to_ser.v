`timescale  1ns/1ns

module par_to_ser
(
    input   wire            clk         ,   //输入系统时钟
    input   wire    [9:0]   par_data    ,   //输入并行数据

    output  reg            ser_data_p  ,   //输出串行差分数据
    output  reg            ser_data_n      //输出串行差分数据
);

reg     [3:0]   cnt=0;

always@(posedge clk )
if(cnt==4'd9)
    cnt <=4'd0;
else
    cnt <=cnt +4'd1;

always@(posedge clk )
    case(cnt)
        0  : ser_data_p <= par_data[0];
        1  : ser_data_p <= par_data[1];
        2  : ser_data_p <= par_data[2];
        3  : ser_data_p <= par_data[3];
        4  : ser_data_p <= par_data[4];
        5  : ser_data_p <= par_data[5];
        6  : ser_data_p <= par_data[6];
        7  : ser_data_p <= par_data[7];
        8  : ser_data_p <= par_data[8];
        9  : ser_data_p <= par_data[9];
        default :ser_data_p <=1'b1;
    endcase

always@(posedge clk )
    case(cnt)
        0  : ser_data_n <= ~par_data[0];
        1  : ser_data_n <= ~par_data[1];
        2  : ser_data_n <= ~par_data[2];
        3  : ser_data_n <= ~par_data[3];
        4  : ser_data_n <= ~par_data[4];
        5  : ser_data_n <= ~par_data[5];
        6  : ser_data_n <= ~par_data[6];
        7  : ser_data_n <= ~par_data[7];
        8  : ser_data_n <= ~par_data[8];
        9  : ser_data_n <= ~par_data[9];
        default :ser_data_n <=1'b1;
    endcase    
endmodule   


