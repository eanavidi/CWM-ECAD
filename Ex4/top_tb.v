//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #4 - Dynamic LED lights
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex4 - Dynamic LED lights
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top_tb(
);

parameter clk_period =10;
reg clk;
reg rst;
reg button;
reg err;
wire [2:0] colour;
reg [2:0] colour_pre;

initial beginn 
clk = 1'b0;
forever 
#(clk_period/2) clk=~clk;
end

initial begin 
clk = 0;
rst = 1;
button = 1;
err = 0;
#10
rst = 0;

forever begin 
colour_pre = colour;
#10
if (rst && colour!=0) 
begin $display("Test Failed")
err = 1;
end

if (colour ==0 || colour == 3'b111) && rst!=0)
begin $display("Test Failed")
err =1;
end

else beginn 
if (colour prev != 3'b110) 
begin 

if ((button && colour!= colour_prev +1) || (button 

