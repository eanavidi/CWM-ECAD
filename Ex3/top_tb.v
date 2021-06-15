//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #3 - Active IoT Devices Monitor
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex3 - Active IoT Devices Monitor
// Guidance: start with simple tests of the module (how should it react to each 
// control signal?). Don't try to test everything at once - validate one part of 
// the functionality at a time.
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top_tb();

parameter clk_period = 10;
reg clk;
reg rst;
reg change;
reg on_off;
reg err;
reg [7:0] count;
reg [7:0] count_prev;
wire [7:0] count;

//clock generation
initial begin
clk = 1'b0;


forever begin
#clk_period clk=~clk;
end 

end

initial begin 
rst = 1;
change = 0;
on_off = 1;
err = 0;
count_prev = 0;
count_prev = count;

#(10*clk_period);
       if (count != 0)
         begin $display ("Test Failed");
         err = 1;
end

rst = 0;
#(10*clk_period);
       if (count != count_prev)
         begin $display ("Test Failed");
         err = 1;

end

end

forever begin
#clk_period;
counter_prev = on_off ? count_prev + 1: count_prev - 1;
if (on_off == 1) & (count < count_prev)
begin 
err = 1;

end

if (count = count_prev)
  begin $display ("Test Failed");
  err = 1;

end


if  (count_prev == 10) 
begin 
  on_off =~on_off;

end

end

//Check test
initial begin 
#500;
if (err=0)
$display("Test Passed");
$finish;
end

monitor top (
.rst (on_off),
.change (change),
.clk (clk),
.on_off (on_off),
.count (count)
);

endmodule 


