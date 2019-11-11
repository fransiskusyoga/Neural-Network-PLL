module lenet_io(
                input        clk,
                input        reset_n,

                // input        rx_done,
                // input  [7:0] rx_byte,
                // input        tx_active,
                // output       tx_dv,
                // output [7:0] tx_byte
                
                input rx_wire,
                input tx_wire
);
    ///////////////////////////////////////////////////////////
    // ALL PARAMETERS
    ///////////////////////////////////////////////////////////
    //GLOBAL PARAMETERS
    //Debug
    parameter DEBUG = 0;
    //Baudrate parameter
    parameter CLKS_PER_BIT = 434;
    
    //Neural Net input and output spec
    parameter NN_INP_BITS  = 6;
    parameter NN_OUT_BITS  = 10;
    parameter NN_INP_NODES = 381; //less than 65535 
    parameter NN_OUT_NODES = 10;  //less than 65535

    //Command list
    parameter CMD_HEADER     = 8'h23;
    parameter CMD_DATA_IN    = 8'h09;
    parameter CMD_CALC_START = 8'h14;
    parameter CMD_DATA_OUT   = 8'h04;
    parameter CALC_LATENCY   = 0;
    
    //LOCAL PARAMETERS
    //counter bit
    localparam integer INP_BYTES = $ceil(NN_INP_BITS/8.0);
    localparam integer OUT_BYTES = $ceil(NN_OUT_BITS/8.0);

    //list of states
    localparam STATE_IDLE     = 0;
    localparam STATE_WAIT_CMD = 1;
    localparam STATE_RECV_DAT = 2;
    localparam STATE_SAVE_DAT = 3;
    localparam STATE_LOAD_INP = 4;
    localparam STATE_FETCH_OU = 5;
    localparam STATE_END_ACK  = 6;
    localparam STATE_REQS_DAT = 7;
    localparam STATE_TX_LOAD  = 8;
    localparam STATE_SENDING  = 9;

    
    ///////////////////////////////////////////////////////////
    // ALL VARIABLES
    ///////////////////////////////////////////////////////////
    //Uart variables
    wire          rx_done;
    wire [7  : 0] rx_byte;
    wire          tx_active;
    wire          tx_dv;
    wire [7  : 0] tx_byte;
    //shift register to save address and data
    //  address is 2 byte and data is XXX_BYTES
    reg  [INP_BYTES*8+15: 0] rx_shift_reg;
    //  tx buff only keeps the data to be sent
    //  it does not include the address
    reg  [OUT_BYTES*8-1 : 0] tx_shift_reg;
    //Address controller
    wire [15 : 0] out_addr, inp_addr;

    //State variables and counter
    reg  [3 : 0] state, state_next;
    reg  [$clog2(INP_BYTES+2)-1   : 0] counter_rx;
    reg  [$clog2(OUT_BYTES+2)-1   : 0] counter_tx;
    reg  [$clog2(CALC_LATENCY+2)-1: 0] counter_calc;

    //Input and output buffer
    //  these buffer are used to make sure that the delay 
    //  propagation is caused by the neural network only 
    reg  [NN_INP_BITS-1 : 0] in      [0:380];
    reg  [NN_INP_BITS-1 : 0] in_d    [0:380];
    wire [NN_OUT_BITS-1 : 0] out     [0:  9];
    reg  [NN_OUT_BITS-1 : 0] out_reg [0:  9];

    ///////////////////////////////////////////////////////////
    // UART MODULES
    ///////////////////////////////////////////////////////////
    UART_RX #(
             .CLKS_PER_BIT(CLKS_PER_BIT))
          U_RX(
             .i_Rst_L(reset_n),
             .i_Clock(clk),
             .i_RX_Serial(rx_wire),
             .o_RX_DV(rx_done),
             .o_RX_Byte(rx_byte)
             );

    UART_TX #(
             .CLKS_PER_BIT(CLKS_PER_BIT)
             )
         U_TX(
             .i_Rst_L(reset_n),
             .i_Clock(clk),
             .i_TX_DV(tx_dv),
             .i_TX_Byte(tx_byte), 
             .o_TX_Active(tx_active),
             .o_TX_Serial(tx_wire),
             .o_TX_Done()
    ); 

    ///////////////////////////////////////////////////////////
    // MAIN Neural Net Modules
    ///////////////////////////////////////////////////////////
    lenet5_top lenet5(in_d[0],in_d[1],in_d[2],in_d[3],in_d[4],
                    in_d[5],in_d[6],in_d[7],in_d[8],in_d[9],
                    in_d[10],in_d[11],in_d[12],in_d[13],in_d[14],
                    in_d[15],in_d[16],in_d[17],in_d[18],in_d[19],
                    in_d[20],in_d[21],in_d[22],in_d[23],in_d[24],
                    in_d[25],in_d[26],in_d[27],in_d[28],in_d[29],
                    in_d[30],in_d[31],in_d[32],in_d[33],in_d[34],
                    in_d[35],in_d[36],in_d[37],in_d[38],in_d[39],
                    in_d[40],in_d[41],in_d[42],in_d[43],in_d[44],
                    in_d[45],in_d[46],in_d[47],in_d[48],in_d[49],
                    in_d[50],in_d[51],in_d[52],in_d[53],in_d[54],
                    in_d[55],in_d[56],in_d[57],in_d[58],in_d[59],
                    in_d[60],in_d[61],in_d[62],in_d[63],in_d[64],
                    in_d[65],in_d[66],in_d[67],in_d[68],in_d[69],
                    in_d[70],in_d[71],in_d[72],in_d[73],in_d[74],
                    in_d[75],in_d[76],in_d[77],in_d[78],in_d[79],
                    in_d[80],in_d[81],in_d[82],in_d[83],in_d[84],
                    in_d[85],in_d[86],in_d[87],in_d[88],in_d[89],
                    in_d[90],in_d[91],in_d[92],in_d[93],in_d[94],
                    in_d[95],in_d[96],in_d[97],in_d[98],in_d[99],
                    
                    in_d[100],in_d[101],in_d[102],in_d[103],in_d[104],
                    in_d[105],in_d[106],in_d[107],in_d[108],in_d[109],
                    in_d[110],in_d[111],in_d[112],in_d[113],in_d[114],
                    in_d[115],in_d[116],in_d[117],in_d[118],in_d[119],
                    in_d[120],in_d[121],in_d[122],in_d[123],in_d[124],
                    in_d[125],in_d[126],in_d[127],in_d[128],in_d[129],
                    in_d[130],in_d[131],in_d[132],in_d[133],in_d[134],
                    in_d[135],in_d[136],in_d[137],in_d[138],in_d[139],
                    in_d[140],in_d[141],in_d[142],in_d[143],in_d[144],
                    in_d[145],in_d[146],in_d[147],in_d[148],in_d[149],
                    in_d[150],in_d[151],in_d[152],in_d[153],in_d[154],
                    in_d[155],in_d[156],in_d[157],in_d[158],in_d[159],
                    in_d[160],in_d[161],in_d[162],in_d[163],in_d[164],
                    in_d[165],in_d[166],in_d[167],in_d[168],in_d[169],
                    in_d[170],in_d[171],in_d[172],in_d[173],in_d[174],
                    in_d[175],in_d[176],in_d[177],in_d[178],in_d[179],
                    in_d[180],in_d[181],in_d[182],in_d[183],in_d[184],
                    in_d[185],in_d[186],in_d[187],in_d[188],in_d[189],
                    in_d[190],in_d[191],in_d[192],in_d[193],in_d[194],
                    in_d[195],in_d[196],in_d[197],in_d[198],in_d[199],
                    
                    in_d[200],in_d[201],in_d[202],in_d[203],in_d[204],
                    in_d[205],in_d[206],in_d[207],in_d[208],in_d[209],
                    in_d[210],in_d[211],in_d[212],in_d[213],in_d[214],
                    in_d[215],in_d[216],in_d[217],in_d[218],in_d[219],
                    in_d[220],in_d[221],in_d[222],in_d[223],in_d[224],
                    in_d[225],in_d[226],in_d[227],in_d[228],in_d[229],
                    in_d[230],in_d[231],in_d[232],in_d[233],in_d[234],
                    in_d[235],in_d[236],in_d[237],in_d[238],in_d[239],
                    in_d[240],in_d[241],in_d[242],in_d[243],in_d[244],
                    in_d[245],in_d[246],in_d[247],in_d[248],in_d[249],
                    in_d[250],in_d[251],in_d[252],in_d[253],in_d[254],
                    in_d[255],in_d[256],in_d[257],in_d[258],in_d[259],
                    in_d[260],in_d[261],in_d[262],in_d[263],in_d[264],
                    in_d[265],in_d[266],in_d[267],in_d[268],in_d[269],
                    in_d[270],in_d[271],in_d[272],in_d[273],in_d[274],
                    in_d[275],in_d[276],in_d[277],in_d[278],in_d[279],
                    in_d[280],in_d[281],in_d[282],in_d[283],in_d[284],
                    in_d[285],in_d[286],in_d[287],in_d[288],in_d[289],
                    in_d[290],in_d[291],in_d[292],in_d[293],in_d[294],
                    in_d[295],in_d[296],in_d[297],in_d[298],in_d[299],
                    
                    in_d[300],in_d[301],in_d[302],in_d[303],in_d[304],
                    in_d[305],in_d[306],in_d[307],in_d[308],in_d[309],
                    in_d[310],in_d[311],in_d[312],in_d[313],in_d[314],
                    in_d[315],in_d[316],in_d[317],in_d[318],in_d[319],
                    in_d[320],in_d[321],in_d[322],in_d[323],in_d[324],
                    in_d[325],in_d[326],in_d[327],in_d[328],in_d[329],
                    in_d[330],in_d[331],in_d[332],in_d[333],in_d[334],
                    in_d[335],in_d[336],in_d[337],in_d[338],in_d[339],
                    in_d[340],in_d[341],in_d[342],in_d[343],in_d[344],
                    in_d[345],in_d[346],in_d[347],in_d[348],in_d[349],
                    in_d[350],in_d[351],in_d[352],in_d[353],in_d[354],
                    in_d[355],in_d[356],in_d[357],in_d[358],in_d[359],
                    in_d[360],in_d[361],in_d[362],in_d[363],in_d[364],
                    in_d[365],in_d[366],in_d[367],in_d[368],in_d[369],
                    in_d[370],in_d[371],in_d[372],in_d[373],in_d[374],
                    in_d[375],in_d[376],in_d[377],in_d[378],in_d[379],
                    in_d[380],
                    

                    out[0],out[1],out[2],out[3],out[4],
                    out[5],out[6],out[7],out[8],out[9]);
    
    //Register controller
    integer ii;
    always @(posedge clk)
    begin
        //fetch the output to register
        for(ii=0; ii<NN_OUT_NODES; ii=ii+1)
            if (state == STATE_FETCH_OU)  out_reg[ii] <= out[ii];
        //Load input to its register
        for(ii=0; ii<NN_INP_NODES; ii=ii+1)
            if (state == STATE_LOAD_INP)  in_d[ii] <=  in[ii];
    end


    ///////////////////////////////////////////////////////////
    // FSM and counter
    ///////////////////////////////////////////////////////////
    always @*
    begin
        //default condition
        state_next = state;
        //conditional
        if (~reset_n)
            state_next = STATE_IDLE;
        else if(tx_dv)
        begin
            if(state == STATE_SENDING)
                if(counter_tx >= OUT_BYTES-1)
                    state_next = STATE_IDLE;
        end
        else if(rx_done) //change on RX_done
        begin
            if ((state == STATE_IDLE) && (rx_byte == CMD_HEADER))
                state_next = STATE_WAIT_CMD;
            else if(state == STATE_WAIT_CMD)
            begin
                if(rx_byte == CMD_DATA_IN)
                    state_next = STATE_RECV_DAT;
                else if(rx_byte == CMD_CALC_START)
                    state_next = STATE_LOAD_INP;
                else if(rx_byte == CMD_DATA_OUT)
                    state_next = STATE_REQS_DAT;
                else 
                    state_next = STATE_IDLE;
            end
            else if(state == STATE_RECV_DAT)
            begin
                if(counter_rx >= INP_BYTES + 1) 
                    state_next = STATE_SAVE_DAT;
            end
            else if(state == STATE_REQS_DAT)
            begin
                if(counter_rx >= 1)            
                    state_next = STATE_TX_LOAD;
            end
        end
        //imidieatly change withouth rx done or tv
        if(state == STATE_SAVE_DAT)
            state_next = STATE_IDLE;
        else if(state == STATE_FETCH_OU)
            state_next = STATE_SENDING;
        else if(state == STATE_TX_LOAD)
            state_next = STATE_SENDING;
        else if(state == STATE_LOAD_INP)
        begin
            if(counter_calc >= CALC_LATENCY)
                state_next = STATE_FETCH_OU;
        end
    end 

    always @(posedge clk) state <= state_next;

    //all purpose counter
    always @(posedge clk)
        if(rx_done)
            if (state==STATE_WAIT_CMD)
                 counter_rx <= 0;
            else 
                counter_rx <= counter_rx + 1;
    
    always @(posedge clk)
        if ((state==STATE_WAIT_CMD)&rx_done)
            counter_tx <= 0;
        else if (tx_dv)
            counter_tx <= counter_tx + 1;

    always @(posedge clk)
        if ((state==STATE_WAIT_CMD)&rx_done)
            counter_calc <= 0;
        else 
            counter_calc <= counter_calc + 1;
            
    ///////////////////////////////////////////////////////////
    // Receive and transmit data management
    ///////////////////////////////////////////////////////////
    //input buffer and output buffer
    always @(posedge clk)
        if ( ((state==STATE_RECV_DAT)||(state==STATE_REQS_DAT)) && rx_done)
        begin
            rx_shift_reg[INP_BYTES*8+15 : 8] <= rx_shift_reg[INP_BYTES*8+7 : 0];
            rx_shift_reg[7:0] <= rx_byte;
        end
    assign inp_addr = rx_shift_reg[INP_BYTES*8+15 -: 16];
    assign out_addr = rx_shift_reg[15 : 0];
    //save the input
    always @(posedge clk)
        if(state==STATE_SAVE_DAT) 
            in[inp_addr] <= rx_shift_reg[NN_INP_BITS-1 : 0];
        else if(~reset_n & DEBUG)
            for(ii=0; ii<NN_INP_NODES; ii=ii+1)
                in[ii] <= 5'h7;

    //load data to be transmitter
    always @(posedge clk)
        if(state==STATE_TX_LOAD)
            tx_shift_reg <= {{(OUT_BYTES*8-NN_OUT_BITS){1'b0}},
                            out_reg[out_addr]};
        else if(state==STATE_FETCH_OU)
            tx_shift_reg <= {(OUT_BYTES*8){1'b1}};
        else if(tx_dv)
        begin
            tx_shift_reg[OUT_BYTES*8-1 : 8] <= 
                    tx_shift_reg[OUT_BYTES*8-9 : 0];
        end
    assign tx_byte = tx_shift_reg[OUT_BYTES*8-1 -: 8];
    //requenst to send
    assign tx_dv = (state==STATE_SENDING) & ~tx_active;

endmodule