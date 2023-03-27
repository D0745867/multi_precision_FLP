`timescale 1ns/1ns

module pipe_1 (
    output reg x1_sign, x2_sign, x3_sign, x4_sign, y1_sign, y2_sign, y3_sign, y4_sign,
    output reg[7:0] x1_exp, x2_exp, x3_exp, x4_exp, y1_exp, y2_exp, y3_exp, y4_exp,
    output reg [12 : 0] x1_high, x1_low, x2_high, x2_low, x3_high, x3_low, x4_high, x4_low
    , y1_high, y1_low, y2_high, y2_low, y3_high, y3_low, y4_high, y4_low,
    input [31:0] x1, x2, x3, x4, y1, y2, y3, y4,
    input calculate_mode
);

// ===============================Sign unpacking===================================
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
    
endmodule