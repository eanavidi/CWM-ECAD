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

parameter clk_period = 10;
reg clk;
reg rst;
reg button;
reg err;
reg [2:0] colour_pre;
wire [2:0] colour;

initial begin 
clk = 1'b0;
forever 
#(clk_period/2) clk=~clk;
end

initial begin 
clk = 0;
rst = 1;
button = 1;
err = 0;
rst = 0;
colour_pre = colour;
#50
end

//Check if resets on colour 1
forever
#50
begin
if (rst && colour != 3'b001) 
begin $display("Test Failed!");
err = 1;
end
end

//Test failed if colour is 0 or 7 
rst = 1;
if ((colour == 0) || (colour == 3'b111)) 
begin $display("Test Failed!");
err = 1;
end

colour_pre = colour;
rst = 0;

//Check if colour constant with no button press
if ((button == 0) && (colour_pre != colour))
begin $display("Test Failed!");
err = 1;
end 

//Check if button press shifts colour by 1 
if (button == 1 && colour != colour_pre + 1)
begin $display("Test Failed!");
err = 1;
end 

//Check success 
initial begin 
#300
if (err == 0)
$display("Test Passed!");
$finish;
end 

//Counter

led top(
.clk (clk),
.rst (rst),
.button (button),
.colour (colour),
);

endmodule 
