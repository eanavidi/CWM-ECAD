//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #7 - Lights Selector
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex7 - Lights Selector
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top_tb(
);

module top_tb(
);

parameter clk_period = 10;
reg clk;
reg rst;
reg sel;
reg button;
reg err;
reg [23:0] light_prev;
wire [23:0] light;

initial begin 
clk = 1'b0;
forever 
#(clk_period/2) clk=~clk;
end

initial begin 
button = 0;
err = 0;
sel = 0;
rst = 1;

#(10*clk_period)
//check if reset works
if (light != 24'h000000) 
begin $display("Test Failed!");
err = 1;
end

rst = 0;
light_prev = light;

#(10*clk_period)
//check if output light stays the same with button not pressed 
if (light != light_prev) 
begin $display("Test Failed!");
err = 1;
end

#(10*clk_period)
forever begin
button = 1;
light_prev = light;

#clk_period
//check if button works 
if (light == light_prev) 
begin $display("Test Failed!");
err = 1;
end
end
end

//Check success 
initial begin 
#300
if (err == 0)
$display("Test Passed!");
$finish;
end 

lights_select(
.clk (clk),
.rst (rst),
.sel (sel),
.button (button),
.light (light)
);

endmodule
