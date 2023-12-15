module Counter#(parameter Data_Width=8)(
input logic clk,en,rst,ld,
input logic[Data_Width-1:0] datain,
output logic[Data_Width-1:0] dataout
);
logic [Data_Width-1:0] temp;
always_ff @(posedge clk)
begin
			if (rst)
				temp <= 0;
			else if (ld)
				temp <= datain;
			else if ( en)
				temp <= temp + 1;
end
assign dataout=temp;
endmodule