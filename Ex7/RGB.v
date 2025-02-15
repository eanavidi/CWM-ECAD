//////////////////////////////////////////////////////////////////////////////////
// Exercise #6 - RGB Colour Converter
// Student Name:
// Date: 
//
//
//  Description: In this exercise, you need to design a memory with 8 entries, 
//  converting colours to their RGB code.
//
//  inputs:
//           clk, colour [2:0], enable
//
//  outputs:
//           rgb [23:0]
//
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module RGB(
input clk,
input enable,
input [2:0] colour, 

output [23:0] rgb
);

blk_mem_gen_1 your_instance_name(
  .clka (clk),
  .ena (enable),
  .wea (1'b0),
  .addra (colour),
  .dina (24'b0),
  .douta (rgb)
);

endmodule 

