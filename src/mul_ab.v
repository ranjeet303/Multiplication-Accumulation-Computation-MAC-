module mul_ab(
input [3:0] a_out,b_out,
output [11:0] tm_in
);
assign tm_in= a_out*b_out ;
endmodule