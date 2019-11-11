
module lenet_io_tb();
    parameter CLK_HALF_PERIOD = 5;
    parameter c_CLKS_PER_BIT = 20;
    parameter c_BIT_PERIOD = 2*CLK_HALF_PERIOD*c_CLKS_PER_BIT;

    reg        clk, reset_n;
    reg        rx_wire;
    wire       tx_wire;
    wire       o_rx_done;
    wire [7:0] o_rx_byte;

    task UART_WRITE_BYTE;
        input [7:0] i_Data;
        integer     ii;
        
        begin
            // Send Start Bit
            rx_wire <= 1'b0;
            #(c_BIT_PERIOD);
            // Send Data Byte
            for (ii=0; ii<8; ii=ii+1)
            begin
                rx_wire <= i_Data[ii];
                #(c_BIT_PERIOD);
            end
            // Send Stop Bit
            rx_wire <= 1'b1;
            #(c_BIT_PERIOD);
        end
    endtask  
    
    task UART_WRITE_4BYTE;
        input [4*8-1:0] i_Data;
        integer  ii;
        begin
            for (ii=3; ii>=0; ii=ii-1)
                UART_WRITE_BYTE(i_Data[ii*8 +: 8]);
        end
    endtask

    lenet_io  #(.DEBUG(1),
                .CLKS_PER_BIT(c_CLKS_PER_BIT))
            DUT(
                .clk(clk),
                .reset_n(reset_n),

                .rx_wire(rx_wire),
                .tx_wire(tx_wire));

    initial begin
        clk = 1'b0; reset_n = 1'b1; 
        rx_wire = 1'b0;

        //reset
        #(6*CLK_HALF_PERIOD);
        reset_n = 1'b0;
        #(10*CLK_HALF_PERIOD);
        reset_n = 1'b1;
        #(6*CLK_HALF_PERIOD);

        //try to send 3 noise data
        //  noise(2) + header with false command(2)
        UART_WRITE_4BYTE(32'h01002374);

        //try to insert the data in
        //  HEAD(1) + CMD(1) + ADDR(2)
        UART_WRITE_4BYTE(32'h23090117);
        //  Data(1) + NOISE(3)
        UART_WRITE_4BYTE(32'hFFAABBCC);

        //Start calculation
        //  HEAD(1) + CMD(1) + NOISE(2)
        UART_WRITE_4BYTE(32'h2314090A);

        //Ask the systemt to send data
        //  Wait last communication data
        #(25*c_BIT_PERIOD);
        //  HEAD(1) + CMD(1) + ADDR(2)
        UART_WRITE_4BYTE(32'h23040007);

    end

    always #CLK_HALF_PERIOD clk = ~clk;
    
    //UART RX
    UART_RX #(
             .CLKS_PER_BIT(c_CLKS_PER_BIT))
          TEST_RX(
             .i_Rst_L(reset_n),
             .i_Clock(clk),
             .i_RX_Serial(tx_wire),
             .o_RX_DV(o_rx_done),
             .o_RX_Byte(o_rx_byte)
             );

    //----------------------------------------------------------------
    //Display the received byte
    //----------------------------------------------------------------
    reg [31:0] test_cntr = 32'b0;
    always @(posedge o_rx_done)
    begin
        if (test_cntr==10)
        begin
            test_cntr = 32'b1;
            $display("");
        end
        else test_cntr = test_cntr+1;
        $write("%h ",o_rx_byte);
    end

endmodule 