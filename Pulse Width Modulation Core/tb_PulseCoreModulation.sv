module tb_PulseCoreModulation;
  parameter SIM_DURATION = 1000; // Simulation duration in clock cycles
  
logic [8:0] duty_cycle=255;
logic clk=0;
logic enable=0;
logic reset_n=0;
logic q;

PulseCoreModulation dut(
.clk(clk),
.reset_n(reset_n),
.enable(enable),
.duty_cycle(duty_cycle),
.q(q)
);

always # 5 clk=~clk;

initial begin
 #40                  //delay of 40ns
 enable =1;
 reset_n = 1;
 #10               //delay of 10ns
 duty_cycle = 255; //set duty cycle
 #40000             //delay of 40000ns
 reset_n = 0;      //reset 
	#10
 reset_n = 1;      //start
	#10
 duty_cycle = 256;
 #40000
#SIM_DURATION $stop;
$finish;
end
endmodule