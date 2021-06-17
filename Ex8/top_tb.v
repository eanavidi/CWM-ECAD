//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #8  - Simple End-to-End Design
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex8
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

timescale 1ns / 100ps

module top_tb(
);

parameter clk_period = 10;

reg clk_p;
reg [4:0] temp;
reg err;
reg rst_n;

wire clk_n;
wire heating;
wire cooling;

initial begin 
clk_p = 1'b0;
clk_n = 1'b1;
forever 
#(clk_period/2) clk=~clk;
end


assign clk_n =~clk_p;
end

initial begin 
err = 0;
temp = 5'b01111;
rst_n = 0;
