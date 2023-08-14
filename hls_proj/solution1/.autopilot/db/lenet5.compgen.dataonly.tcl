# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_control {
w_conv0 { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 16
	offset_end 27
}
b_conv0 { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 28
	offset_end 39
}
w_conv1 { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 40
	offset_end 51
}
b_conv1 { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 52
	offset_end 63
}
w_fc0 { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 64
	offset_end 75
}
b_fc0 { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 76
	offset_end 87
}
w_fc1 { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 88
	offset_end 99
}
b_fc1 { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 100
	offset_end 111
}
feature_in { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 112
	offset_end 123
}
feature_out { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 124
	offset_end 135
}
result { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 136
	offset_end 147
}
ap_start { }
ap_done { }
ap_ready { }
ap_idle { }
}
dict set axilite_register_dict control $port_control


