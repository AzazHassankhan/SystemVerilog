module tb_pulse_detection;
  parameter SIM_DURATION = 1000; // Simulation duration in clock cycles

logic clk=0;
logic reset_n=0;
logic d=0;
logic q;
pulse_detection dut(
.clk(clk),
.reset_n(reset_n),
.d(d),
.q(q)
);

always # 5 clk=~clk;

initial begin
#10
reset_n=1;
for(int i=0;i<10;i++)begin
d=1;
#10; end
for(int i=0;i<10;i++)begin
d=0;
#10; end
for(int i=0;i<10;i++)begin
d=1;
#10; end
for(int i=0;i<10;i++)begin
d=0;
#10; end
#SIM_DURATION $stop;
$finish;
end
endmodule