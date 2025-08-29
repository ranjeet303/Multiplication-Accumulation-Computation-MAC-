module reg_b (
input [3:0] b,
input clk, rst , ld_b,
output [3:0] b_out
);
reg [3:0] reg_b;
always @ (posedge clk or posedge rst) begin
if (rst)
reg_b <= 0 ;
else if (ld_b)
reg_b <= b;
end
assign b_out = reg_b;
endmodule