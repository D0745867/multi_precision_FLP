`timescale 1ns/1ns

module pipe_3 (
    output reg [7:0] adder_exp_1, adder_exp_2,
    output reg signed [51:0] sum_mul_12, sum_mul_34,
    input [7:0] exp_1, exp_2, exp_3, exp_4,
    input sign_1, sign_2, sign_3, sign_4,
    input [51:0]mul_1_comb, mul_2_comb, mul_3_comb, mul_4_comb
);

// ==================================DP Adder L1=========================================

// mul_1 and mul_2
// mul_3 and mul_4

// Alignment
reg [7:0] shift_num_1, shift_num_2;
// Find shift number to alignment
always @(*) begin
    // mul_1, mul_2
    shift_num_1 = (exp_1 > exp_2) ? exp_1 - exp_2 : (exp_1 != exp_2)? exp_2 - exp_1 : 0;
    // mul_3, mul_4
    shift_num_2 = (exp_3 > exp_4) ? exp_3 - exp_4 : (exp_3 != exp_4)? exp_4 - exp_3 : 0;
end 

// Select bigger exp to be EXP after adding two multiple number
always @(*) begin
    // mul_1, mul_2
    adder_exp_1 = (exp_1 > exp_2) ? exp_1 : (exp_1 != exp_2) ? exp_2 : exp_1;
    // mul_3, mul_4
    adder_exp_2 = (exp_3 > exp_4) ? exp_3 : (exp_3 != exp_4) ? exp_4 : exp_3;
end 

// Shift mantissa
reg [51:0] mul_1_comb_shift, mul_2_comb_shift, mul_3_comb_shift, mul_4_comb_shift;
// mul_1, mul_2
always @(*) begin
    if (exp_1 > exp_2) begin
        mul_1_comb_shift = mul_1_comb;
        mul_2_comb_shift = mul_2_comb >> shift_num_1 ;
    end
    else if (exp_2 > exp_1) begin 
        mul_1_comb_shift = mul_1_comb >> shift_num_1;
        mul_2_comb_shift = mul_2_comb;
    end
    else begin 
        mul_1_comb_shift = mul_1_comb;
        mul_2_comb_shift = mul_2_comb;
    end
end

// mul3, mul4
always @(*) begin
    if (exp_3 > exp_4) begin
        mul_3_comb_shift = mul_3_comb;
        mul_4_comb_shift = mul_4_comb >> shift_num_2 ;
    end
    else if (exp_4 > exp_3) begin 
        mul_3_comb_shift = mul_3_comb >> shift_num_2;
        mul_4_comb_shift = mul_4_comb;
    end
    else begin 
        mul_3_comb_shift = mul_3_comb;
        mul_4_comb_shift = mul_4_comb;
    end
end

// Select complement - use signed reg due to alignment of two result
reg [51:0]  mul_1_comb_twos, mul_2_comb_twos, mul_3_comb_twos, mul_4_comb_twos;

always @(*) begin 
    if (sign_1 == 1'b1) mul_1_comb_twos = ~mul_1_comb_shift + 1'b1;
    else mul_1_comb_twos = mul_1_comb_shift;

    if (sign_2 == 1'b1) mul_2_comb_twos = ~mul_2_comb_shift + 1'b1;
    else mul_2_comb_twos = mul_2_comb_shift;

    if (sign_3 == 1'b1) mul_3_comb_twos = ~mul_3_comb_shift + 1'b1;
    else mul_3_comb_twos = mul_3_comb_shift;

    if (sign_4 == 1'b1) mul_4_comb_twos = ~mul_4_comb_shift + 1'b1;
    else mul_4_comb_twos = mul_4_comb_shift;
end


// Level 1 adder, total level 2
// reg signed [51:0] sum_mul_12, sum_mul_34;

always @(*) begin
    sum_mul_12 = mul_1_comb_twos + mul_2_comb_twos;
    sum_mul_34 = mul_3_comb_twos + mul_4_comb_twos;
end

endmodule