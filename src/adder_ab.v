module adder_ab(
input [11:0] tm_out,tacc_out,
output [11:0] tadd

);
assign tadd = tm_out + tacc_out ;
endmodule
