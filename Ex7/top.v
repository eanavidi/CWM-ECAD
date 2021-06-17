//////////////////////////////////////////////////////////////////////////////////
// Exercise #7 - Lights Selector
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to implement a selector between RGB 
// lights and a white light, coded in RGB. If sel is 0, white light is used. If
//  the sel=1, the coded RGB colour is the output.
//
//  inputs:
//           clk, sel, rst, button
//
//  outputs:
//           light [23:0]
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module lights_select(
input clk,
input rst,
input button,
input sel,
output [23:0] light
);

wire [23:0] rgb;
wire [2:0] colour;

//LED lights that move through 1-6
LED ex4(
.clk (clk),
.rst (rst),
.button (button),
.colour (colour)
);

//Colour converter 
RGB ex6(
.clk (clk),
.colour (colour),
.rgb (rgb),
.enable (1'b1)
);

//multiplexer outputs white or rgb 
MUX ex2(
.a (24'hFFFFFF), //white - rgb (255,255,255) is 24'hFFFFFF
.b (rgb), //rgb
.sel (sel),
.out (light)
);

endmodule
