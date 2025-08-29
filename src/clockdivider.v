module clockdivider(
input clk , rst,
output reg clk_out
);
reg [26:0] counter ;
always @(posedge clk or posedge rst) begin
if (rst) begin
clk_out <= 1'b0 ;
counter <= 0;
end
else if (counter == 27'd49999999) begin
 clk_out <= ~clk_out ;
 counter <= 0;
 end 
 else counter <= counter + 1;
end
endmodule