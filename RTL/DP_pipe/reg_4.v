`timescale 1ns/1ns

module reg_4 (
    output reg [7:0] adder_exp_final_o,
    output reg [51:0] sum_mul_all_o,
    output reg [51:0] sum_mul_all_pos_o,
    input [7:0] adder_exp_final,
    input [51:0] sum_mul_all,
    input [51:0] sum_mul_all_pos,
    input clk, rst
);

always @(posedge clk, negedge rst) begin
    if(~rst) begin
        adder_exp_final_o <= 8'b0;
        sum_mul_all_o <= 52'b0;
        sum_mul_all_pos_o <= 52'b0;
    end
    else begin
        adder_exp_final_o <= adder_exp_final;
        sum_mul_all_o <=sum_mul_all;
        sum_mul_all_pos_o <= sum_mul_all_pos;
    end
end
    
endmodule