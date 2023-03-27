`timescale 1ns/1ns
`define single_len 32
`define half_len 16
`define single_man_len 26
`define half_man_len 13
`define total_data 1000
`define single_mode 1'b0
`define half_mode 1'b1
`define single_len 32
module dp_nonpipe (
    output reg [`single_len - 1:0] result,
    input [`single_len - 1:0] x1,
    input [`single_len - 1:0] x2,
    input [`single_len - 1:0] x3,
    input [`single_len - 1:0] x4,
    input [`single_len - 1:0] y1,
    input [`single_len - 1:0] y2,
    input [`single_len - 1:0] y3,
    input [`single_len - 1:0] y4
);

wire calculate_mode;
assign calculate_mode = (| x1[31:16] != 1'b1) ? `half_mode : `single_mode;


// ===============================Sign unpacking===================================
reg x1_sign, x2_sign, x3_sign, x4_sign, y1_sign, y2_sign, y3_sign, y4_sign;
always @(*) begin
    if(calculate_mode == `half_mode) begin
        x1_sign = x1[15];
        x2_sign = x2[15];
        x3_sign = x3[15];
        x4_sign = x4[15];
        y1_sign = y1[15];
        y2_sign = y2[15];
        y3_sign = y3[15];
        y4_sign = y4[15];
    end 
    else begin
        x1_sign = x1[31];
        x2_sign = x2[31];
        x3_sign = x3[31];
        x4_sign = x4[31];
        y1_sign = y1[31];
        y2_sign = y2[31];
        y3_sign = y3[31];
        y4_sign = y4[31];
    end
end
// =============================exp unpacking===============================
reg[7:0] x1_exp, x2_exp, x3_exp, x4_exp, y1_exp, y2_exp, y3_exp, y4_exp;
always @(*) begin
    if(calculate_mode == `half_mode) begin
        // 5
        x1_exp = x1[14:10];
        x2_exp = x2[14:10];
        x3_exp = x3[14:10];
        x4_exp = x4[14:10];
        y1_exp = y1[14:10];
        y2_exp = y2[14:10];
        y3_exp = y3[14:10];
        y4_exp = y4[14:10];
    end 
    else begin
        // 8
        x1_exp = x1[30:23];
        x2_exp = x2[30:23];
        x3_exp = x3[30:23];
        x4_exp = x4[30:23];
        y1_exp = y1[30:23];
        y2_exp = y2[30:23];
        y3_exp = y3[30:23];
        y4_exp = y4[30:23];
    end
end

// ==================================Mantissa separation=========================================
// Sepatate to two 13 bit section
reg [12 : 0] x1_high, x1_low, x2_high, x2_low, x3_high, x3_low, x4_high, x4_low
, y1_high, y1_low, y2_high, y2_low, y3_high, y3_low, y4_high, y4_low ;

always @(*) begin
    if(calculate_mode == `half_mode) begin
        // 13
        x1_high = 13'b0;
        x2_high = 13'b0;
        x3_high = 13'b0;
        x4_high = 13'b0;
        y1_high = 13'b0;
        y2_high = 13'b0;
        y3_high = 13'b0;
        y4_high = 13'b0;

        // 3 + 10
        x1_low = {3'b001, x1[9:0]};
        x2_low = {3'b001, x2[9:0]};
        x3_low = {3'b001, x3[9:0]};
        x4_low = {3'b001, x4[9:0]};
        y1_low = {3'b001, y1[9:0]};
        y2_low = {3'b001, y2[9:0]};
        y3_low = {3'b001, y3[9:0]};
        y4_low = {3'b001, y4[9:0]};
        
    end
    else begin
        // 3 + 10
        x1_high = {3'b001, x1[22:13]};
        x2_high = {3'b001, x2[22:13]};
        x3_high = {3'b001, x3[22:13]};
        x4_high = {3'b001, x4[22:13]};
        y1_high = {3'b001, y1[22:13]};
        y2_high = {3'b001, y2[22:13]};
        y3_high = {3'b001, y3[22:13]};
        y4_high = {3'b001, y4[22:13]};

        // 13
        x1_low = x1[12:0];
        x2_low = x2[12:0];
        x3_low = x3[12:0];
        x4_low = x4[12:0];
        y1_low = y1[12:0];
        y2_low = y2[12:0];
        y3_low = y3[12:0];
        y4_low = y4[12:0];
        
    end
end

// ==================================Mantissa Multiplier=========================================
// Low Low, Low high, high low, high high
reg [25:0] mul_1_ll, mul_1_lh, mul_1_hl, mul_1_hh;
reg [25:0] mul_2_ll, mul_2_lh, mul_2_hl, mul_2_hh;
reg [25:0] mul_3_ll, mul_3_lh, mul_3_hl, mul_3_hh;
reg [25:0] mul_4_ll, mul_4_lh, mul_4_hl, mul_4_hh;
reg [51:0] mul_1_comb, mul_2_comb, mul_3_comb, mul_4_comb; 

// Sign 
reg sign_1, sign_2, sign_3, sign_4;
always @(*) begin
    sign_1 = x1_sign ^ y1_sign;
    sign_2 = x2_sign ^ y2_sign;
    sign_3 = x3_sign ^ y3_sign;
    sign_4 = x4_sign ^ y4_sign;
end

// Exp
reg [7:0] exp_1, exp_2, exp_3, exp_4;
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


// Multiplier
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

// ==================================DP Adder L1=========================================

// mul_1 and mul_2
// mul_3 and mul_4

// Alignment
reg [7:0] shift_num_1, shift_num_2;
reg [7:0] adder_exp_1, adder_exp_2;

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
reg signed [51:0] sum_mul_12, sum_mul_34;

always @(*) begin
    sum_mul_12 = mul_1_comb_twos + mul_2_comb_twos;
    sum_mul_34 = mul_3_comb_twos + mul_4_comb_twos;
end

// ==================================DP Adder L2=========================================

// Alignment
reg [7:0] shift_num_final;

// Find shift number to alignment
always @(*) begin
    shift_num_final = (adder_exp_1 > adder_exp_2) ? adder_exp_1 - adder_exp_2 
    : (adder_exp_1 != adder_exp_2)? adder_exp_2 - adder_exp_1 : 0;
end 

// Select bigger exp to be EXP after adding two multiple number
reg [7:0] adder_exp_final;
always @(*) begin
    adder_exp_final = (adder_exp_1 > adder_exp_2) ? adder_exp_1 : (adder_exp_1 != adder_exp_2) ? adder_exp_2 : adder_exp_1;
end 

// Shift mantissa
reg [51:0] sum_mul_12_shift, sum_mul_34_shift;
// mul_1, mul_2
always @(*) begin
    if (adder_exp_1 > adder_exp_2) begin
        sum_mul_12_shift = sum_mul_12;
        sum_mul_34_shift = sum_mul_34 >>> shift_num_final ;
    end
    else if (adder_exp_2 > adder_exp_1) begin 
        sum_mul_12_shift = sum_mul_12 >>> shift_num_final;
        sum_mul_34_shift = sum_mul_34;
    end
    else begin
        sum_mul_12_shift = sum_mul_12;
        sum_mul_34_shift = sum_mul_34;
    end
end

reg [51:0] sum_mul_all;
always @(*) begin
    sum_mul_all = sum_mul_12_shift + sum_mul_34_shift;
end

// 2's complement if sum_mul_all is negative

reg [51:0] sum_mul_all_pos;
always @(*) begin
    if(sum_mul_all[51] == 1'b1) sum_mul_all_pos = ~sum_mul_all + 1'b1;
    else sum_mul_all_pos = sum_mul_all;
end

// ! Notice: 
// Next_step :Find first zero
// LOD -> Normalization
reg [7:0] all_exp_final;
reg [6:0] zero_cnt;
reg con;
integer i;
reg [6:0] zero_cnt_bias;
reg [51:0] all_mantissa;

always @(*) begin
    if(calculate_mode == `half_mode) zero_cnt_bias = 6'd32;
    else zero_cnt_bias = 6'd6;
end

always @(*) begin
    con = 1'b1;
    for(i=51; con && (i>=0); i = i - 1) begin
        zero_cnt = sum_mul_all_pos[i]? 6'd51 - i + 1 : 6'd0;
        con = sum_mul_all_pos[i]? 1'b0: 1'b1;
    end
    all_exp_final =  adder_exp_final - (zero_cnt - zero_cnt_bias);
    if(calculate_mode == `half_mode) begin
        if(sum_mul_all_pos[20] | sum_mul_all_pos[21] | sum_mul_all_pos[22]== 1'b1 | sum_mul_all_pos[23] == 1'b1) all_mantissa = sum_mul_all_pos >> (zero_cnt_bias - zero_cnt); 
        else all_mantissa  = sum_mul_all_pos << (zero_cnt - zero_cnt_bias) ;
    end
    else begin
        if(sum_mul_all_pos[46] | sum_mul_all_pos[47] | sum_mul_all_pos[48]== 1'b1 | sum_mul_all_pos[49] == 1'b1) all_mantissa = sum_mul_all_pos >> (zero_cnt_bias - zero_cnt); 
        else all_mantissa  = sum_mul_all_pos << (zero_cnt - zero_cnt_bias) ;
    end
end
// Rounding
reg G, R, S;
reg [22:0] all_mantissa_final;
always @(*) begin
    G = (calculate_mode == `half_mode) ? all_mantissa[19] : all_mantissa[45];
    R = (calculate_mode == `half_mode) ? all_mantissa[18] : all_mantissa[44];
    S = (calculate_mode == `half_mode) ? | all_mantissa[17:10] :| all_mantissa[43:36];
end

always @(*) begin
    if(calculate_mode == `half_mode) begin 
        all_mantissa_final = (G & (R | S | all_mantissa[20])) ? all_mantissa[19:10] : all_mantissa[19:10] + 1'b1;
    end
    else begin
        all_mantissa_final = (G & (R | S | all_mantissa[46])) ? all_mantissa[45:23] : all_mantissa[45:23] + 1'b1;
    end
end

// Packing
// reg [31:0] result;

always @(*) begin
    result = (calculate_mode == `half_mode) 
    ? {16'b0, sum_mul_all[51], all_exp_final[4:0], all_mantissa_final[9:0]} 
    : {sum_mul_all[51], all_exp_final, all_mantissa_final};
end

endmodule
