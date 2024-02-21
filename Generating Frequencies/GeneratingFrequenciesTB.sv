module GeneratingFrequenciesTB;

 
  logic clk=0, reset_n=1,q;

  
  Generating_Frequencies dut (
    .clk(clk),
    .q(q),
    .reset_n(reset_n)

  );

  // Clock Generation
  always #5 clk = ~clk;

  // Test Stimulus
  initial begin @(posedge clk);
  
    #10;
	reset_n=0;
	#10;

    #4000;


    // Add more test scenarios as needed...

    // Simulation End
    $finish;
  end

  

endmodule