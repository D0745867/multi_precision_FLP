`timescale 1ns/1ns

module pipe_2 (
    output reg [51:0]mul_1_comb, mul_2_comb, mul_3_comb, mul_4_comb,
    output reg sign_1, sign_2, sign_3, sign_4,
    output reg [7:0] exp_1, exp_2, exp_3, exp_4,
    input x1_sign, x2_sign, x3_sign, x4_sign, y1_sign, y2_sign, y3_sign, y4_sign,
    input [7:0] x1_exp, x2_exp, x3_exp, x4_exp, y1_exp, y2_exp, y3_exp, y4_exp,
    input [12 : 0] x1_high, x1_low, x2_high, x2_low, x3_high, x3_low, x4_high, x4_low
    , y1_high, y1_low, y2_high, y2_low, y3_high, y3_low, y4_high, y4_low,
    input calculate_mode
);
reg [25:0] mul_1_ll, mul_1_lh, mul_1_hl, mul_1_hh,
            mul_2_ll, mul_2_lh, mul_2_hl, mul_2_hh,
            mul_3_ll, mul_3_lh, mul_3_hl, mul_3_hh,
            mul_4_ll, mul_4_lh, mul_4_hl, mul_4_hh;

always @(*) begin
    sign_1 = x1_sign ^ y1_sign;
    sign_2 = x2_sign ^ y2_sign;
    sign_3 = x3_sign ^ y3_sign;
    sign_4 = x4_sign ^ y4_sign;
end

always @(*) begin
    if(calculate_mode == `half_mode) begin
        exp_1 = x1_exp + y1_exp - 8'd15;
        exp_2 = x2_exp + y2_exp - 8'd15;
        exp_3 = x3_exp + y3_exp - 8'd15;
        exp_4 = x4_exp + y4_exp - 8'd15;
    end
    else begin
        exp_1 = x1_exp + y1_exp - 8'd127;
        exp_2 = x2_exp + y2_exp - 8'd127;
        exp_3 = x3_exp + y3_exp - 8'd127;
        exp_4 = x4_exp + y4_exp - 8'd127;
    end
end

always @(*) begin
    // X1 and Y1
    mul_1_ll = x1_low * y1_low;
    mul_1_lh = y1_low * x1_high;
    mul_1_hl = y1_high * x1_low;
    mul_1_hh = y1_high * x1_high;

    // X2 and Y2
    mul_2_ll = x2_low * y2_low;
    mul_2_lh = y2_low * x2_high;
    mul_2_hl = y2_high * x2_low;
    mul_2_hh = y2_high * x2_high;

    // X3 and Y3
    mul_3_ll = x3_low * y3_low;
    mul_3_lh = y3_low * x3_high;
    mul_3_hl = y3_high * x3_low;
    mul_3_hh = y3_high * x3_high;

    // X4 and Y4
    mul_4_ll = x4_low * y4_low;
    mul_4_lh = y4_low * x4_high;
    mul_4_hl = y4_high * x4_low;
    mul_4_hh = y4_high * x4_high;

    // Combine half multiplier
    mul_1_comb = {mul_1_hl, 13'b0} + {mul_1_hh, mul_1_ll} + {mul_1_lh, 13'b0};
    mul_2_comb = {mul_2_hl, 13'b0} + {mul_2_hh, mul_2_ll} + {mul_2_lh, 13'b0};
    mul_3_comb = {mul_3_hl, 13'b0} + {mul_3_hh, mul_3_ll} + {mul_3_lh, 13'b0};
    mul_4_comb = {mul_4_hl, 13'b0} + {mul_4_hh, mul_4_ll} + {mul_4_lh, 13'b0};
end

endmodule