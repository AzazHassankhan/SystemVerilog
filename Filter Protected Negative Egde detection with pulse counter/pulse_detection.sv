module pulse_detection(
input logic d,clk,reset_n,
output logic q,output logic [7:0]Pulse_Counter);


logic [11:0] register=0;
logic flag=0;
always_ff@(posedge clk) begin
	if (reset_n==0) begin
		q<=0;
		Pulse_Counter<=0;
		register<=0;
	end
	
	else if (d==0 && flag==1)begin
		q<=1;
		flag<=0; 
		Pulse_Counter<=Pulse_Counter+1;
	end

	else if (register[5:0]==6'b111111 && register[11:6]==6'b000000)begin
		flag  <=1;
	end

	else begin
		q<=0; 
	end
	
 register<= {register[10:0],d};
 
end

endmodule