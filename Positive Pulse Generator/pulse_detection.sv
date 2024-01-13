module pulse_detection(
input logic d,clk,reset_n,
output logic q);

logic D_ff=0;

always_ff@(posedge clk) begin
	if (reset_n==0) begin
		q<=0; end
	else if (d==1  && D_ff==0)begin
		q   <=1; 
		D_ff<=1;	end
	else if (d==0 && D_ff==1)begin
		D_ff<=0;
		q<=0;
	end
	else begin
		q<=0; end
 
end

endmodule