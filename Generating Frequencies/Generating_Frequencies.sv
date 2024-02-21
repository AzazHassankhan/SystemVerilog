//module Generating_Frequencies(
//    input logic clk, reset_n,
//    output logic q
//);
//
//    logic [23:0] counter;
//
//    always_ff @(posedge clk) // Added parentheses around sensitivity list
//    begin
//        if (reset_n == 0)
//            counter <= 0;
//        else
//            counter <= counter + 1;
//    end
//
//    logic enable; 
//    assign enable = &counter; // Changed & to bitwise AND assignment operator
//
//    always_ff @(posedge enable)
//    begin
//        if (reset_n == 0)
//            q <= 0;
//        else
//            q <= ~q;
//    end
//
//endmodule
module Generating_Frequencies #(parameter Cycles=5000000) (
    input logic clk, reset_n,
    output logic q
);

    parameter bitwidth =$clog2(Cycles);
	 logic [bitwidth-1:0] counter;

    always_ff @(posedge clk) // Added parentheses around sensitivity list
    begin
        if (reset_n == 0)
            counter <= 0;
        else
            counter <= (counter + 1) % Cycles;
    end


    assign q = (counter == (Cycles-1))? 0:1; // Changed & to bitwise AND assignment operator


endmodule

