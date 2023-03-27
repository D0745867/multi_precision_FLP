`timescale 1ns/1ns
module pipe_5 (
    output reg [31:0] result,
    input calculate_mode,
    input [51:0] sum_mul_all,
    input [51:0] sum_mul_all_pos,
    input [7:0] adder_exp_final
);
    
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
        if(sum_mul_all_pos[20] | sum_mul_all_pos[21] | sum_mul_all_pos[22]== 1'b1 | sum_mul_all_pos[23]== 1'b1) all_mantissa = sum_mul_all_pos >> (zero_cnt_bias - zero_cnt); 
        else all_mantissa  = sum_mul_all_pos << (zero_cnt - zero_cnt_bias) ;
    end
    else begin
        if(sum_mul_all_pos[46] | sum_mul_all_pos[47] | sum_mul_all_pos[48]== 1'b1 | sum_mul_all_pos[49]== 1'b1) all_mantissa = sum_mul_all_pos >> (zero_cnt_bias - zero_cnt); 
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