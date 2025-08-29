module reg_m(
input [11:0] tm_in,
input clk , rst, ld_m,
output [11:0] tm_out
);
reg [11:0] reg_m;
always @(posedge clk or posedge rst ) begin
if (rst)
reg_m <=0;
else if (ld_m)
reg_m <= tm_in;
end
assign tm_out = reg_m;

endmodule