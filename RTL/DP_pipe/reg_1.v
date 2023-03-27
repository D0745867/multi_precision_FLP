`timescale 1ns/1ns

module reg_1 (
    output reg x1_sign_o, x2_sign_o, x3_sign_o, x4_sign_o, y1_sign_o, y2_sign_o, y3_sign_o, y4_sign_o,
    output reg[7:0] x1_exp_o, x2_exp_o, x3_exp_o, x4_exp_o, y1_exp_o, y2_exp_o, y3_exp_o, y4_exp_o,
    output reg [12 : 0] x1_high_o, x1_low_o, x2_high_o, x2_low_o, x3_high_o, x3_low_o, x4_high_o, x4_low_o
    , y1_high_o, y1_low_o, y2_high_o, y2_low_o, y3_high_o, y3_low_o, y4_high_o, y4_low_o,
    input x1_sign, x2_sign, x3_sign, x4_sign, y1_sign, y2_sign, y3_sign, y4_sign,
    input [7:0] x1_exp, x2_exp, x3_exp, x4_exp, y1_exp, y2_exp, y3_exp, y4_exp,
    input [12 : 0] x1_high, x1_low, x2_high, x2_low, x3_high, x3_low, x4_high, x4_low
    , y1_high, y1_low, y2_high, y2_low, y3_high, y3_low, y4_high, y4_low,
    input gclk, clk, rst
);

always @(posedge clk, negedge rst) begin
    if(~rst) begin
        x1_sign_o <= 1'b0;
        x2_sign_o <= 1'b0;
        x3_sign_o <= 1'b0;
        x4_sign_o <= 1'b0;
        y1_sign_o <= 1'b0;
        y2_sign_o <= 1'b0;
        y3_sign_o <= 1'b0;
        y4_sign_o <= 1'b0;

        x1_exp_o <= 8'b0;
        x2_exp_o <= 8'b0;
        x3_exp_o <= 8'b0;
        x4_exp_o <= 8'b0;
        y1_exp_o <= 8'b0;
        y2_exp_o <= 8'b0;
        y3_exp_o <= 8'b0;
        y4_exp_o <= 8'b0;

        x1_low_o <= 13'b0;
        x2_low_o <= 13'b0;
        x3_low_o <= 13'b0;
        x4_low_o <= 13'b0;
        y1_low_o <= 13'b0;
        y2_low_o <= 13'b0;
        y3_low_o <= 13'b0;
        y4_low_o <= 13'b0;
    end
    else begin
        x1_sign_o <= x1_sign;
        x2_sign_o <= x2_sign;
        x3_sign_o <= x3_sign;
        x4_sign_o <= x4_sign;
        y1_sign_o <= y1_sign;
        y2_sign_o <= y2_sign;
        y3_sign_o <= y3_sign;
        y4_sign_o <= y4_sign;

        x1_exp_o <= x1_exp;
        x2_exp_o <= x2_exp;
        x3_exp_o <= x3_exp;
        x4_exp_o <= x4_exp;
        y1_exp_o <= y1_exp;
        y2_exp_o <= y2_exp;
        y3_exp_o <= y3_exp;
        y4_exp_o <= y4_exp;

        x1_low_o <= x1_low;
        x2_low_o <= x2_low;
        x3_low_o <= x3_low;
        x4_low_o <= x4_low;
        y1_low_o <= y1_low;
        y2_low_o <= y2_low;
        y3_low_o <= y3_low;
        y4_low_o <= y4_low;
    end
end

always @(posedge gclk, negedge rst) begin
    if (~rst) begin
        x1_high_o <= 13'b0;
        x2_high_o <= 13'b0;
        x3_high_o <= 13'b0;
        x4_high_o <= 13'b0;
        y1_high_o <= 13'b0;
        y2_high_o <= 13'b0;
        y3_high_o <= 13'b0;
        y4_high_o <= 13'b0;
    end
    else begin
        x1_high_o <= x1_high;
        x2_high_o <= x2_high;
        x3_high_o <= x3_high;
        x4_high_o <= x4_high;
        y1_high_o <= y1_high;
        y2_high_o <= y2_high;
        y3_high_o <= y3_high;
        y4_high_o <= y4_high;
    end
end

endmodule