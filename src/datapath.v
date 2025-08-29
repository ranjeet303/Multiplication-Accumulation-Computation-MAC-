module datapath( 
 input rst,clk_out,
    input [3:0] a, b,
    input ld_a, ld_b, ld_m, ld_acc, ld_out ,count_enb,count_reset,
    output CMP,
    output [11:0] out,
    output [11:0] Reg_m,
    output [3:0] count_out
);
wire [3:0] a_out, b_out;
wire [11:0] tm_in,  tm_out, tadd, tacc_out;

assign Reg_m = tm_out ;

reg_a Ra (.clk_out(clk), .rst(rst) , .a(a), .ld_a(ld_a) , .a_out(a_out));
reg_b Rb (.clk_out(clk), .rst(rst) , .b(b), .ld_b(ld_b) , .b_out(b_out));
mul_ab Bmul (.a_out(a_out), .b_out(b_out), .tm_in(tm_in));
reg_m Rm(.clk_out(clk), .rst(rst), .tm_in(tm_in), .ld_m(ld_m) , .tm_out(tm_out));
adder_ab Badd (.tacc_out(tacc_out), .tm_out(tm_out), .tadd(tadd));
reg_Racc Racc(.clk_out(clk), .rst(rst) , .tadd(tadd), .ld_acc(ld_acc) , .tacc_out(tacc_out));
reg_out Ro (.clk_out(clk), .rst(rst) , .tacc_out(tacc_out), .ld_out(ld_out), .out(out));
counter Bco (.clk_out(clk_out), .rst(rst),.count_enb(count_enb),.count_out(count_out), .count_reset(count_reset));
comparator Bcom (.count_out(count_out),.CMP(CMP));

endmodule 

