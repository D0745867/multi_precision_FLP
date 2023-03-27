`timescale 1ns/1ns
`define total_data 1000
`define single_mode 1'b0
`define half_mode 1'b1
`define single_len 32
module tb_dp();

// Calulate mode
reg calculate_mode;

// X_matrix
reg [31:0] x1;
reg [31:0] x2;
reg [31:0] x3;
reg [31:0] x4;

// Y_matrix
reg [31:0] y1;
reg [31:0] y2;
reg [31:0] y3;
reg [31:0] y4;

reg clk;
reg rst;
integer clk_period = 10;
wire [31:0] d;
reg [31:0] half_answer;
reg [31:0] single_answer;

reg [31:0] dataX1_in [`total_data - 1:0];
reg [31:0] dataX2_in [`total_data - 1:0];
reg [31:0] dataX3_in [`total_data - 1:0];
reg [31:0] dataX4_in [`total_data - 1:0];
reg [31:0] dataY1_in [`total_data - 1:0];
reg [31:0] dataY2_in [`total_data - 1:0];
reg [31:0] dataY3_in [`total_data - 1:0];
reg [31:0] dataY4_in [`total_data - 1:0];
reg [31:0] single_ans [`total_data - 1:0];
reg [15:0] half_ans [`total_data - 1:0];
reg [31:0] data_out [`total_data - 1:0]; 
wire [31 :0] result;


integer fp_ra, fp_rb, fp_rd, fp_w;
integer i,j;
integer zzz;
integer cnt = 0;
integer mi;
dp_nonpipe uut(.result(result), .x1(x1), .x2(x2), .x3(x3), .x4(x4), .y1(y1), .y2(y2), .y3(y3), .y4(y4));
// FMA uut(.a(a), .b(b), .c(c), .d(d));

initial begin
	$fsdbDumpfile("DP_nonpipe.fsdb");
	$fsdbDumpvars;
end

always #(clk_period/2) clk = ~clk;

initial begin
    clk = 0;
    // Calculate mode setting.
    // calculate_mode = `single_mode;
    // calculate_mode = `half_mode;
end

initial begin
    // fp_ra = $fopen("../test_data/FP16.txt", "r");
    fp_ra = $fopen("../test_data/FP32.txt", "r");
    fp_rb = $fopen("../test_data/FP16_answer.txt", "r");
    fp_rd = $fopen("../test_data/FP32_answer.txt", "r");
    fp_w = $fopen("out.txt","w");
    for( i = 0; i < 1000 ; i = i + 1) begin
        zzz = $fscanf(fp_ra, "%x %x %x %x %x %x %x %x\n", dataX1_in[i], dataX2_in[i], dataX3_in[i], dataX4_in[i]
        , dataY1_in[i], dataY2_in[i], dataY3_in[i], dataY4_in[i]);
        zzz = $fscanf(fp_rb, "%b\n", half_ans[i]);
        zzz = $fscanf(fp_rd, "%x\n", single_ans[i]);
    end
    $fclose(fp_ra);
    $fclose(fp_rb);
    $fclose(fp_rd);

    for( i = 0 ; i < 1000; i = i + 1) begin
        #5;
        x1 <= dataX1_in[i];
        x2 <= dataX2_in[i];
        x3 <= dataX3_in[i];
        x4 <= dataX4_in[i];

        y1 <= dataY1_in[i];
        y2 <= dataY2_in[i];
        y3 <= dataY3_in[i];
        y4 <= dataY4_in[i];

        half_answer <= half_ans[i];
        single_answer <= single_ans[i];

        #2;
        data_out[i] <= d;
        #3;
    end
    #10
    for(i = 0; i< 1000; i = i + 1) 
        $fwrite(fp_w, "%x\n", data_out[i]);
    $fclose(fp_w);
    $finish;
end

endmodule