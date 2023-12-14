module RAM_Tb;
    parameter DATA_WIDTH = 8;
    parameter ADDR_WIDTH = 6;

    // Inputs and outputs
    logic [(DATA_WIDTH - 1): 0] datain;
    logic [(ADDR_WIDTH - 1): 0] addr;
    logic wrt=0, rdd=0, clk=0;
    logic [(DATA_WIDTH - 1): 0] dataout;

    // Instantiate RAM module
    RAM #(DATA_WIDTH, ADDR_WIDTH) ram_inst (
        .datain(datain),
        .addr(addr),
        .wrt(wrt),
        .rdd(rdd),
        .clk(clk),
        .dataout(dataout)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Stimulus generation
    initial begin @(posedge clk);
             $monitor("Time=%0t: addr=%h, wrt=%b, rdd=%b, datain=%h, dataout=%h", $time, addr, wrt, rdd, datain, dataout);

        // Writing data to RAM
		wrt = 1;
		#10;
		for(int i=0;i<16;i++)
        begin 
			datain = i;
			addr = i;
			#10;
        end
        // Reading data from RAM
        wrt = 0;
		rdd = 1;
		for(int i=0;i<16;i++)
        begin 
		addr = i;
        #10;
		end

        // Stop simulation
        $stop;
    end

    // Display results
    initial begin
    end

endmodule
