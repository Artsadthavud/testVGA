transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/testVGA {C:/altera/13.0sp1/testVGA/testVGA.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/testVGA {C:/altera/13.0sp1/testVGA/hvsync_generator.v}
vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/testVGA {C:/altera/13.0sp1/testVGA/Debouncer.v}

