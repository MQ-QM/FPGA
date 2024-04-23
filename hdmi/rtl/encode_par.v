module encode_par (
    input  wire         clk         ,
    input  wire         rst         ,
    input  wire         hsync       ,
    input  wire         vsync       ,
    input  wire         de          ,
    input  wire [23:0]  rgb         ,

    output wire         clk_p       ,
    output wire         clk_n       ,
    output wire         r_p         ,
    output wire         r_n         ,    
    output wire         g_p         ,
    output wire         g_n         , 
    output wire         b_p         ,
    output wire         b_n              
);

wire    [9:0]   blue;
wire    [9:0]   green;
wire    [9:0]   red;

encode  encode_inst0
(
    .sys_clk    (clk     ),
    .sys_rst_n  (rst  ),
    .data_in    (rgb[7:0]   ),
    .c0         (hsync      ),
    .c1         (vsync      ),
    .de         (de         ),

    .data_out   (blue       )
);

//------------- encode_inst1 -------------
encode  encode_inst1
(
    .sys_clk    (clk     ),
    .sys_rst_n  (rst  ),
    .data_in    (rgb[15:8]  ),
    .c0         (hsync      ),
    .c1         (vsync      ),
    .de         (de         ),

    .data_out   (green      )
);

//------------- encode_inst2 -------------
encode  encode_inst2
(
    .sys_clk    (clk     ),
    .sys_rst_n  (rst  ),
    .data_in    (rgb[23:16] ),
    .c0         (hsync      ),
    .c1         (vsync      ),
    .de         (de         ),
    
    .data_out   (red        )
);

//------------- par_to_ser_inst0 -------------
par_to_ser  par_to_ser_inst0
(
    .clk      (clk    ),
    .par_data    (blue      ),

    .ser_data_p  (b_p  ),
    .ser_data_n  (b_n  )
);

//------------- par_to_ser_inst1 -------------
par_to_ser  par_to_ser_inst1
(
    .clk      (clk    ),
    .par_data    (green     ),

    .ser_data_p  (g_p  ),
    .ser_data_n  (g_n  )
);

//------------- par_to_ser_inst2 -------------
par_to_ser  par_to_ser_inst2
(
    .clk      (clk    ),
    .par_data    (red       ),

    .ser_data_p  (r_p  ),
    .ser_data_n  (r_n  )
);

//------------- par_to_ser_inst3 -------------
par_to_ser  par_to_ser_inst3
(
    .clk      (clk        ),
    .par_data    (10'b1111100000),

    .ser_data_p  (clk_p    ),
    .ser_data_n  (clk_n    )
);


endmodule //encode_par