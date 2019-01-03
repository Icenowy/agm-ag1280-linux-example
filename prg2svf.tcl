if { $::argc != 1 } {
	puts stderr "Need an .prg file argument!"
	exit 1
}

proc usb_connect {} {
	puts stdout "ENDDR IDLE;\nENDIR IDLE;\nSTATE IDLE;"
}

proc jtag_device_id {} {
	return 1
}

proc usb_close {} {
	return 1
}

proc hybrid_write args {
	puts stderr "Hybrid is not supported!"
	exit 1
}

proc runtest {unit_opt val} {
	if { $unit_opt != "-tck" } {
		puts stderr "Unknown runtest option!"
		exit 1
	}
	if { $unit_opt == "-tck" } {
		puts stdout "RUNTEST $val TCK;"
	}
}

proc sir {len tdi val} {
	if { $tdi != "-tdi" } {
		puts stderr "SIR should have TDI input!"
		exit 1
	}
	if { $tdi == "-tdi" } {
		puts stdout "SIR $len TDI ($val);"
	}
}

proc sdr {len tdi tdi_val {tdo ""} {tdo_val 0} {mask ""} {mask_val 0}} {
	if { $tdi != "-tdi" } {
		puts stderr "SDR should have TDI input!"
		exit 1
	}
	if { $tdo == "" } {
		puts stdout "SDR $len TDI ($tdi_val);"
	} else {
		if { $tdo != "-tdo" || $mask != "-mask" } {
			puts stderr "SDR should have TDO and MASK input if there's > 3 parameters!"
			exit 1
		} else {
			puts stdout "SDR $len TDI ($tdi_val) TDO ($tdo_val) MASK ($mask_val);"
		}
	}
}

source [lindex $::argv 0]
