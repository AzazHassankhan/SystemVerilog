module RAM#(parameter DATA_WIDTH = 8, parameter ADDR_WIDTH = 6)
	(		input logic[(DATA_WIDTH - 1): 0] datain,
		input logic[(ADDR_WIDTH - 1): 0] addr,
		input logic wrt, input logic rdd, input logic clk,
		output logic[(DATA_WIDTH - 1): 0] dataout
);
logic[DATA_WIDTH - 1: 0] ram[0: 2 **ADDR_WIDTH - 1];
always_ff @(posedge clk)
begin
if (wrt) 
begin ram[addr] <= datain; end

if (rdd) 
begin
dataout <= ram[addr];
end

end
endmodule