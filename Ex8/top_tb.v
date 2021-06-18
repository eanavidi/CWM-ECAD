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
temp = 5'b01110;
rst_n = 0;

forever begin 
#(10*clk_period)
if ((temp <= 5'b10010) && (cooling !=1'b0) && (heating != 1'b1)); //temp < 18 check
begin $display("Test Failed!");
err = 1;
end

if ((temp >= 5'b10110) && (cooling !=1'b1) && (heating != 1'b0)); //temp > 22 check
begin $display("Test Failed!");
err = 1;
end

if ((temp > 5'b10010) && (temp < 5'b10110) && (cooling !=1'b0) && (heating != 1'b0)); //18<temp<22 check
begin $display("Test Failed!");
err = 1;
end

temp <= temp + 5'b00001;

end 
end

//Check success 
initial begin 
#1000
if (err == 0)
$display("Test Passed!");
$finish;
end 

eight top(
.clk_p (clk_p),
.clk_n (clk_n),
.rst_n (rst_n),
.temperature_0, 
.temperature_1,
.temperature_2, 
.temperature_3, 
.temperature_4
.heating (heating),
.cooling (cooling)
);

endmodule 

