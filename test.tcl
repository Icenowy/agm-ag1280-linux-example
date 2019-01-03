set_seed_rand 7788
load_architect -type AG1280Q48 1 1 1000 1000
read_design_and_pack -top test test.vqm
set_location_assignment -to osc_in PIN_13
set_location_assignment -to osc_out PIN_14
set_location_assignment -to led PIN_1
place_design -dump place.tx
route_design -dump route.tx
# place_and_route_design
write_routed_design routed.v

bitgen sram -prg "out_sram.prg"
