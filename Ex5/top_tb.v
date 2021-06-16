//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #5 - Air Conditioning
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex5 - Air Conditioning
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top_tb(
);

parameter clk_period = 10;

reg clk;
reg [4:0] temp;
reg err;

wire heating;
wire cooling;

initial begin
clk = 1'b0;
forever
#(clk_period/2) clk=~clk;
end

initial begin 
temp = 5'b10001;
err = 0;

forever begin 
#clk_period 
if ((temp <= 5'b10010) && (cooling) && (!heating)) //<18 
begin $display("Test Failed!");
err = 1;
end

if ((temp >= 5'b10110) && (heating) && (!cooling)) //>22
begin $display("Test Failed!");
err = 1;
end

if ((heating) && (cooling)) //heating and cooling 
begin $display("Test Failed!");
err = 1;
end

#clk_period
temp <= temp + 5'b01;
end

initial begin 
#(10*clk_period)
if (err == 0)
begin $display("Test Passed!");
$finish;
end

ac top(
.temp (temp),
.clk (clk),
.heating (heating),
.cooling (cooling)
);



