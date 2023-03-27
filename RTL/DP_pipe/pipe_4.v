`timescale 1ns/1ns

module pipe_4 (
    output reg [51:0] sum_mul_all_pos,
    output reg [51:0] sum_mul_all,
    output reg [7:0] adder_exp_final,
    input [7:0] adder_exp_1, adder_exp_2,
    input signed [51:0] sum_mul_12, sum_mul_34
);

// ==================================DP Adder L2=========================================
// Alignment
reg [7:0] shift_num_final;

// Find shift number to alignment
always @(*) begin
    shift_num_final = (adder_exp_1 > adder_exp_2) ? adder_exp_1 - adder_exp_2 
    : (adder_exp_1 != adder_exp_2)? adder_exp_2 - adder_exp_1 : 0;
end 

// Select bigger exp to be EXP after adding two multiple number
// reg [7:0] adder_exp_final;
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

// reg [51:0] sum_mul_all;
always @(*) begin
    sum_mul_all = sum_mul_12_shift + sum_mul_34_shift;
end

// 2's complement if sum_mul_all is negative

always @(*) begin
    if(sum_mul_all[51] == 1'b1) sum_mul_all_pos = ~sum_mul_all + 1'b1;
    else sum_mul_all_pos = sum_mul_all;
end
    
endmodule