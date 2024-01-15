module PulseCoreModulation(
input logic [8:0] duty_cycle,
input logic clk, reset_n, enable,
output logic q
);

 // PWM Counter
 logic [7:0] counter = 0;

always_ff@(posedge clk)
 begin 
 if(reset_n == 1'b0) begin
	counter <= 8'b00000000; end
 else if(enable) begin
	counter <= counter + 1'b1;
	end
	

end 

// PWM Comparator
assign q = (duty_cycle[8]==1) ? 1'b1 : (counter >= duty_cycle) ? 1'b0 : 1'b1;

endmodule
