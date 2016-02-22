proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

start_step init_design
set rc [catch {
  create_msg_db init_design.pb
  set_param xicom.use_bs_reader 1
  set_property design_mode GateLvl [current_fileset]
  set_property webtalk.parent_dir {D:/Files/Vivado/EE/EE-GITHUB/Extended-Essay/Extended-Essay-master/Extended-Essay-master/Single_location test/Single_location test.cache/wt} [current_project]
  set_property parent.project_path {D:/Files/Vivado/EE/EE-GITHUB/Extended-Essay/Extended-Essay-master/Extended-Essay-master/Single_location test/Single_location test.xpr} [current_project]
  set_property ip_repo_paths {{d:/Files/Vivado/EE/EE-GITHUB/Extended-Essay/Extended-Essay-master/Extended-Essay-master/Single_location test/Single_location test.cache/ip}} [current_project]
  set_property ip_output_repo {{d:/Files/Vivado/EE/EE-GITHUB/Extended-Essay/Extended-Essay-master/Extended-Essay-master/Single_location test/Single_location test.cache/ip}} [current_project]
  add_files -quiet {{D:/Files/Vivado/EE/EE-GITHUB/Extended-Essay/Extended-Essay-master/Extended-Essay-master/Single_location test/Single_location test.runs/synth_1/compare_test.dcp}}
  read_xdc {{D:/Files/Vivado/EE/EE-GITHUB/Extended-Essay/Extended-Essay-master/Extended-Essay-master/Single_location test/Single_location test.srcs/constrs_1/imports/basys3_master/Basys3_Master.xdc}}
  link_design -top compare_test -part xc7a35tcpg236-1
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
}

start_step opt_design
set rc [catch {
  create_msg_db opt_design.pb
  catch {write_debug_probes -quiet -force debug_nets}
  opt_design 
  write_checkpoint -force compare_test_opt.dcp
  report_drc -file compare_test_drc_opted.rpt
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
}

start_step place_design
set rc [catch {
  create_msg_db place_design.pb
  catch {write_hwdef -file compare_test.hwdef}
  place_design 
  write_checkpoint -force compare_test_placed.dcp
  report_io -file compare_test_io_placed.rpt
  report_utilization -file compare_test_utilization_placed.rpt -pb compare_test_utilization_placed.pb
  report_control_sets -verbose -file compare_test_control_sets_placed.rpt
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
}

start_step route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force compare_test_routed.dcp
  report_drc -file compare_test_drc_routed.rpt -pb compare_test_drc_routed.pb
  report_timing_summary -warn_on_violation -max_paths 10 -file compare_test_timing_summary_routed.rpt -rpx compare_test_timing_summary_routed.rpx
  report_power -file compare_test_power_routed.rpt -pb compare_test_power_summary_routed.pb
  report_route_status -file compare_test_route_status.rpt -pb compare_test_route_status.pb
  report_clock_utilization -file compare_test_clock_utilization_routed.rpt
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
}

start_step write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  catch { write_mem_info -force compare_test.mmi }
  write_bitstream -force compare_test.bit 
  catch { write_sysdef -hwdef compare_test.hwdef -bitfile compare_test.bit -meminfo compare_test.mmi -file compare_test.sysdef }
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
}

