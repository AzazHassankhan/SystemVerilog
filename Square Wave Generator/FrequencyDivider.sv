module FrequencyDivider (
  input logic clk,            // System clock input
  output logic square_wave    // 20Hz square wave output
);

  // Parameters
  parameter SYSTEM_FREQUENCY = 50000000;  // 50MHz system frequency
  parameter DESIRED_FREQUENCY = 20;          // Desired square wave frequency
logic square_wave_wire=0;
  // Counter for frequency division
  logic [31:0] counter=0;

  // Clock divider logic
  always_ff @(posedge clk) begin
    if (counter == SYSTEM_FREQUENCY/DESIRED_FREQUENCY) begin
      // Toggle the output at the desired frequency
      square_wave_wire <= ~square_wave_wire;
      counter <= 0;
    end 
	 else begin
      // Increment the counter
      counter <= counter + 1;
    end
  end
assign square_wave=square_wave_wire;
endmodule