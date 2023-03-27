`timescale 1ns/1ns

module reg_2 (
    output reg [51:0]mul_1_comb_o, mul_2_comb_o, mul_3_comb_o, mul_4_comb_o,
    output reg sign_1_o, sign_2_o, sign_3_o, sign_4_o,
    output reg [7:0] exp_1_o, exp_2_o, exp_3_o, exp_4_o,
    input [51:0]mul_1_comb, mul_2_comb, mul_3_comb, mul_4_comb,
    input sign_1, sign_2, sign_3, sign_4,
    input [7:0] exp_1, exp_2, exp_3, exp_4,
    input clk, rst
);

always @(posedge clk, negedge rst) begin
    if(~rst) begin
        mul_1_comb_o <= 52'b0;
        mul_2_comb_o <= 52'b0;
        mul_3_comb_o <= 52'b0;
        mul_4_comb_o <= 52'b0;
        sign_1_o <= 1'b0;
        sign_2_o <= 1'b0;
        sign_3_o <= 1'b0;
        sign_4_o <= 1'b0;
        exp_1_o <= 8'b0;
        exp_2_o <= 8'b0;
        exp_3_o <= 8'b0;
        exp_4_o <= 8'b0;
    end
    else begin
        mul_1_comb_o <= mul_1_comb;
        mul_2_comb_o <= mul_2_comb;
        mul_3_comb_o <= mul_3_comb;
        mul_4_comb_o <= mul_4_comb;
        sign_1_o <= sign_1;
        sign_2_o <= sign_2;
        sign_3_o <= sign_3;
        sign_4_o <= sign_4;
        exp_1_o <= exp_1;
        exp_2_o <= exp_2;
        exp_3_o <= exp_3;
        exp_4_o <= exp_4;
    end
end

endmodule