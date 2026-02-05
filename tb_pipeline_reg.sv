module tb;

    logic clk;
    logic rst_n;
    logic in_valid;
    logic in_ready;
    logic [7:0] in_data;
    logic out_valid;
    logic out_ready;
    logic [7:0] out_data;

    pipeline_reg dut (
        .clk(clk),
        .rst_n(rst_n),
        .in_valid(in_valid),
        .in_ready(in_ready),
        .in_data(in_data),
        .out_valid(out_valid),
        .out_ready(out_ready),
        .out_data(out_data)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst_n = 0;
        in_valid = 0;
        in_data = 0;
        out_ready = 0;

        #20 rst_n = 1;

        // Send data
        #10 in_valid = 1; in_data = 8'hA5;
        #10 out_ready = 1;

        #10 in_valid = 0;
        #20;

        // Backpressure test
        in_valid = 1; in_data = 8'h3C;
        out_ready = 0;
        #20;
        out_ready = 1;

        #20 $finish;
    end

    initial begin
        $monitor("T=%0t | in_v=%b in_r=%b in_d=%h | out_v=%b out_r=%b out_d=%h",
                 $time, in_valid, in_ready, in_data,
                 out_valid, out_ready, out_data);
    end

endmodule
