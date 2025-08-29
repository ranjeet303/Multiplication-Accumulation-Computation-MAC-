module reg_out(
input [11:0] tacc_out,
input clk , rst, ld_out,
output [11:0] out
);
reg [11:0] reg_out;
always @(posedge clk or posedge rst ) begin
if (rst)
reg_out <=0;
else if (ld_out)
reg_out <= tacc_out;
end
assign out = reg_out;

endmodule