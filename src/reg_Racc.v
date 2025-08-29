`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.03.2025 10:39:54
// Design Name: 
// Module Name: reg_Racc
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module reg_Racc(
input [11:0] tadd,
input clk , rst, ld_acc,
output [11:0] tacc_out
);
reg [11:0] reg_acc;
always @(posedge clk or posedge rst ) begin
if (rst)
reg_acc <=0;
else if (ld_acc)
reg_acc <= tadd;
end
assign tacc_out = reg_acc;
endmodule
