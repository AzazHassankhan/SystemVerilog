module ROM_Tb;

    // Constants
    parameter Data_Width = 8;
    parameter Addr_Width = 4;

    // Inputs
    logic [Addr_Width - 1: 0] addr;
    logic clk = 0;

    // Outputs
    logic [Data_Width - 1: 0] Dout;

    // Instantiate ROM module
    ROM #(
        .Data_Width(Data_Width),
        .Addr_Width(Addr_Width)
    ) dut (
        .addr(addr),
        .clk(clk),
        .Dout(Dout)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Testcase
    initial begin @(posedge clk);
        $monitor("Time = %0t, Address = %h, Data = %h", $time, addr, Dout);
        #10
        // Perform read operations for various addresses
		for(int i=0;i<16;i=i+1)
        begin
		addr = i; #10;
		end
        // Add more address values for testing if needed
        // ...

        // End simulation
        $finish;
    end

endmodule
