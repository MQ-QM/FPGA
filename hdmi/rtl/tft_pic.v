`timescale  1ns/1ns
module  tft_pic
(
    input   wire            tft_clk  ,      
    input   wire            sys_rst_n   ,   
    input   wire    [11:0]   pix_x       ,  
    input   wire    [11:0]   pix_y       , 
    input   wire    [23:0]   data        , 

    output  reg     [23:0]  pix_data        

);

//parameter   H_VALID =   12'd480 ,   //行有效数据
//             V_VALID =   12'd272 ;   //场有效数据

parameter   H_VALID =   12'd800 ,   //行有效数据
             V_VALID =   12'd480 ;   //场有效数据
                               
parameter   WHITE   =   24'hFFFFFF,  //白色 
             BLACK   =   24'h000000,  //黑色 
             RED     =   24'hFF0000,  //红色 
             GREEN   =   24'h00FF00,  //绿色 
             BLUE    =   24'h0000FF;  //蓝色 

parameter   CHAR_B_H=   10'd272 ,   //字符开始X轴坐标
             CHAR_B_V=   10'd208 ;   //字符开始Y轴坐标

parameter   CHAR_W  =   10'd65 ,   //字符宽度
             CHAR_H  =   10'd161  ;   //字符高度 

wire    [10:0]   char_x  ;   //字符显示X轴坐标
wire    [10:0]   char_y  ;   //字符显示Y轴坐标 
        
reg     [64:0] char    [160:0]  ;   //字符库数据                 
reg     [64:0] char_s  [160:0]  ;   //字符数据    

always @(posedge tft_clk ) //char_s_xs
        begin
        case (data[3:0])
           4'd1 :    begin  char_s[0 ]  <= char[0 ];
                            char_s[1 ]  <= char[1 ];
                            char_s[2 ]  <= char[2 ];
                            char_s[3 ]  <= char[3 ];
                            char_s[4 ]  <= char[4 ];
                            char_s[5 ]  <= char[5 ];
                            char_s[6 ]  <= char[6 ];
                            char_s[7 ]  <= char[7 ];
                            char_s[8 ]  <= char[8 ];
                            char_s[9 ]  <= char[9 ];
                            char_s[10]  <= char[10];
                            char_s[11]  <= char[11];
                            char_s[12]  <= char[12];
                            char_s[13]  <= char[13];
                            char_s[14]  <= char[14];
                            char_s[15]  <= char[15];
                      end
           4'd2 : begin     char_s[0 ]  <= char[16];
                            char_s[1 ]  <= char[17];
                            char_s[2 ]  <= char[18];
                            char_s[3 ]  <= char[19];
                            char_s[4 ]  <= char[20];
                            char_s[5 ]  <= char[21];
                            char_s[6 ]  <= char[22];
                            char_s[7 ]  <= char[23];
                            char_s[8 ]  <= char[24];
                            char_s[9 ]  <= char[25];
                            char_s[10]  <= char[26];
                            char_s[11]  <= char[27];
                            char_s[12]  <= char[28];
                            char_s[13]  <= char[29];
                            char_s[14]  <= char[30];
                            char_s[15]  <= char[31];
                      end
           4'd3 : begin     char_s[0 ]  <= char[32];
                            char_s[1 ]  <= char[33];
                            char_s[2 ]  <= char[34];
                            char_s[3 ]  <= char[35];
                            char_s[4 ]  <= char[36];
                            char_s[5 ]  <= char[37];
                            char_s[6 ]  <= char[38];
                            char_s[7 ]  <= char[39];
                            char_s[8 ]  <= char[40];
                            char_s[9 ]  <= char[41];
                            char_s[10]  <= char[42];
                            char_s[11]  <= char[43];
                            char_s[12]  <= char[44];
                            char_s[13]  <= char[45];
                            char_s[14]  <= char[46];
                            char_s[15]  <= char[47];
                      end
           4'd4 : begin     char_s[0 ]  <= char[48];
                            char_s[1 ]  <= char[49];
                            char_s[2 ]  <= char[50];
                            char_s[3 ]  <= char[51];
                            char_s[4 ]  <= char[52];
                            char_s[5 ]  <= char[53];
                            char_s[6 ]  <= char[54];
                            char_s[7 ]  <= char[55];
                            char_s[8 ]  <= char[56];
                            char_s[9 ]  <= char[57];
                            char_s[10]  <= char[58];
                            char_s[11]  <= char[59];
                            char_s[12]  <= char[60];
                            char_s[13]  <= char[61];
                            char_s[14]  <= char[62];
                            char_s[15]  <= char[63];
                      end
           4'd5 : begin     char_s[0 ]  <= char[64];
                            char_s[1 ]  <= char[65];
                            char_s[2 ]  <= char[66];
                            char_s[3 ]  <= char[67];
                            char_s[4 ]  <= char[68];
                            char_s[5 ]  <= char[69];
                            char_s[6 ]  <= char[70];
                            char_s[7 ]  <= char[71];
                            char_s[8 ]  <= char[72];
                            char_s[9 ]  <= char[73];
                            char_s[10]  <= char[74];
                            char_s[11]  <= char[75];
                            char_s[12]  <= char[76];
                            char_s[13]  <= char[77];
                            char_s[14]  <= char[78];
                            char_s[15]  <= char[79];
                      end
           4'd6 : begin     char_s[0 ]  <= char[80];
                            char_s[1 ]  <= char[81];
                            char_s[2 ]  <= char[82];
                            char_s[3 ]  <= char[83];
                            char_s[4 ]  <= char[84];
                            char_s[5 ]  <= char[85];
                            char_s[6 ]  <= char[86];
                            char_s[7 ]  <= char[87];
                            char_s[8 ]  <= char[88];
                            char_s[9 ]  <= char[89];
                            char_s[10]  <= char[90];
                            char_s[11]  <= char[91];
                            char_s[12]  <= char[92];
                            char_s[13]  <= char[93];
                            char_s[14]  <= char[94];
                            char_s[15]  <= char[95];
                      end
           4'd7 : begin     char_s[0 ]  <= char[96 ];
                            char_s[1 ]  <= char[97 ];
                            char_s[2 ]  <= char[98 ];
                            char_s[3 ]  <= char[99 ];
                            char_s[4 ]  <= char[100];
                            char_s[5 ]  <= char[101];
                            char_s[6 ]  <= char[102];
                            char_s[7 ]  <= char[103];
                            char_s[8 ]  <= char[104];
                            char_s[9 ]  <= char[105];
                            char_s[10]  <= char[106];
                            char_s[11]  <= char[107];
                            char_s[12]  <= char[108];
                            char_s[13]  <= char[109];
                            char_s[14]  <= char[110];
                            char_s[15]  <= char[111];/*20*/
                      end
           4'd8 : begin     char_s[0 ]  <= char[112];
                            char_s[1 ]  <= char[113];
                            char_s[2 ]  <= char[114];
                            char_s[3 ]  <= char[115];
                            char_s[4 ]  <= char[116];
                            char_s[5 ]  <= char[117];
                            char_s[6 ]  <= char[118];
                            char_s[7 ]  <= char[119];
                            char_s[8 ]  <= char[120];
                            char_s[9 ]  <= char[121];
                            char_s[10]  <= char[122];
                            char_s[11]  <= char[123];
                            char_s[12]  <= char[124];
                            char_s[13]  <= char[125];
                            char_s[14]  <= char[126];
                            char_s[15]  <= char[127];/*20*/
                      end
           4'd9 : begin     char_s[0 ]  <= char[128];
                            char_s[1 ]  <= char[129];
                            char_s[2 ]  <= char[130];
                            char_s[3 ]  <= char[131];
                            char_s[4 ]  <= char[132];
                            char_s[5 ]  <= char[133];
                            char_s[6 ]  <= char[134];
                            char_s[7 ]  <= char[135];
                            char_s[8 ]  <= char[136];
                            char_s[9 ]  <= char[137];
                            char_s[10]  <= char[138];
                            char_s[11]  <= char[139];
                            char_s[12]  <= char[140];
                            char_s[13]  <= char[141];
                            char_s[14]  <= char[142];
                            char_s[15]  <= char[143];/*20*/
                      end
           4'd0 : begin     char_s[0 ]  <= char[144];
                            char_s[1 ]  <= char[145];
                            char_s[2 ]  <= char[146];
                            char_s[3 ]  <= char[147];
                            char_s[4 ]  <= char[148];
                            char_s[5 ]  <= char[149];
                            char_s[6 ]  <= char[150];
                            char_s[7 ]  <= char[151];
                            char_s[8 ]  <= char[152];
                            char_s[9 ]  <= char[153];
                            char_s[10]  <= char[154];
                            char_s[11]  <= char[155];
                            char_s[12]  <= char[156];
                            char_s[13]  <= char[157];
                            char_s[14]  <= char[158];
                            char_s[15]  <= char[159];/*20*/
                      end
            default: char_s[0] <= 64'h0000;
        endcase
        case (data[7:4])
                   4'd1 :    begin  
                            char_s[16]  <= char[0 ];
                            char_s[17]  <= char[1 ];
                            char_s[18]  <= char[2 ];
                            char_s[19]  <= char[3 ];
                            char_s[20]  <= char[4 ];
                            char_s[21]  <= char[5 ];
                            char_s[22]  <= char[6 ];
                            char_s[23]  <= char[7 ];
                            char_s[24]  <= char[8 ];
                            char_s[25]  <= char[9 ];
                            char_s[26]  <= char[10];
                            char_s[27]  <= char[11];
                            char_s[28]  <= char[12];
                            char_s[29]  <= char[13];
                            char_s[30]  <= char[14];
                            char_s[31]  <= char[15];
                      end
           4'd2 : begin     char_s[16]  <= char[16];
                            char_s[17]  <= char[17];
                            char_s[18]  <= char[18];
                            char_s[19]  <= char[19];
                            char_s[20]  <= char[20];
                            char_s[21]  <= char[21];
                            char_s[22]  <= char[22];
                            char_s[23]  <= char[23];
                            char_s[24]  <= char[24];
                            char_s[25]  <= char[25];
                            char_s[26]  <= char[26];
                            char_s[27]  <= char[27];
                            char_s[28]  <= char[28];
                            char_s[29]  <= char[29];
                            char_s[30]  <= char[30];
                            char_s[31]  <= char[31];
                      end
           4'd3 : begin     char_s[16]  <= char[32];
                            char_s[17]  <= char[33];
                            char_s[18]  <= char[34];
                            char_s[19]  <= char[35];
                            char_s[20]  <= char[36];
                            char_s[21]  <= char[37];
                            char_s[22]  <= char[38];
                            char_s[23]  <= char[39];
                            char_s[24]  <= char[40];
                            char_s[25]  <= char[41];
                            char_s[26]  <= char[42];
                            char_s[27]  <= char[43];
                            char_s[28]  <= char[44];
                            char_s[29]  <= char[45];
                            char_s[30]  <= char[46];
                            char_s[31]  <= char[47];
                      end
           4'd4 : begin     char_s[16]  <= char[48];
                            char_s[17]  <= char[49];
                            char_s[18]  <= char[50];
                            char_s[19]  <= char[51];
                            char_s[20]  <= char[52];
                            char_s[21]  <= char[53];
                            char_s[22]  <= char[54];
                            char_s[23]  <= char[55];
                            char_s[24]  <= char[56];
                            char_s[25]  <= char[57];
                            char_s[26]  <= char[58];
                            char_s[27]  <= char[59];
                            char_s[28]  <= char[60];
                            char_s[29]  <= char[61];
                            char_s[30]  <= char[62];
                            char_s[31]  <= char[63];
                      end
           4'd5 : begin     char_s[16]  <= char[64];
                            char_s[17]  <= char[65];
                            char_s[18]  <= char[66];
                            char_s[19]  <= char[67];
                            char_s[20]  <= char[68];
                            char_s[21]  <= char[69];
                            char_s[22]  <= char[70];
                            char_s[23]  <= char[71];
                            char_s[24]  <= char[72];
                            char_s[25]  <= char[73];
                            char_s[26]  <= char[74];
                            char_s[27]  <= char[75];
                            char_s[28]  <= char[76];
                            char_s[29]  <= char[77];
                            char_s[30]  <= char[78];
                            char_s[31]  <= char[79];
                      end
           4'd6 : begin     char_s[16]  <= char[80];
                            char_s[17]  <= char[81];
                            char_s[18]  <= char[82];
                            char_s[19]  <= char[83];
                            char_s[20]  <= char[84];
                            char_s[21]  <= char[85];
                            char_s[22]  <= char[86];
                            char_s[23]  <= char[87];
                            char_s[24]  <= char[88];
                            char_s[25]  <= char[89];
                            char_s[26]  <= char[90];
                            char_s[27]  <= char[91];
                            char_s[28]  <= char[92];
                            char_s[29]  <= char[93];
                            char_s[30]  <= char[94];
                            char_s[31]  <= char[95];
                      end
           4'd7 : begin     char_s[16]  <= char[96 ];
                            char_s[17]  <= char[97 ];
                            char_s[18]  <= char[98 ];
                            char_s[19]  <= char[99 ];
                            char_s[20]  <= char[100];
                            char_s[21]  <= char[101];
                            char_s[22]  <= char[102];
                            char_s[23]  <= char[103];
                            char_s[24]  <= char[104];
                            char_s[25]  <= char[105];
                            char_s[26]  <= char[106];
                            char_s[27]  <= char[107];
                            char_s[28]  <= char[108];
                            char_s[29]  <= char[109];
                            char_s[30]  <= char[110];
                            char_s[31]  <= char[111];/*20*/
                      end
           4'd8 : begin     char_s[16]  <= char[112];
                            char_s[17]  <= char[113];
                            char_s[18]  <= char[114];
                            char_s[19]  <= char[115];
                            char_s[20]  <= char[116];
                            char_s[21]  <= char[117];
                            char_s[22]  <= char[118];
                            char_s[23]  <= char[119];
                            char_s[24]  <= char[120];
                            char_s[25]  <= char[121];
                            char_s[26]  <= char[122];
                            char_s[27]  <= char[123];
                            char_s[28]  <= char[124];
                            char_s[29]  <= char[125];
                            char_s[30]  <= char[126];
                            char_s[31]  <= char[127];/*20*/
                      end
           4'd9 : begin     char_s[16]  <= char[128];
                            char_s[17]  <= char[129];
                            char_s[18]  <= char[130];
                            char_s[19]  <= char[131];
                            char_s[20]  <= char[132];
                            char_s[21]  <= char[133];
                            char_s[22]  <= char[134];
                            char_s[23]  <= char[135];
                            char_s[24]  <= char[136];
                            char_s[25]  <= char[137];
                            char_s[26]  <= char[138];
                            char_s[27]  <= char[139];
                            char_s[28]  <= char[140];
                            char_s[29]  <= char[141];
                            char_s[30]  <= char[142];
                            char_s[31]  <= char[143];/*20*/
                      end
           4'd0 : begin     char_s[16]  <= char[144];
                            char_s[17]  <= char[145];
                            char_s[18]  <= char[146];
                            char_s[19]  <= char[147];
                            char_s[20]  <= char[148];
                            char_s[21]  <= char[149];
                            char_s[22]  <= char[150];
                            char_s[23]  <= char[151];
                            char_s[24]  <= char[152];
                            char_s[25]  <= char[153];
                            char_s[26]  <= char[154];
                            char_s[27]  <= char[155];
                            char_s[28]  <= char[156];
                            char_s[29]  <= char[157];
                            char_s[30]  <= char[158];
                            char_s[31]  <= char[159];/*20*/
                      end
            default: char_s[0] <= 64'h0000;
        endcase
        case (data[11:8])
                   4'd1 :    begin  
                            char_s[32]  <= char[0 ];
                            char_s[33]  <= char[1 ];
                            char_s[34]  <= char[2 ];
                            char_s[35]  <= char[3 ];
                            char_s[36]  <= char[4 ];
                            char_s[37]  <= char[5 ];
                            char_s[38]  <= char[6 ];
                            char_s[39]  <= char[7 ];
                            char_s[40]  <= char[8 ];
                            char_s[41]  <= char[9 ];
                            char_s[42]  <= char[10];
                            char_s[43]  <= char[11];
                            char_s[44]  <= char[12];
                            char_s[45]  <= char[13];
                            char_s[46]  <= char[14];
                            char_s[47]  <= char[15];
                      end
           4'd2 : begin     char_s[32]  <= char[16];
                            char_s[33]  <= char[17];
                            char_s[34]  <= char[18];
                            char_s[35]  <= char[19];
                            char_s[36]  <= char[20];
                            char_s[37]  <= char[21];
                            char_s[38]  <= char[22];
                            char_s[39]  <= char[23];
                            char_s[40]  <= char[24];
                            char_s[41]  <= char[25];
                            char_s[42]  <= char[26];
                            char_s[43]  <= char[27];
                            char_s[44]  <= char[28];
                            char_s[45]  <= char[29];
                            char_s[46]  <= char[30];
                            char_s[47]  <= char[31];
                      end
           4'd3 : begin     char_s[32]  <= char[32];
                            char_s[33]  <= char[33];
                            char_s[34]  <= char[34];
                            char_s[35]  <= char[35];
                            char_s[36]  <= char[36];
                            char_s[37]  <= char[37];
                            char_s[38]  <= char[38];
                            char_s[39]  <= char[39];
                            char_s[40]  <= char[40];
                            char_s[41]  <= char[41];
                            char_s[42]  <= char[42];
                            char_s[43]  <= char[43];
                            char_s[44]  <= char[44];
                            char_s[45]  <= char[45];
                            char_s[46]  <= char[46];
                            char_s[47]  <= char[47];
                      end
           4'd4 : begin     char_s[32]  <= char[48];
                            char_s[33]  <= char[49];
                            char_s[34]  <= char[50];
                            char_s[35]  <= char[51];
                            char_s[36]  <= char[52];
                            char_s[37]  <= char[53];
                            char_s[38]  <= char[54];
                            char_s[39]  <= char[55];
                            char_s[40]  <= char[56];
                            char_s[41]  <= char[57];
                            char_s[42]  <= char[58];
                            char_s[43]  <= char[59];
                            char_s[44]  <= char[60];
                            char_s[45]  <= char[61];
                            char_s[46]  <= char[62];
                            char_s[47]  <= char[63];
                      end
           4'd5 : begin     char_s[32]  <= char[64];
                            char_s[33]  <= char[65];
                            char_s[34]  <= char[66];
                            char_s[35]  <= char[67];
                            char_s[36]  <= char[68];
                            char_s[37]  <= char[69];
                            char_s[38]  <= char[70];
                            char_s[39]  <= char[71];
                            char_s[40]  <= char[72];
                            char_s[41]  <= char[73];
                            char_s[42]  <= char[74];
                            char_s[43]  <= char[75];
                            char_s[44]  <= char[76];
                            char_s[45]  <= char[77];
                            char_s[46]  <= char[78];
                            char_s[47]  <= char[79];
                      end
           4'd6 : begin     char_s[32]  <= char[80];
                            char_s[33]  <= char[81];
                            char_s[34]  <= char[82];
                            char_s[35]  <= char[83];
                            char_s[36]  <= char[84];
                            char_s[37]  <= char[85];
                            char_s[38]  <= char[86];
                            char_s[39]  <= char[87];
                            char_s[40]  <= char[88];
                            char_s[41]  <= char[89];
                            char_s[42]  <= char[90];
                            char_s[43]  <= char[91];
                            char_s[44]  <= char[92];
                            char_s[45]  <= char[93];
                            char_s[46]  <= char[94];
                            char_s[47]  <= char[95];
                      end
           4'd7 : begin     char_s[32]  <= char[96 ];
                            char_s[33]  <= char[97 ];
                            char_s[34]  <= char[98 ];
                            char_s[35]  <= char[99 ];
                            char_s[36]  <= char[100];
                            char_s[37]  <= char[101];
                            char_s[38]  <= char[102];
                            char_s[39]  <= char[103];
                            char_s[40]  <= char[104];
                            char_s[41]  <= char[105];
                            char_s[42]  <= char[106];
                            char_s[43]  <= char[107];
                            char_s[44]  <= char[108];
                            char_s[45]  <= char[109];
                            char_s[46]  <= char[110];
                            char_s[47]  <= char[111];/*20*/
                      end
           4'd8 : begin     char_s[32]  <= char[112];
                            char_s[33]  <= char[113];
                            char_s[34]  <= char[114];
                            char_s[35]  <= char[115];
                            char_s[36]  <= char[116];
                            char_s[37]  <= char[117];
                            char_s[38]  <= char[118];
                            char_s[39]  <= char[119];
                            char_s[40]  <= char[120];
                            char_s[41]  <= char[121];
                            char_s[42]  <= char[122];
                            char_s[43]  <= char[123];
                            char_s[44]  <= char[124];
                            char_s[45]  <= char[125];
                            char_s[46]  <= char[126];
                            char_s[47]  <= char[127];/*20*/
                      end
           4'd9 : begin     char_s[32]  <= char[128];
                            char_s[33]  <= char[129];
                            char_s[34]  <= char[130];
                            char_s[35]  <= char[131];
                            char_s[36]  <= char[132];
                            char_s[37]  <= char[133];
                            char_s[38]  <= char[134];
                            char_s[39]  <= char[135];
                            char_s[40]  <= char[136];
                            char_s[41]  <= char[137];
                            char_s[42]  <= char[138];
                            char_s[43]  <= char[139];
                            char_s[44]  <= char[140];
                            char_s[45]  <= char[141];
                            char_s[46]  <= char[142];
                            char_s[47]  <= char[143];/*20*/
                      end
           4'd0 : begin     char_s[32]  <= char[144];
                            char_s[33]  <= char[145];
                            char_s[34]  <= char[146];
                            char_s[35]  <= char[147];
                            char_s[36]  <= char[148];
                            char_s[37]  <= char[149];
                            char_s[38]  <= char[150];
                            char_s[39]  <= char[151];
                            char_s[40]  <= char[152];
                            char_s[41]  <= char[153];
                            char_s[42]  <= char[154];
                            char_s[43]  <= char[155];
                            char_s[44]  <= char[156];
                            char_s[45]  <= char[157];
                            char_s[46]  <= char[158];
                            char_s[47]  <= char[159];/*20*/
                      end
            default: char_s[0] <= 64'h0000;
        endcase
end         
 
always@(posedge tft_clk)//char_zk
    begin
    char[0 ]  <= 64'h0000;
    char[1 ]  <= 64'h0000;
    char[2 ]  <= 64'h0000;
    char[3 ]  <= 64'h2010;
    char[4 ]  <= 64'h2010;
    char[5 ]  <= 64'h2010;
    char[6 ]  <= 64'h3FF0;
    char[7 ]  <= 64'h3FF8;
    char[8 ]  <= 64'h3FF8;
    char[9 ]  <= 64'h3FF8;
    char[10]  <= 64'h2000;
    char[11]  <= 64'h2000;
    char[12]  <= 64'h2000;
    char[13]  <= 64'h2000;
    char[14]  <= 64'h0000;
    char[15]  <= 64'h0000;/*10*/
    char[16]  <= 64'h0000;
    char[17]  <= 64'h3020;
    char[18]  <= 64'h3070;
    char[19]  <= 64'h3878;
    char[20]  <= 64'h2878;
    char[21]  <= 64'h2C08;
    char[22]  <= 64'h2608;
    char[23]  <= 64'h2608;
    char[24]  <= 64'h2308;
    char[25]  <= 64'h2308;
    char[26]  <= 64'h2198;
    char[27]  <= 64'h31F8;
    char[28]  <= 64'h38F8;
    char[29]  <= 64'h3870;
    char[30]  <= 64'h0800;
    char[31]  <= 64'h0000;/*20*/
    char[32]  <= 64'h0000;
    char[33]  <= 64'h0000;
    char[34]  <= 64'h1830;
    char[35]  <= 64'h1830;
    char[36]  <= 64'h2828;
    char[37]  <= 64'h2008;
    char[38]  <= 64'h2008;
    char[39]  <= 64'h2108;
    char[40]  <= 64'h2108;
    char[41]  <= 64'h2188;
    char[42]  <= 64'h2188;
    char[43]  <= 64'h1370;
    char[44]  <= 64'h1E70;
    char[45]  <= 64'h0C00;
    char[46]  <= 64'h0000;
    char[47]  <= 64'h0000;/*31*/
    char[48]  <= 64'h0000;
    char[49]  <= 64'h0400;
    char[50]  <= 64'h0600;
    char[51]  <= 64'h0500;
    char[52]  <= 64'h0480;
    char[53]  <= 64'h0480;
    char[54]  <= 64'h2440;
    char[55]  <= 64'h2420;
    char[56]  <= 64'h2410;
    char[57]  <= 64'h3FF0;
    char[58]  <= 64'h3FF8;
    char[59]  <= 64'h3FF8;
    char[60]  <= 64'h2400;
    char[61]  <= 64'h2400;
    char[62]  <= 64'h2400;
    char[63]  <= 64'h0000;/*42*/
    char[64]  <= 64'h0000;
    char[65]  <= 64'h0000;
    char[66]  <= 64'h1800;
    char[67]  <= 64'h19F8;
    char[68]  <= 64'h2908;
    char[69]  <= 64'h2088;
    char[70]  <= 64'h2088;
    char[71]  <= 64'h2088;
    char[72]  <= 64'h2088;
    char[73]  <= 64'h2088;
    char[74]  <= 64'h2088;
    char[75]  <= 64'h1188;
    char[76]  <= 64'h1F08;
    char[77]  <= 64'h0E00;
    char[78]  <= 64'h0000;
    char[79]  <= 64'h0000;/*53*/
    char[80]  <= 64'h0000;
    char[81]  <= 64'h0000;
    char[82]  <= 64'h0FC0;
    char[83]  <= 64'h1FE0;
    char[84]  <= 64'h1110;
    char[85]  <= 64'h2088;
    char[86]  <= 64'h2088;
    char[87]  <= 64'h2088;
    char[88]  <= 64'h2088;
    char[89]  <= 64'h2088;
    char[90]  <= 64'h2088;
    char[91]  <= 64'h1098;
    char[92]  <= 64'h1F10;
    char[93]  <= 64'h0F00;
    char[94]  <= 64'h0000;
    char[95]  <= 64'h0000;/*64*/
    char[96]  <= 64'h0000;
    char[97]  <= 64'h0000;      
    char[98]  <= 64'h0030;
    char[99]  <= 64'h0018;
    char[100]  <= 64'h0008;
    char[101]  <= 64'h0008;
    char[102]  <= 64'h3C08;
    char[103]  <= 64'h3E08;
    char[104]  <= 64'h1308;
    char[105]  <= 64'h0088;
    char[106]  <= 64'h0048;
    char[107]  <= 64'h0028;
    char[108]  <= 64'h0018;
    char[109]  <= 64'h0008;
    char[110]  <= 64'h0000;
    char[111]  <= 64'h0000;/*75*/
    char[112]  <= 64'h0000;
    char[113]  <= 64'h0C00;
    char[114]  <= 64'h1E70;
    char[115]  <= 64'h1270;
    char[116]  <= 64'h21C8;
    char[117]  <= 64'h2188;
    char[118]  <= 64'h2088;
    char[119]  <= 64'h2188;
    char[120]  <= 64'h2108;
    char[121]  <= 64'h2108;
    char[122]  <= 64'h2388;
    char[123]  <= 64'h2288;
    char[124]  <= 64'h1E70;
    char[125]  <= 64'h0C20;
    char[126]  <= 64'h0000;
    char[127]  <= 64'h0000;/*86*/
    char[128]  <= 64'h0000;
    char[129]  <= 64'h0040;
    char[130]  <= 64'h11F0;
    char[131]  <= 64'h11F0;     
    char[132]  <= 64'h3308;
    char[133]  <= 64'h2208;
    char[134]  <= 64'h2208;
    char[135]  <= 64'h2208;
    char[136]  <= 64'h2208;
    char[137]  <= 64'h2208;
    char[138]  <= 64'h1108;
    char[139]  <= 64'h1C90;
    char[140]  <= 64'h0FF0;
    char[141]  <= 64'h07E0;
    char[142]  <= 64'h0000;
    char[143]  <= 64'h0000;/*97*/
    char[144]  <= 64'h0000;
    char[145]  <= 64'h0000;
    char[146]  <= 64'h0FE0;
    char[147]  <= 64'h1FF0;
    char[148]  <= 64'h1830;
    char[149]  <= 64'h3008;
    char[150]  <= 64'h2008;
    char[151]  <= 64'h2008;
    char[152]  <= 64'h2008;
    char[153]  <= 64'h2008;
    char[154]  <= 64'h2008;
    char[155]  <= 64'h1830;
    char[156]  <= 64'h0FF0;
    char[157]  <= 64'h07E0;
    char[158]  <= 64'h0000;
    char[159]  <= 64'h0000;/*08*/
                                                                           
end                                       

assign  char_x  =   (((pix_x >= CHAR_B_H) && (pix_x < (CHAR_B_H + CHAR_W)))
                    && ((pix_y >= CHAR_B_V) && (pix_y < (CHAR_B_V + CHAR_H))))
                    ? (pix_x - CHAR_B_H) : 11'h3FF;
assign  char_y  =   (((pix_x >= CHAR_B_H) && (pix_x < (CHAR_B_H + CHAR_W)))
                    && ((pix_y >= CHAR_B_V) && (pix_y < (CHAR_B_V + CHAR_H))))
                    ? (pix_y - CHAR_B_V) : 11'h3FF;            

//pix_data:输出像素点色彩信息,根据当前像素点坐标指定当前像素点颜色数据
always @(posedge tft_clk or negedge sys_rst_n) begin
    if(sys_rst_n == 1'b0)begin 
        pix_data <= BLACK;
        end
    else begin
        if((pix_x >= 11'd0) && (pix_x < H_VALID/5*1))begin 
            pix_data <= WHITE;
            end
        else if(((pix_x >= CHAR_B_H) && (pix_x < (CHAR_B_H + CHAR_W)))//pix_data:输出像素点色彩信息,根据当前像素点坐标指定当前像素点颜色数据
                && ((pix_y >= CHAR_B_V) && (pix_y < (CHAR_B_V + CHAR_H))))
            begin
            if(char_s[char_y][10'd280 - char_x] == 1'b1)
                pix_data    <=  BLUE;
            else
                pix_data    <=  BLACK;
            end    
        else if((pix_x >= H_VALID/5*1) && (pix_x < H_VALID/5*2))begin     
            pix_data <= BLACK;
            end
        else if((pix_x >= H_VALID/5*2) && (pix_x < H_VALID/5*3))begin     
            pix_data <= RED;   
            end
        else if((pix_x >= H_VALID/5*3) && (pix_x < H_VALID/5*4))begin     
            pix_data <= GREEN;    
            end            
        else begin 
            pix_data <= BLUE; 
            end
    end    
end    
endmodule
