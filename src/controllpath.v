module controller(
    input clk, rst,
    input go,CMP,
    
    output reg ld_a, ld_b, ld_m, ld_acc, ld_out, count_enb,done, count_reset
); 
parameter s0_idle= 3'b000;
parameter s1_ld_ab= 3'b001;
parameter s2_wait= 3'b010;
parameter s3__ld_m= 3'b011;
parameter s4_wait= 3'b100;
parameter s5_ld_acc= 3'b101;
parameter s6_wait= 3'b110;
parameter s7_out= 3'b111;

reg [2:0] ps, ns ;


always @(posedge clk or posedge rst)
begin
    if(rst)
        ps <= s0_idle;
    else
        ps <=ns;
end 
always@(go or CMP or ps)
begin
    case(ps)
        s0_idle: ns = (go)? s1_ld_ab:s0_idle;
        s1_ld_ab: ns = s2_wait;
        s2_wait: ns = s3__ld_m;
        s3__ld_m: ns = s4_wait;
        s4_wait: ns = s5_ld_acc;
        s5_ld_acc: ns = s6_wait;
        s6_wait: ns = (!CMP)?s7_out:s1_ld_ab;
        s7_out: ns = s0_idle;
    default: ns = s0_idle;
    endcase
end
always@(ps)
begin
    case(ps)
        s0_idle:
                begin
                    ld_a = 0;
                    ld_b =0;
                    ld_m=0;
                    ld_acc=0;
                    ld_out=0;
                    done =0;
                    count_enb=0;
                    count_reset = 0;
                end
        s1_ld_ab:begin
                    ld_a = 1;
                    ld_b =1;
                    ld_m=0;
                    ld_acc=0;
                    ld_out=0;
                    done =0;
                    count_enb=1;
                    count_reset = 0;
                end
        s2_wait:begin
                    ld_a = 0;
                    ld_b =0;
                   ld_m=0;
                   ld_acc=0;
                    ld_out=0;
                   done =0;
                    count_enb=0;
                    count_reset = 0;
                end
        s3__ld_m:begin
                    ld_a = 0;
                    ld_b =0;
                    ld_m=1;
                    ld_acc=0;
                    ld_out=0;
                    done =0;
                   count_enb=0;
                   count_reset = 0;
                end
        s4_wait:begin
                   ld_a = 0;
                    ld_b =0;
                    ld_m=0;
                    ld_acc=0;
                    ld_out=0;
                    done =0;
                    count_enb=0;
                    count_reset = 0;
                end
        s5_ld_acc:begin
                    ld_a = 0;
                    ld_b =0;
                    ld_m=0;
                    ld_acc=1;
                    ld_out=0;
                    done =0;
                    count_enb=0;
                    count_reset = 0;
                end
        s6_wait:begin
                   ld_a = 0;
                    ld_b =0;
                    ld_m=0;
                    ld_acc=0;
                    ld_out=0;
                    done =0;
                    count_enb=0;
                    count_reset = 0;
                end
        s7_out:begin
                     ld_a = 0;
                    ld_b =0;
                    ld_m=0;
                    ld_acc=0;
                    count_reset = 1;
                    ld_out=1;
                    done =1;
                   count_enb=0;
                end
    default: begin
                    ld_a =0;
                    ld_b =0;
                    ld_m=0;
                    ld_acc=0;
                    ld_out=0;
                    done =0;
                    count_enb=0;
                      count_reset = 0;
                end
    endcase
end

endmodule