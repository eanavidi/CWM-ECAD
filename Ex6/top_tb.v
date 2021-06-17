//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #6 - RGB Colour Converter
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex6 - RGB Colour Converter
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top_tb(
);

parameter clk_period = 10;
reg clk;
reg enable;
reg[2:0] colour;
reg err;
reg [23:0] rgb_test;
wire [23:0] rgb;

initial begin 
clk = 1'b0;
forever
#(clk_period/2) clk=~clk;
end

initial begin 
err = 0;
enable = 0;

colour = 3'b000;

#clk_period
if (rgb != 24'b0) 
begin $display("Test Failed!");
err = 1;
end

forever begin
enable = 1;
rgb_test = rgb;
colour <= (colour + 3'd1);

#(10*clk_period)
if (rgb_test == rgb) 
begin $display("Test Failed!");
err = 1;
end

end 
end 

initial begin 
#1000
if (err == 0)
begin $display("Test Passed!");
$finish;
end
end

RGB top(
.rgb(rgb),
.clk(clk),
.enable(enable),
.colour(colour)
);

endmodule



