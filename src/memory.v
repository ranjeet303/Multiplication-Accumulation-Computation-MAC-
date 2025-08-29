
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.03.2025 21:54:52
// Design Name: 
// Module Name: memory
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


module memory
#(parameter INIT_FILE = "")
(

input clk,
input w_en,
input r_en,
input [3:0] w_addr,
input [3:0] r_addr,
input [7:0] w_data,

output  [7:0] r_data


    );
    reg [7:0] reg_r_data;
    reg [7:0] mem [0:15];
    always @(posedge clk) begin
    if(w_en == 1'b1)
    mem [w_addr] <= w_data;
    if (r_en ==1'b1)
    reg_r_data <= mem [r_addr];
    end
    assign r_data = reg_r_data;
    initial if (INIT_FILE) begin
    $readmemh (INIT_FILE,mem);
    end
endmodule
