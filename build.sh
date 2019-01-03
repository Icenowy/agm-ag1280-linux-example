yosys test.ys
af -f test.tcl
tclsh prg2svf.tcl out_sram.prg > out_sram.svf
