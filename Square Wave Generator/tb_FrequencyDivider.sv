module tb_FrequencyDivider;
  parameter SIM_DURATION = 10000; // Simulation duration in clock cycles

  // Signals
  logic clk=0;
  logic square_wave;

  // Instantiate the FrequencyDivider module
  FrequencyDivider dut  (
    .clk(clk),
    .square_wave(square_wave)
  );

  // Generate clock
   always #5 clk = ~clk;


  // Testbench logic
   initial begin@(posedge clk);
    // Initialize signals

    // Monitor the square_wave output
    $monitor("Time=%0t clk=%b square_wave=%b", $time, clk, square_wave);
	#SIM_DURATION $stop;
     // Simulation End
    $finish;
  end

endmodule


