module reg_a(
input [3:0] a,
input clk , rst, ld_a,
output [3:0] a_out
);

reg [3:0] reg_a;
always @(posedge clk or posedge rst ) begin
if (rst)
reg_a <=0;
else if (ld_a)
reg_a <= a;
end
assign a_out = reg_a;

endmodule

