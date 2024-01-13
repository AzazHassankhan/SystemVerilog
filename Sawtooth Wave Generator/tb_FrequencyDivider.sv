module tb_FrequencyDivider;
  parameter SIM_DURATION = 10000; // Simulation duration in clock cycles

  // Signals
  logic clk=0;
  logic[7:0] SawTooth_wave;

  // Instantiate the FrequencyDivider module
  FrequencyDivider dut  (
    .clk(clk),
    .SawTooth_wave(SawTooth_wave)
  );

  // Generate clock
   always #5 clk = ~clk;


  // Testbench logic
   initial begin@(posedge clk);
    // Initialize signals

    // Monitor the SawTooth_wave output
    $monitor("Time=%0t clk=%b SawTooth_wave=%b", $time, clk, SawTooth_wave);
	#SIM_DURATION $stop;
     // Simulation End
    $finish;
  end

endmodule


