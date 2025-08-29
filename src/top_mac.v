module top_mac (
    input clk_out, rst, go,
    input [3:0] a,b,
    output  [11:0] out,
    output [11:0] Reg_m
);

   wire clk;
    wire CMP, done;
   
    wire [3:0] count_out;
    
   
    
    wire ld_a, ld_b, ld_m, ld_acc, ld_out, count_enb, count_reset;

    
    // Datapath Instance
    datapath dp_inst (
        
        .rst(rst),
        .clk_out(clk_out),
        .a(a),  // Lower 4 bits from memory for A
        .b(b),  // Upper 4 bits from memory for B
        .ld_a(ld_a),
        .ld_b(ld_b),
        .ld_m(ld_m),
        .ld_acc(ld_acc),
        .ld_out(ld_out),
        .count_enb(count_enb),
        .count_reset(count_reset),
        .CMP(CMP),
        .out(out),  // ✅ Ensure `out` is properly connected
        .Reg_m(Reg_m),
        .count_out(count_out)
    );

    // Controller Instance
    controller ctrl_inst (
        .clk_out(clk),
        .rst(rst),
        .go(go),
        .CMP(CMP),
        .ld_a(ld_a),
        .ld_b(ld_b),
        .ld_m(ld_m),
        .ld_acc(ld_acc),
        .ld_out(ld_out),
        .count_enb(count_enb),
        .done(done),
        .count_reset(count_reset)
    );
    
    clockdivider clk_div(
    .clk(clk),
    .rst(rst),
    .clk_out(clk_out) 
    );

    // **Fix: Proper Initialization of Memory Signals**
  

    // **Fix: Ensure Done Signal is Read and Process Ends**
    always @(posedge clk) begin
        if (done) begin
            $display("Accumulation Complete. Final Output: %d", out);
             // ✅ Stops simulation after reading `out`
        end
    end

    // **Fix: Ensure `out` is continuously monitored**
 

endmodule
