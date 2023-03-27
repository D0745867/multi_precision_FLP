###################################################################

# Created by write_sdc on Wed Nov 30 16:44:30 2022

###################################################################
set sdc_version 2.1

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_operating_conditions -max ss_typical_max_0p81v_125c -max_library           \
sc9_cln40g_base_rvt_ss_typical_max_0p81v_125c\
                         -min ff_typical_min_0p99v_m40c -min_library           \
sc9_cln40g_base_rvt_ff_typical_min_0p99v_m40c
set_wire_load_mode top
set_wire_load_model -name Zero -library                                        \
sc9_cln40g_base_rvt_ss_typical_max_0p81v_125c
create_clock -name clk  -period 14  -waveform {0 7}
set_max_delay 14  -from [list [get_ports {x1[31]}] [get_ports {x1[30]}] [get_ports {x1[29]}]    \
[get_ports {x1[28]}] [get_ports {x1[27]}] [get_ports {x1[26]}] [get_ports      \
{x1[25]}] [get_ports {x1[24]}] [get_ports {x1[23]}] [get_ports {x1[22]}]       \
[get_ports {x1[21]}] [get_ports {x1[20]}] [get_ports {x1[19]}] [get_ports      \
{x1[18]}] [get_ports {x1[17]}] [get_ports {x1[16]}] [get_ports {x1[15]}]       \
[get_ports {x1[14]}] [get_ports {x1[13]}] [get_ports {x1[12]}] [get_ports      \
{x1[11]}] [get_ports {x1[10]}] [get_ports {x1[9]}] [get_ports {x1[8]}]         \
[get_ports {x1[7]}] [get_ports {x1[6]}] [get_ports {x1[5]}] [get_ports         \
{x1[4]}] [get_ports {x1[3]}] [get_ports {x1[2]}] [get_ports {x1[1]}]           \
[get_ports {x1[0]}] [get_ports {x2[31]}] [get_ports {x2[30]}] [get_ports       \
{x2[29]}] [get_ports {x2[28]}] [get_ports {x2[27]}] [get_ports {x2[26]}]       \
[get_ports {x2[25]}] [get_ports {x2[24]}] [get_ports {x2[23]}] [get_ports      \
{x2[22]}] [get_ports {x2[21]}] [get_ports {x2[20]}] [get_ports {x2[19]}]       \
[get_ports {x2[18]}] [get_ports {x2[17]}] [get_ports {x2[16]}] [get_ports      \
{x2[15]}] [get_ports {x2[14]}] [get_ports {x2[13]}] [get_ports {x2[12]}]       \
[get_ports {x2[11]}] [get_ports {x2[10]}] [get_ports {x2[9]}] [get_ports       \
{x2[8]}] [get_ports {x2[7]}] [get_ports {x2[6]}] [get_ports {x2[5]}]           \
[get_ports {x2[4]}] [get_ports {x2[3]}] [get_ports {x2[2]}] [get_ports         \
{x2[1]}] [get_ports {x2[0]}] [get_ports {x3[31]}] [get_ports {x3[30]}]         \
[get_ports {x3[29]}] [get_ports {x3[28]}] [get_ports {x3[27]}] [get_ports      \
{x3[26]}] [get_ports {x3[25]}] [get_ports {x3[24]}] [get_ports {x3[23]}]       \
[get_ports {x3[22]}] [get_ports {x3[21]}] [get_ports {x3[20]}] [get_ports      \
{x3[19]}] [get_ports {x3[18]}] [get_ports {x3[17]}] [get_ports {x3[16]}]       \
[get_ports {x3[15]}] [get_ports {x3[14]}] [get_ports {x3[13]}] [get_ports      \
{x3[12]}] [get_ports {x3[11]}] [get_ports {x3[10]}] [get_ports {x3[9]}]        \
[get_ports {x3[8]}] [get_ports {x3[7]}] [get_ports {x3[6]}] [get_ports         \
{x3[5]}] [get_ports {x3[4]}] [get_ports {x3[3]}] [get_ports {x3[2]}]           \
[get_ports {x3[1]}] [get_ports {x3[0]}] [get_ports {x4[31]}] [get_ports        \
{x4[30]}] [get_ports {x4[29]}] [get_ports {x4[28]}] [get_ports {x4[27]}]       \
[get_ports {x4[26]}] [get_ports {x4[25]}] [get_ports {x4[24]}] [get_ports      \
{x4[23]}] [get_ports {x4[22]}] [get_ports {x4[21]}] [get_ports {x4[20]}]       \
[get_ports {x4[19]}] [get_ports {x4[18]}] [get_ports {x4[17]}] [get_ports      \
{x4[16]}] [get_ports {x4[15]}] [get_ports {x4[14]}] [get_ports {x4[13]}]       \
[get_ports {x4[12]}] [get_ports {x4[11]}] [get_ports {x4[10]}] [get_ports      \
{x4[9]}] [get_ports {x4[8]}] [get_ports {x4[7]}] [get_ports {x4[6]}]           \
[get_ports {x4[5]}] [get_ports {x4[4]}] [get_ports {x4[3]}] [get_ports         \
{x4[2]}] [get_ports {x4[1]}] [get_ports {x4[0]}] [get_ports {y1[31]}]          \
[get_ports {y1[30]}] [get_ports {y1[29]}] [get_ports {y1[28]}] [get_ports      \
{y1[27]}] [get_ports {y1[26]}] [get_ports {y1[25]}] [get_ports {y1[24]}]       \
[get_ports {y1[23]}] [get_ports {y1[22]}] [get_ports {y1[21]}] [get_ports      \
{y1[20]}] [get_ports {y1[19]}] [get_ports {y1[18]}] [get_ports {y1[17]}]       \
[get_ports {y1[16]}] [get_ports {y1[15]}] [get_ports {y1[14]}] [get_ports      \
{y1[13]}] [get_ports {y1[12]}] [get_ports {y1[11]}] [get_ports {y1[10]}]       \
[get_ports {y1[9]}] [get_ports {y1[8]}] [get_ports {y1[7]}] [get_ports         \
{y1[6]}] [get_ports {y1[5]}] [get_ports {y1[4]}] [get_ports {y1[3]}]           \
[get_ports {y1[2]}] [get_ports {y1[1]}] [get_ports {y1[0]}] [get_ports         \
{y2[31]}] [get_ports {y2[30]}] [get_ports {y2[29]}] [get_ports {y2[28]}]       \
[get_ports {y2[27]}] [get_ports {y2[26]}] [get_ports {y2[25]}] [get_ports      \
{y2[24]}] [get_ports {y2[23]}] [get_ports {y2[22]}] [get_ports {y2[21]}]       \
[get_ports {y2[20]}] [get_ports {y2[19]}] [get_ports {y2[18]}] [get_ports      \
{y2[17]}] [get_ports {y2[16]}] [get_ports {y2[15]}] [get_ports {y2[14]}]       \
[get_ports {y2[13]}] [get_ports {y2[12]}] [get_ports {y2[11]}] [get_ports      \
{y2[10]}] [get_ports {y2[9]}] [get_ports {y2[8]}] [get_ports {y2[7]}]          \
[get_ports {y2[6]}] [get_ports {y2[5]}] [get_ports {y2[4]}] [get_ports         \
{y2[3]}] [get_ports {y2[2]}] [get_ports {y2[1]}] [get_ports {y2[0]}]           \
[get_ports {y3[31]}] [get_ports {y3[30]}] [get_ports {y3[29]}] [get_ports      \
{y3[28]}] [get_ports {y3[27]}] [get_ports {y3[26]}] [get_ports {y3[25]}]       \
[get_ports {y3[24]}] [get_ports {y3[23]}] [get_ports {y3[22]}] [get_ports      \
{y3[21]}] [get_ports {y3[20]}] [get_ports {y3[19]}] [get_ports {y3[18]}]       \
[get_ports {y3[17]}] [get_ports {y3[16]}] [get_ports {y3[15]}] [get_ports      \
{y3[14]}] [get_ports {y3[13]}] [get_ports {y3[12]}] [get_ports {y3[11]}]       \
[get_ports {y3[10]}] [get_ports {y3[9]}] [get_ports {y3[8]}] [get_ports        \
{y3[7]}] [get_ports {y3[6]}] [get_ports {y3[5]}] [get_ports {y3[4]}]           \
[get_ports {y3[3]}] [get_ports {y3[2]}] [get_ports {y3[1]}] [get_ports         \
{y3[0]}] [get_ports {y4[31]}] [get_ports {y4[30]}] [get_ports {y4[29]}]        \
[get_ports {y4[28]}] [get_ports {y4[27]}] [get_ports {y4[26]}] [get_ports      \
{y4[25]}] [get_ports {y4[24]}] [get_ports {y4[23]}] [get_ports {y4[22]}]       \
[get_ports {y4[21]}] [get_ports {y4[20]}] [get_ports {y4[19]}] [get_ports      \
{y4[18]}] [get_ports {y4[17]}] [get_ports {y4[16]}] [get_ports {y4[15]}]       \
[get_ports {y4[14]}] [get_ports {y4[13]}] [get_ports {y4[12]}] [get_ports      \
{y4[11]}] [get_ports {y4[10]}] [get_ports {y4[9]}] [get_ports {y4[8]}]         \
[get_ports {y4[7]}] [get_ports {y4[6]}] [get_ports {y4[5]}] [get_ports         \
{y4[4]}] [get_ports {y4[3]}] [get_ports {y4[2]}] [get_ports {y4[1]}]           \
[get_ports {y4[0]}]]  -to [list [get_ports {result[31]}] [get_ports {result[30]}] [get_ports        \
{result[29]}] [get_ports {result[28]}] [get_ports {result[27]}] [get_ports     \
{result[26]}] [get_ports {result[25]}] [get_ports {result[24]}] [get_ports     \
{result[23]}] [get_ports {result[22]}] [get_ports {result[21]}] [get_ports     \
{result[20]}] [get_ports {result[19]}] [get_ports {result[18]}] [get_ports     \
{result[17]}] [get_ports {result[16]}] [get_ports {result[15]}] [get_ports     \
{result[14]}] [get_ports {result[13]}] [get_ports {result[12]}] [get_ports     \
{result[11]}] [get_ports {result[10]}] [get_ports {result[9]}] [get_ports      \
{result[8]}] [get_ports {result[7]}] [get_ports {result[6]}] [get_ports        \
{result[5]}] [get_ports {result[4]}] [get_ports {result[3]}] [get_ports        \
{result[2]}] [get_ports {result[1]}] [get_ports {result[0]}]]
set_input_delay -clock clk  0  [get_ports {x1[31]}]
set_input_delay -clock clk  0  [get_ports {x1[30]}]
set_input_delay -clock clk  0  [get_ports {x1[29]}]
set_input_delay -clock clk  0  [get_ports {x1[28]}]
set_input_delay -clock clk  0  [get_ports {x1[27]}]
set_input_delay -clock clk  0  [get_ports {x1[26]}]
set_input_delay -clock clk  0  [get_ports {x1[25]}]
set_input_delay -clock clk  0  [get_ports {x1[24]}]
set_input_delay -clock clk  0  [get_ports {x1[23]}]
set_input_delay -clock clk  0  [get_ports {x1[22]}]
set_input_delay -clock clk  0  [get_ports {x1[21]}]
set_input_delay -clock clk  0  [get_ports {x1[20]}]
set_input_delay -clock clk  0  [get_ports {x1[19]}]
set_input_delay -clock clk  0  [get_ports {x1[18]}]
set_input_delay -clock clk  0  [get_ports {x1[17]}]
set_input_delay -clock clk  0  [get_ports {x1[16]}]
set_input_delay -clock clk  0  [get_ports {x1[15]}]
set_input_delay -clock clk  0  [get_ports {x1[14]}]
set_input_delay -clock clk  0  [get_ports {x1[13]}]
set_input_delay -clock clk  0  [get_ports {x1[12]}]
set_input_delay -clock clk  0  [get_ports {x1[11]}]
set_input_delay -clock clk  0  [get_ports {x1[10]}]
set_input_delay -clock clk  0  [get_ports {x1[9]}]
set_input_delay -clock clk  0  [get_ports {x1[8]}]
set_input_delay -clock clk  0  [get_ports {x1[7]}]
set_input_delay -clock clk  0  [get_ports {x1[6]}]
set_input_delay -clock clk  0  [get_ports {x1[5]}]
set_input_delay -clock clk  0  [get_ports {x1[4]}]
set_input_delay -clock clk  0  [get_ports {x1[3]}]
set_input_delay -clock clk  0  [get_ports {x1[2]}]
set_input_delay -clock clk  0  [get_ports {x1[1]}]
set_input_delay -clock clk  0  [get_ports {x1[0]}]
set_input_delay -clock clk  0  [get_ports {x2[31]}]
set_input_delay -clock clk  0  [get_ports {x2[30]}]
set_input_delay -clock clk  0  [get_ports {x2[29]}]
set_input_delay -clock clk  0  [get_ports {x2[28]}]
set_input_delay -clock clk  0  [get_ports {x2[27]}]
set_input_delay -clock clk  0  [get_ports {x2[26]}]
set_input_delay -clock clk  0  [get_ports {x2[25]}]
set_input_delay -clock clk  0  [get_ports {x2[24]}]
set_input_delay -clock clk  0  [get_ports {x2[23]}]
set_input_delay -clock clk  0  [get_ports {x2[22]}]
set_input_delay -clock clk  0  [get_ports {x2[21]}]
set_input_delay -clock clk  0  [get_ports {x2[20]}]
set_input_delay -clock clk  0  [get_ports {x2[19]}]
set_input_delay -clock clk  0  [get_ports {x2[18]}]
set_input_delay -clock clk  0  [get_ports {x2[17]}]
set_input_delay -clock clk  0  [get_ports {x2[16]}]
set_input_delay -clock clk  0  [get_ports {x2[15]}]
set_input_delay -clock clk  0  [get_ports {x2[14]}]
set_input_delay -clock clk  0  [get_ports {x2[13]}]
set_input_delay -clock clk  0  [get_ports {x2[12]}]
set_input_delay -clock clk  0  [get_ports {x2[11]}]
set_input_delay -clock clk  0  [get_ports {x2[10]}]
set_input_delay -clock clk  0  [get_ports {x2[9]}]
set_input_delay -clock clk  0  [get_ports {x2[8]}]
set_input_delay -clock clk  0  [get_ports {x2[7]}]
set_input_delay -clock clk  0  [get_ports {x2[6]}]
set_input_delay -clock clk  0  [get_ports {x2[5]}]
set_input_delay -clock clk  0  [get_ports {x2[4]}]
set_input_delay -clock clk  0  [get_ports {x2[3]}]
set_input_delay -clock clk  0  [get_ports {x2[2]}]
set_input_delay -clock clk  0  [get_ports {x2[1]}]
set_input_delay -clock clk  0  [get_ports {x2[0]}]
set_input_delay -clock clk  0  [get_ports {x3[31]}]
set_input_delay -clock clk  0  [get_ports {x3[30]}]
set_input_delay -clock clk  0  [get_ports {x3[29]}]
set_input_delay -clock clk  0  [get_ports {x3[28]}]
set_input_delay -clock clk  0  [get_ports {x3[27]}]
set_input_delay -clock clk  0  [get_ports {x3[26]}]
set_input_delay -clock clk  0  [get_ports {x3[25]}]
set_input_delay -clock clk  0  [get_ports {x3[24]}]
set_input_delay -clock clk  0  [get_ports {x3[23]}]
set_input_delay -clock clk  0  [get_ports {x3[22]}]
set_input_delay -clock clk  0  [get_ports {x3[21]}]
set_input_delay -clock clk  0  [get_ports {x3[20]}]
set_input_delay -clock clk  0  [get_ports {x3[19]}]
set_input_delay -clock clk  0  [get_ports {x3[18]}]
set_input_delay -clock clk  0  [get_ports {x3[17]}]
set_input_delay -clock clk  0  [get_ports {x3[16]}]
set_input_delay -clock clk  0  [get_ports {x3[15]}]
set_input_delay -clock clk  0  [get_ports {x3[14]}]
set_input_delay -clock clk  0  [get_ports {x3[13]}]
set_input_delay -clock clk  0  [get_ports {x3[12]}]
set_input_delay -clock clk  0  [get_ports {x3[11]}]
set_input_delay -clock clk  0  [get_ports {x3[10]}]
set_input_delay -clock clk  0  [get_ports {x3[9]}]
set_input_delay -clock clk  0  [get_ports {x3[8]}]
set_input_delay -clock clk  0  [get_ports {x3[7]}]
set_input_delay -clock clk  0  [get_ports {x3[6]}]
set_input_delay -clock clk  0  [get_ports {x3[5]}]
set_input_delay -clock clk  0  [get_ports {x3[4]}]
set_input_delay -clock clk  0  [get_ports {x3[3]}]
set_input_delay -clock clk  0  [get_ports {x3[2]}]
set_input_delay -clock clk  0  [get_ports {x3[1]}]
set_input_delay -clock clk  0  [get_ports {x3[0]}]
set_input_delay -clock clk  0  [get_ports {x4[31]}]
set_input_delay -clock clk  0  [get_ports {x4[30]}]
set_input_delay -clock clk  0  [get_ports {x4[29]}]
set_input_delay -clock clk  0  [get_ports {x4[28]}]
set_input_delay -clock clk  0  [get_ports {x4[27]}]
set_input_delay -clock clk  0  [get_ports {x4[26]}]
set_input_delay -clock clk  0  [get_ports {x4[25]}]
set_input_delay -clock clk  0  [get_ports {x4[24]}]
set_input_delay -clock clk  0  [get_ports {x4[23]}]
set_input_delay -clock clk  0  [get_ports {x4[22]}]
set_input_delay -clock clk  0  [get_ports {x4[21]}]
set_input_delay -clock clk  0  [get_ports {x4[20]}]
set_input_delay -clock clk  0  [get_ports {x4[19]}]
set_input_delay -clock clk  0  [get_ports {x4[18]}]
set_input_delay -clock clk  0  [get_ports {x4[17]}]
set_input_delay -clock clk  0  [get_ports {x4[16]}]
set_input_delay -clock clk  0  [get_ports {x4[15]}]
set_input_delay -clock clk  0  [get_ports {x4[14]}]
set_input_delay -clock clk  0  [get_ports {x4[13]}]
set_input_delay -clock clk  0  [get_ports {x4[12]}]
set_input_delay -clock clk  0  [get_ports {x4[11]}]
set_input_delay -clock clk  0  [get_ports {x4[10]}]
set_input_delay -clock clk  0  [get_ports {x4[9]}]
set_input_delay -clock clk  0  [get_ports {x4[8]}]
set_input_delay -clock clk  0  [get_ports {x4[7]}]
set_input_delay -clock clk  0  [get_ports {x4[6]}]
set_input_delay -clock clk  0  [get_ports {x4[5]}]
set_input_delay -clock clk  0  [get_ports {x4[4]}]
set_input_delay -clock clk  0  [get_ports {x4[3]}]
set_input_delay -clock clk  0  [get_ports {x4[2]}]
set_input_delay -clock clk  0  [get_ports {x4[1]}]
set_input_delay -clock clk  0  [get_ports {x4[0]}]
set_input_delay -clock clk  0  [get_ports {y1[31]}]
set_input_delay -clock clk  0  [get_ports {y1[30]}]
set_input_delay -clock clk  0  [get_ports {y1[29]}]
set_input_delay -clock clk  0  [get_ports {y1[28]}]
set_input_delay -clock clk  0  [get_ports {y1[27]}]
set_input_delay -clock clk  0  [get_ports {y1[26]}]
set_input_delay -clock clk  0  [get_ports {y1[25]}]
set_input_delay -clock clk  0  [get_ports {y1[24]}]
set_input_delay -clock clk  0  [get_ports {y1[23]}]
set_input_delay -clock clk  0  [get_ports {y1[22]}]
set_input_delay -clock clk  0  [get_ports {y1[21]}]
set_input_delay -clock clk  0  [get_ports {y1[20]}]
set_input_delay -clock clk  0  [get_ports {y1[19]}]
set_input_delay -clock clk  0  [get_ports {y1[18]}]
set_input_delay -clock clk  0  [get_ports {y1[17]}]
set_input_delay -clock clk  0  [get_ports {y1[16]}]
set_input_delay -clock clk  0  [get_ports {y1[15]}]
set_input_delay -clock clk  0  [get_ports {y1[14]}]
set_input_delay -clock clk  0  [get_ports {y1[13]}]
set_input_delay -clock clk  0  [get_ports {y1[12]}]
set_input_delay -clock clk  0  [get_ports {y1[11]}]
set_input_delay -clock clk  0  [get_ports {y1[10]}]
set_input_delay -clock clk  0  [get_ports {y1[9]}]
set_input_delay -clock clk  0  [get_ports {y1[8]}]
set_input_delay -clock clk  0  [get_ports {y1[7]}]
set_input_delay -clock clk  0  [get_ports {y1[6]}]
set_input_delay -clock clk  0  [get_ports {y1[5]}]
set_input_delay -clock clk  0  [get_ports {y1[4]}]
set_input_delay -clock clk  0  [get_ports {y1[3]}]
set_input_delay -clock clk  0  [get_ports {y1[2]}]
set_input_delay -clock clk  0  [get_ports {y1[1]}]
set_input_delay -clock clk  0  [get_ports {y1[0]}]
set_input_delay -clock clk  0  [get_ports {y2[31]}]
set_input_delay -clock clk  0  [get_ports {y2[30]}]
set_input_delay -clock clk  0  [get_ports {y2[29]}]
set_input_delay -clock clk  0  [get_ports {y2[28]}]
set_input_delay -clock clk  0  [get_ports {y2[27]}]
set_input_delay -clock clk  0  [get_ports {y2[26]}]
set_input_delay -clock clk  0  [get_ports {y2[25]}]
set_input_delay -clock clk  0  [get_ports {y2[24]}]
set_input_delay -clock clk  0  [get_ports {y2[23]}]
set_input_delay -clock clk  0  [get_ports {y2[22]}]
set_input_delay -clock clk  0  [get_ports {y2[21]}]
set_input_delay -clock clk  0  [get_ports {y2[20]}]
set_input_delay -clock clk  0  [get_ports {y2[19]}]
set_input_delay -clock clk  0  [get_ports {y2[18]}]
set_input_delay -clock clk  0  [get_ports {y2[17]}]
set_input_delay -clock clk  0  [get_ports {y2[16]}]
set_input_delay -clock clk  0  [get_ports {y2[15]}]
set_input_delay -clock clk  0  [get_ports {y2[14]}]
set_input_delay -clock clk  0  [get_ports {y2[13]}]
set_input_delay -clock clk  0  [get_ports {y2[12]}]
set_input_delay -clock clk  0  [get_ports {y2[11]}]
set_input_delay -clock clk  0  [get_ports {y2[10]}]
set_input_delay -clock clk  0  [get_ports {y2[9]}]
set_input_delay -clock clk  0  [get_ports {y2[8]}]
set_input_delay -clock clk  0  [get_ports {y2[7]}]
set_input_delay -clock clk  0  [get_ports {y2[6]}]
set_input_delay -clock clk  0  [get_ports {y2[5]}]
set_input_delay -clock clk  0  [get_ports {y2[4]}]
set_input_delay -clock clk  0  [get_ports {y2[3]}]
set_input_delay -clock clk  0  [get_ports {y2[2]}]
set_input_delay -clock clk  0  [get_ports {y2[1]}]
set_input_delay -clock clk  0  [get_ports {y2[0]}]
set_input_delay -clock clk  0  [get_ports {y3[31]}]
set_input_delay -clock clk  0  [get_ports {y3[30]}]
set_input_delay -clock clk  0  [get_ports {y3[29]}]
set_input_delay -clock clk  0  [get_ports {y3[28]}]
set_input_delay -clock clk  0  [get_ports {y3[27]}]
set_input_delay -clock clk  0  [get_ports {y3[26]}]
set_input_delay -clock clk  0  [get_ports {y3[25]}]
set_input_delay -clock clk  0  [get_ports {y3[24]}]
set_input_delay -clock clk  0  [get_ports {y3[23]}]
set_input_delay -clock clk  0  [get_ports {y3[22]}]
set_input_delay -clock clk  0  [get_ports {y3[21]}]
set_input_delay -clock clk  0  [get_ports {y3[20]}]
set_input_delay -clock clk  0  [get_ports {y3[19]}]
set_input_delay -clock clk  0  [get_ports {y3[18]}]
set_input_delay -clock clk  0  [get_ports {y3[17]}]
set_input_delay -clock clk  0  [get_ports {y3[16]}]
set_input_delay -clock clk  0  [get_ports {y3[15]}]
set_input_delay -clock clk  0  [get_ports {y3[14]}]
set_input_delay -clock clk  0  [get_ports {y3[13]}]
set_input_delay -clock clk  0  [get_ports {y3[12]}]
set_input_delay -clock clk  0  [get_ports {y3[11]}]
set_input_delay -clock clk  0  [get_ports {y3[10]}]
set_input_delay -clock clk  0  [get_ports {y3[9]}]
set_input_delay -clock clk  0  [get_ports {y3[8]}]
set_input_delay -clock clk  0  [get_ports {y3[7]}]
set_input_delay -clock clk  0  [get_ports {y3[6]}]
set_input_delay -clock clk  0  [get_ports {y3[5]}]
set_input_delay -clock clk  0  [get_ports {y3[4]}]
set_input_delay -clock clk  0  [get_ports {y3[3]}]
set_input_delay -clock clk  0  [get_ports {y3[2]}]
set_input_delay -clock clk  0  [get_ports {y3[1]}]
set_input_delay -clock clk  0  [get_ports {y3[0]}]
set_input_delay -clock clk  0  [get_ports {y4[31]}]
set_input_delay -clock clk  0  [get_ports {y4[30]}]
set_input_delay -clock clk  0  [get_ports {y4[29]}]
set_input_delay -clock clk  0  [get_ports {y4[28]}]
set_input_delay -clock clk  0  [get_ports {y4[27]}]
set_input_delay -clock clk  0  [get_ports {y4[26]}]
set_input_delay -clock clk  0  [get_ports {y4[25]}]
set_input_delay -clock clk  0  [get_ports {y4[24]}]
set_input_delay -clock clk  0  [get_ports {y4[23]}]
set_input_delay -clock clk  0  [get_ports {y4[22]}]
set_input_delay -clock clk  0  [get_ports {y4[21]}]
set_input_delay -clock clk  0  [get_ports {y4[20]}]
set_input_delay -clock clk  0  [get_ports {y4[19]}]
set_input_delay -clock clk  0  [get_ports {y4[18]}]
set_input_delay -clock clk  0  [get_ports {y4[17]}]
set_input_delay -clock clk  0  [get_ports {y4[16]}]
set_input_delay -clock clk  0  [get_ports {y4[15]}]
set_input_delay -clock clk  0  [get_ports {y4[14]}]
set_input_delay -clock clk  0  [get_ports {y4[13]}]
set_input_delay -clock clk  0  [get_ports {y4[12]}]
set_input_delay -clock clk  0  [get_ports {y4[11]}]
set_input_delay -clock clk  0  [get_ports {y4[10]}]
set_input_delay -clock clk  0  [get_ports {y4[9]}]
set_input_delay -clock clk  0  [get_ports {y4[8]}]
set_input_delay -clock clk  0  [get_ports {y4[7]}]
set_input_delay -clock clk  0  [get_ports {y4[6]}]
set_input_delay -clock clk  0  [get_ports {y4[5]}]
set_input_delay -clock clk  0  [get_ports {y4[4]}]
set_input_delay -clock clk  0  [get_ports {y4[3]}]
set_input_delay -clock clk  0  [get_ports {y4[2]}]
set_input_delay -clock clk  0  [get_ports {y4[1]}]
set_input_delay -clock clk  0  [get_ports {y4[0]}]
set_output_delay -clock clk  0  [get_ports {result[31]}]
set_output_delay -clock clk  0  [get_ports {result[30]}]
set_output_delay -clock clk  0  [get_ports {result[29]}]
set_output_delay -clock clk  0  [get_ports {result[28]}]
set_output_delay -clock clk  0  [get_ports {result[27]}]
set_output_delay -clock clk  0  [get_ports {result[26]}]
set_output_delay -clock clk  0  [get_ports {result[25]}]
set_output_delay -clock clk  0  [get_ports {result[24]}]
set_output_delay -clock clk  0  [get_ports {result[23]}]
set_output_delay -clock clk  0  [get_ports {result[22]}]
set_output_delay -clock clk  0  [get_ports {result[21]}]
set_output_delay -clock clk  0  [get_ports {result[20]}]
set_output_delay -clock clk  0  [get_ports {result[19]}]
set_output_delay -clock clk  0  [get_ports {result[18]}]
set_output_delay -clock clk  0  [get_ports {result[17]}]
set_output_delay -clock clk  0  [get_ports {result[16]}]
set_output_delay -clock clk  0  [get_ports {result[15]}]
set_output_delay -clock clk  0  [get_ports {result[14]}]
set_output_delay -clock clk  0  [get_ports {result[13]}]
set_output_delay -clock clk  0  [get_ports {result[12]}]
set_output_delay -clock clk  0  [get_ports {result[11]}]
set_output_delay -clock clk  0  [get_ports {result[10]}]
set_output_delay -clock clk  0  [get_ports {result[9]}]
set_output_delay -clock clk  0  [get_ports {result[8]}]
set_output_delay -clock clk  0  [get_ports {result[7]}]
set_output_delay -clock clk  0  [get_ports {result[6]}]
set_output_delay -clock clk  0  [get_ports {result[5]}]
set_output_delay -clock clk  0  [get_ports {result[4]}]
set_output_delay -clock clk  0  [get_ports {result[3]}]
set_output_delay -clock clk  0  [get_ports {result[2]}]
set_output_delay -clock clk  0  [get_ports {result[1]}]
set_output_delay -clock clk  0  [get_ports {result[0]}]
