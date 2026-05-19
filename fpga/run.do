# run.do — ModelSim 시뮬레이션 스크립트
# 사용법: do run.do

vlog spi_slave_interface.v
vlog dds.v
vlog mcp4922_spi_master.v
vlog dds_top.v

vsim -t 100ps -voptargs=+acc dds_top

config wave -signalnamewidth 1
add wave -group {DDS_TOP}    sim:/dds_top/*
add wave -group {SPI_SLAVE}  sim:/dds_top/inst_spi_slave/*
add wave -group {DDS}        sim:/dds_top/inst_dds/*
add wave -group {MCP4922}    sim:/dds_top/inst_mcp4922/*

run 100 us
