//////////////////////////////////////////////////////////////////////////////////
// Exercise #5 - Air Conditioning
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to an air conditioning control system
//  According to the state diagram provided in the exercise.
//
//  inputs:
//           clk, temperature [4:0]
//
//  outputs:
//           heating, cooling
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps


module ac(
input clk,
input[4:0] temp,
output heating,
output cooling 
);

reg [1:0] state;

always @(posedge clk) begin 

// 22 = 10110, 20 = 10100, 18 = 10010
//idle: 00, cooling: 01, heating: 10

if (temp >= 22) begin
state = 2'b01; //cooling 
end

else
if (temp <= 18) begin
state = 2'b10; //heating 
end
 
else 
if ((temp > 18) | (temp < 22)) begin
state = 2'b00; //idle
end

if (temp > 20) begin 
state = 2'b01; //cooling
end 

else 
state = 2'b00;

end

assign heating = (state == 2'b10);
assign cooling = (state == 2'b01);

endmodule

