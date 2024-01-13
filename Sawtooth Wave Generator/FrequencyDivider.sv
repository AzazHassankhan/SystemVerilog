module FrequencyDivider (
  input logic clk,            // System clock input
  output logic [7:0]SawTooth_wave    // 20Hz square wave output
);

  // Parameters
  parameter SYSTEM_FREQUENCY = 50000000;  // 50MHz system frequency
  parameter DESIRED_FREQUENCY = 19531.25;          // Desired square wave frequency
  // Counter for frequency division
  logic [31:0] counter=0;

  // Clock divider logic
  always_ff @(posedge clk) begin
    if (counter == 10) begin
      // Toggle the output at the desired frequency

      counter <= 0;
    end 
	 else begin
      // Increment the counter
      counter <= counter + 1;
    end
  end
assign SawTooth_wave=counter;
endmodule