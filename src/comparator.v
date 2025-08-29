`timescale 1ns/1ps
module comparator(
    input [3:0] count_out,
    output CMP
);
//parameter N =10 ; // number of interation 
reg temp_CMP;
always @(count_out)
begin
    if(count_out < 'd10)
        temp_CMP = 1;
    else 
        temp_CMP = 0;
end
assign CMP = temp_CMP;
endmodule