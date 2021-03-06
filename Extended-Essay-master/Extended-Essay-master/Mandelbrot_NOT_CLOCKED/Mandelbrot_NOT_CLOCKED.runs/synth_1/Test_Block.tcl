# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {C:/Users/kaveh/Documents/Extended Essay/GitHub/Extended-Essay/Extended-Essay-master/Extended-Essay-master/Mandelbrot_NOT_CLOCKED/Mandelbrot_NOT_CLOCKED.cache/wt} [current_project]
set_property parent.project_path {C:/Users/kaveh/Documents/Extended Essay/GitHub/Extended-Essay/Extended-Essay-master/Extended-Essay-master/Mandelbrot_NOT_CLOCKED/Mandelbrot_NOT_CLOCKED.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property vhdl_version vhdl_2k [current_fileset]
read_verilog -library xil_defaultlib -sv {{C:/Users/kaveh/Documents/Extended Essay/GitHub/Extended-Essay/Extended-Essay-master/Extended-Essay-master/Mandelbrot_NOT_CLOCKED/Mandelbrot_NOT_CLOCKED.srcs/sources_1/new/Test_Block.sv}}
read_verilog -library xil_defaultlib {
  {C:/Users/kaveh/Documents/Extended Essay/GitHub/Extended-Essay/Extended-Essay-master/Extended-Essay-master/Mandelbrot_NOT_CLOCKED/Mandelbrot_NOT_CLOCKED.srcs/sources_1/imports/sources_1/new/Multiplier.v}
  {C:/Users/kaveh/Documents/Extended Essay/GitHub/Extended-Essay/Extended-Essay-master/Extended-Essay-master/Mandelbrot_NOT_CLOCKED/Mandelbrot_NOT_CLOCKED.srcs/sources_1/new/Complex_Multiply.v}
  {C:/Users/kaveh/Documents/Extended Essay/GitHub/Extended-Essay/Extended-Essay-master/Extended-Essay-master/Mandelbrot_NOT_CLOCKED/Mandelbrot_NOT_CLOCKED.srcs/sources_1/imports/sources_1/new/Iter_Counter.v}
  {C:/Users/kaveh/Documents/Extended Essay/GitHub/Extended-Essay/Extended-Essay-master/Extended-Essay-master/Mandelbrot_NOT_CLOCKED/Mandelbrot_NOT_CLOCKED.srcs/sources_1/new/Complex_add.v}
  {C:/Users/kaveh/Documents/Extended Essay/GitHub/Extended-Essay/Extended-Essay-master/Extended-Essay-master/Mandelbrot_NOT_CLOCKED/Mandelbrot_NOT_CLOCKED.srcs/sources_1/new/Comparator.v}
  {C:/Users/kaveh/Documents/Extended Essay/GitHub/Extended-Essay/Extended-Essay-master/Extended-Essay-master/Mandelbrot_NOT_CLOCKED/Mandelbrot_NOT_CLOCKED.srcs/sources_1/imports/sources_1/new/Clock_Divide.v}
  {C:/Users/kaveh/Documents/Extended Essay/GitHub/Extended-Essay/Extended-Essay-master/Extended-Essay-master/Mandelbrot_NOT_CLOCKED/Mandelbrot_NOT_CLOCKED.srcs/sources_1/new/Single_Location.v}
}
read_xdc {{C:/Users/kaveh/Documents/Extended Essay/GitHub/Extended-Essay/Extended-Essay-master/Extended-Essay-master/Mandelbrot_NOT_CLOCKED/Mandelbrot_NOT_CLOCKED.srcs/constrs_1/imports/basys3_master/Basys3_Master.xdc}}
set_property used_in_implementation false [get_files {{C:/Users/kaveh/Documents/Extended Essay/GitHub/Extended-Essay/Extended-Essay-master/Extended-Essay-master/Mandelbrot_NOT_CLOCKED/Mandelbrot_NOT_CLOCKED.srcs/constrs_1/imports/basys3_master/Basys3_Master.xdc}}]

synth_design -top Test_Block -part xc7a35tcpg236-1 -directive AreaOptimized_high -control_set_opt_threshold 1
write_checkpoint -noxdef Test_Block.dcp
catch { report_utilization -file Test_Block_utilization_synth.rpt -pb Test_Block_utilization_synth.pb }
