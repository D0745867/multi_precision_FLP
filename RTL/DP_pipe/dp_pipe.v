`timescale 1ns/1ns
`define single_len 32
`define half_len 16
`define single_man_len 26
`define half_man_len 13
`define total_data 1000
`define single_mode 1'b1
`define half_mode 1'b0
`define single_len 32
module dp_pipe (
    output [`single_len - 1:0] result,
    input [`single_len - 1:0] x1,
    input [`single_len - 1:0] x2,
    input [`single_len - 1:0] x3,
    input [`single_len - 1:0] x4,
    input [`single_len - 1:0] y1,
    input [`single_len - 1:0] y2,
    input [`single_len - 1:0] y3,
    input [`single_len - 1:0] y4,
    input clk, rst
);

wire calculate_mode;
assign calculate_mode = (| x1[31:16] != 1'b1) ? `half_mode : `single_mode;


// // ===============================Sign unpacking===================================
wire x1_sign, x2_sign, x3_sign, x4_sign, y1_sign, y2_sign, y3_sign, y4_sign;
wire[7:0] x1_exp, x2_exp, x3_exp, x4_exp, y1_exp, y2_exp, y3_exp, y4_exp;
wire [12 : 0] x1_high, x1_low, x2_high, x2_low, x3_high, x3_low, x4_high, x4_low
, y1_high, y1_low, y2_high, y2_low, y3_high, y3_low, y4_high, y4_low ;


pipe_1 unpacking(x1_sign, x2_sign, x3_sign, x4_sign, y1_sign, y2_sign, y3_sign, y4_sign,
    x1_exp, x2_exp, x3_exp, x4_exp, y1_exp, y2_exp, y3_exp, y4_exp,
     x1_high, x1_low, x2_high, x2_low, x3_high, x3_low, x4_high, x4_low
    , y1_high, y1_low, y2_high, y2_low, y3_high, y3_low, y4_high, y4_low, x1, x2, x3, x4, y1, y2, y3, y4
    ,calculate_mode );

wire x1_sign_o, x2_sign_o, x3_sign_o, x4_sign_o, y1_sign_o, y2_sign_o, y3_sign_o, y4_sign_o;
wire[7:0] x1_exp_o, x2_exp_o, x3_exp_o, x4_exp_o, y1_exp_o, y2_exp_o, y3_exp_o, y4_exp_o;
wire [12 : 0] x1_high_o, x1_low_o, x2_high_o, x2_low_o, x3_high_o, x3_low_o, x4_high_o, x4_low_o
, y1_high_o, y1_low_o, y2_high_o, y2_low_o, y3_high_o, y3_low_o, y4_high_o, y4_low_o ;

// gclk
wire gclk;
assign gclk = clk & calculate_mode;


reg_1 R1(x1_sign_o, x2_sign_o, x3_sign_o, x4_sign_o, y1_sign_o, y2_sign_o, y3_sign_o, y4_sign_o,
    x1_exp_o, x2_exp_o, x3_exp_o, x4_exp_o, y1_exp_o, y2_exp_o, y3_exp_o, y4_exp_o,
    x1_high_o, x1_low_o, x2_high_o, x2_low_o, x3_high_o, x3_low_o, x4_high_o, x4_low_o
    , y1_high_o, y1_low_o, y2_high_o, y2_low_o, y3_high_o, y3_low_o, y4_high_o, y4_low_o,
    x1_sign, x2_sign, x3_sign, x4_sign, y1_sign, y2_sign, y3_sign, y4_sign,
    x1_exp, x2_exp, x3_exp, x4_exp, y1_exp, y2_exp, y3_exp, y4_exp,
     x1_high, x1_low, x2_high, x2_low, x3_high, x3_low, x4_high, x4_low
    , y1_high, y1_low, y2_high, y2_low, y3_high, y3_low, y4_high, y4_low, gclk, clk, rst);

// // ==================================Mantissa Multiplier=========================================
// Low Low, Low high, high low, high high
wire [51:0] mul_1_comb, mul_2_comb, mul_3_comb, mul_4_comb; 
wire [7:0] exp_1, exp_2, exp_3, exp_4;

pipe_2 multiplier(
    mul_1_comb, mul_2_comb, mul_3_comb, mul_4_comb,
    sign_1, sign_2, sign_3, sign_4,
    exp_1, exp_2, exp_3, exp_4,
    x1_sign_o, x2_sign_o, x3_sign_o, x4_sign_o, y1_sign_o, y2_sign_o, y3_sign_o, y4_sign_o,
    x1_exp_o, x2_exp_o, x3_exp_o, x4_exp_o, y1_exp_o, y2_exp_o, y3_exp_o, y4_exp_o,
    x1_high_o, x1_low_o, x2_high_o, x2_low_o, x3_high_o, x3_low_o, x4_high_o, x4_low_o
    , y1_high_o, y1_low_o, y2_high_o, y2_low_o, y3_high_o, y3_low_o, y4_high_o, y4_low_o, calculate_mode);

// Low Low, Low high, high low, high high
wire [51:0] mul_1_comb_o, mul_2_comb_o, mul_3_comb_o, mul_4_comb_o; 
wire [7:0] exp_1_o, exp_2_o, exp_3_o, exp_4_o;

reg_2 R2 (
    mul_1_comb_o, mul_2_comb_o, mul_3_comb_o, mul_4_comb_o,
    sign_1_o, sign_2_o, sign_3_o, sign_4_o,
    exp_1_o, exp_2_o, exp_3_o, exp_4_o,
    mul_1_comb, mul_2_comb, mul_3_comb, mul_4_comb,
    sign_1, sign_2, sign_3, sign_4,
    exp_1, exp_2, exp_3, exp_4,
    clk, rst
);


// // ==================================DP Adder L1=========================================

// // mul_1 and mul_2
// // mul_3 and mul_4


wire [7:0] adder_exp_1, adder_exp_2;

// // Level 1 adder, total level 2
wire signed [51:0] sum_mul_12, sum_mul_34;

pipe_3 DP_adder_L1(
    adder_exp_1, adder_exp_2,
    sum_mul_12, sum_mul_34,
    exp_1_o, exp_2_o, exp_3_o, exp_4_o,
    sign_1_o, sign_2_o, sign_3_o, sign_4_o,
    mul_1_comb_o, mul_2_comb_o, mul_3_comb_o, mul_4_comb_o
);

wire [7:0] adder_exp_1_o, adder_exp_2_o;
wire signed [51:0] sum_mul_12_o, sum_mul_34_o;

reg_3 R3 (adder_exp_1_o, adder_exp_2_o,
    sum_mul_12_o, sum_mul_34_o,
    adder_exp_1, adder_exp_2,
    sum_mul_12, sum_mul_34,
     clk, rst);

// // ==================================DP Adder L2=========================================

reg [7:0] adder_exp_final;
reg [51:0] sum_mul_all;
reg [51:0] sum_mul_all_pos;

pipe_4 DP_adder_L2 (
    sum_mul_all_pos,
    sum_mul_all,
    adder_exp_final,
    adder_exp_1_o, adder_exp_2_o,
    sum_mul_12_o, sum_mul_34_o
);

wire [7:0] adder_exp_final_o;
wire [51:0] sum_mul_all_o;
wire [51:0] sum_mul_all_pos_o;

reg_4 R4 ( adder_exp_final_o,
    sum_mul_all_o,
    sum_mul_all_pos_o,
    adder_exp_final,
    sum_mul_all,
    sum_mul_all_pos,
    clk, rst );

// Packing
// reg [31:0] result;
pipe_5 round_packing(
    result,
    calculate_mode,
    sum_mul_all_o,
    sum_mul_all_pos_o,
    adder_exp_final_o
);

endmodule
