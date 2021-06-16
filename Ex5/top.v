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

// 22 = 10110, 20 = 10100, 18 = 10010
module ac(
input clk,
input[4:0] temp,
output heating,
output cooling 
);

reg [1:0] state;


// idle: 00, cooling: 01, heating: 10
always @(posedge clk) begin 
if (state ==2'b00) begin //idle 
//turn heating on 
state = (temp <= 5'b10010)? 2'b10: 2'b00; 
// turn cooling on
state = (temp >= 5'b10110)? 2'b01: 2'b00;
end 

else 
if (state == 2'b01) begin //cooling
// turn cooling off 
state = ((temp >= 5'b10010) && (temp <= 5'b10110))? 2'b00: 2'b01;
end

else 
if (state == 2'b10) begin //heating
// turn heating off
state = (temp >=5'b10100) ? 2'b00: 2'b10;
end

else 
state = 2'b00;

end
assign heating = (state == 2'b10);
assign cooling = (state == 2'b01);

endmodule
