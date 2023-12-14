module ROM #(parameter Data_Width= 8, parameter Addr_Width= 4)
(input logic [Addr_Width-1:0] addr,
 input logic clk,
 output logic [Data_Width-1:0] Dout);
 
logic [Data_Width-1:0] rom_memory [0:2**Addr_Width-1] = '{8'h0, 8'h1, 8'h2, 8'h3, 8'h4, 8'h5, 8'h6, 8'h7,
                                8'h8, 8'h9, 8'ha, 8'hb, 8'hc, 8'hd, 8'he, 8'hf};

always_ff@(posedge clk)
begin
Dout <= rom_memory[addr];
end
endmodule