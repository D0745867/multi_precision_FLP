`timescale 1ns/1ns

module reg_3 (
    output reg [7:0] adder_exp_1_o, adder_exp_2_o,
    output reg signed [51:0] sum_mul_12_o, sum_mul_34_o,
    input [7:0] adder_exp_1, adder_exp_2,
    input signed [51:0] sum_mul_12, sum_mul_34,
    input clk, rst
);

always @(posedge clk, negedge rst) 
    if(~rst) begin
        adder_exp_1_o <= 8'b0;
        adder_exp_2_o <= 8'b0;
        sum_mul_12_o <= 52'b0;
        sum_mul_34_o <= 52'b0;
    end
    else begin
        adder_exp_1_o <= adder_exp_1;
        adder_exp_2_o <= adder_exp_2;
        sum_mul_12_o <= sum_mul_12;
        sum_mul_34_o <= sum_mul_34;
    end
endmodule