module Counter_Tb;

  parameter Data_Width = 8;
  
  logic clk=0, en=0, rst=1, ld=0;
  logic [Data_Width-1:0] datain, dataout;
  
  Counter#(Data_Width) dut (
    .clk(clk),
    .en(en),
    .rst(rst),
    .ld(ld),
    .datain(datain),
    .dataout(dataout)
  );

  // Clock Generation
  always #5 clk = ~clk;

  // Test Stimulus
  initial begin @(posedge clk);
  
             $monitor("Time=%0t: en=%h, rst=%b, ld=%b, datain=%h, dataout=%h", $time, en, rst, ld, datain, dataout);

    #10;
	rst=0;
	#10;
	ld = 1;
    datain = 5;
    #10;

    // Reset Test
    ld = 0;
	en = 1;
    #10;
	for(int i=0;i<200;i++)
	begin
	 #10;
	end

    // Add more test scenarios as needed...

    // Simulation End
    $finish;
  end

  

endmodule
