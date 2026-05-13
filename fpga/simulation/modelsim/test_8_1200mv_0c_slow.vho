-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "05/13/2026 14:07:12"

-- 
-- Device: Altera EP4CE15F17C8 Package FBGA256
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	dds_top IS
    PORT (
	clk : IN std_logic;
	rst_n : IN std_logic;
	spi_clock : IN std_logic;
	spi_cs_n : IN std_logic;
	spi_mosi : IN std_logic;
	fselect : IN std_logic;
	pselect : IN std_logic;
	dds_output : BUFFER std_logic_vector(7 DOWNTO 0)
	);
END dds_top;

-- Design Ports Information
-- fselect	=>  Location: PIN_A8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pselect	=>  Location: PIN_B8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dds_output[0]	=>  Location: PIN_B6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dds_output[1]	=>  Location: PIN_A5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dds_output[2]	=>  Location: PIN_B5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dds_output[3]	=>  Location: PIN_A4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dds_output[4]	=>  Location: PIN_B4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dds_output[5]	=>  Location: PIN_A3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dds_output[6]	=>  Location: PIN_B3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dds_output[7]	=>  Location: PIN_A2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_T8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst_n	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- spi_cs_n	=>  Location: PIN_T2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- spi_clock	=>  Location: PIN_B1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- spi_mosi	=>  Location: PIN_R8,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF dds_top IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_rst_n : std_logic;
SIGNAL ww_spi_clock : std_logic;
SIGNAL ww_spi_cs_n : std_logic;
SIGNAL ww_spi_mosi : std_logic;
SIGNAL ww_fselect : std_logic;
SIGNAL ww_pselect : std_logic;
SIGNAL ww_dds_output : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst_dds|Mult0|auto_generated|mac_out2_DATAA_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \inst_dds|Mult0|auto_generated|mac_out2_DATAOUT_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \inst_dds|Mult0|auto_generated|mac_mult1_DATAA_bus\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \inst_dds|Mult0|auto_generated|mac_mult1_DATAB_bus\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \inst_dds|Mult0|auto_generated|mac_mult1_DATAOUT_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a0_PORTBDATAIN_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst_dds|Mult0|auto_generated|mac_out2~dataout\ : std_logic;
SIGNAL \inst_dds|Mult0|auto_generated|mac_out2~DATAOUT1\ : std_logic;
SIGNAL \inst_dds|Mult0|auto_generated|mac_out2~DATAOUT2\ : std_logic;
SIGNAL \inst_dds|Mult0|auto_generated|mac_out2~DATAOUT3\ : std_logic;
SIGNAL \inst_dds|Mult0|auto_generated|mac_out2~DATAOUT4\ : std_logic;
SIGNAL \inst_dds|Mult0|auto_generated|mac_out2~DATAOUT5\ : std_logic;
SIGNAL \inst_dds|Mult0|auto_generated|mac_out2~DATAOUT6\ : std_logic;
SIGNAL \inst_dds|Mult0|auto_generated|mac_out2~DATAOUT7\ : std_logic;
SIGNAL \inst_dds|Mult0|auto_generated|mac_out2~0\ : std_logic;
SIGNAL \inst_dds|Mult0|auto_generated|mac_out2~1\ : std_logic;
SIGNAL \fselect~input_o\ : std_logic;
SIGNAL \pselect~input_o\ : std_logic;
SIGNAL \dds_output[0]~output_o\ : std_logic;
SIGNAL \dds_output[1]~output_o\ : std_logic;
SIGNAL \dds_output[2]~output_o\ : std_logic;
SIGNAL \dds_output[3]~output_o\ : std_logic;
SIGNAL \dds_output[4]~output_o\ : std_logic;
SIGNAL \dds_output[5]~output_o\ : std_logic;
SIGNAL \dds_output[6]~output_o\ : std_logic;
SIGNAL \dds_output[7]~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \spi_mosi~input_o\ : std_logic;
SIGNAL \inst_spi_slave_interface|shift_register[0]~feeder_combout\ : std_logic;
SIGNAL \rst_n~input_o\ : std_logic;
SIGNAL \spi_clock~input_o\ : std_logic;
SIGNAL \inst_spi_slave_interface|spi_clock_d~q\ : std_logic;
SIGNAL \inst_spi_slave_interface|always0~0_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|register_gain[0]~feeder_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|shift_register[4]~feeder_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|shift_register[6]~feeder_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|shift_register[7]~feeder_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|shift_register[9]~feeder_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|shift_register[10]~feeder_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|shift_register[11]~feeder_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|shift_register[14]~feeder_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|shift_register[16]~feeder_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|shift_register[17]~feeder_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|shift_register[18]~feeder_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|shift_register[21]~feeder_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|shift_register[23]~feeder_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|shift_register[24]~feeder_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|shift_register[25]~feeder_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|shift_register[26]~feeder_combout\ : std_logic;
SIGNAL \spi_cs_n~input_o\ : std_logic;
SIGNAL \inst_spi_slave_interface|spi_cs_n_d~0_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|spi_cs_n_d~q\ : std_logic;
SIGNAL \inst_spi_slave_interface|Decoder0~0_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|Decoder0~2_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|register_gain[1]~feeder_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|register_freq0[20]~feeder_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|Decoder0~5_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|register_freq0[17]~feeder_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|register_freq0[15]~feeder_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|register_freq0[14]~feeder_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|register_freq0[12]~feeder_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|register_freq0[11]~feeder_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|register_freq0[9]~feeder_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|register_freq0[8]~feeder_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|register_freq0[6]~feeder_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|register_freq0[5]~feeder_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|register_freq0[4]~feeder_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|register_freq0[3]~feeder_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|register_freq0[0]~feeder_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator0[0]~28_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator0[0]~29\ : std_logic;
SIGNAL \inst_dds|phase_accumulator0[1]~30_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator0[1]~31\ : std_logic;
SIGNAL \inst_dds|phase_accumulator0[2]~32_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator0[2]~33\ : std_logic;
SIGNAL \inst_dds|phase_accumulator0[3]~34_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator0[3]~35\ : std_logic;
SIGNAL \inst_dds|phase_accumulator0[4]~36_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator0[4]~37\ : std_logic;
SIGNAL \inst_dds|phase_accumulator0[5]~38_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator0[5]~39\ : std_logic;
SIGNAL \inst_dds|phase_accumulator0[6]~40_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator0[6]~41\ : std_logic;
SIGNAL \inst_dds|phase_accumulator0[7]~42_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator0[7]~43\ : std_logic;
SIGNAL \inst_dds|phase_accumulator0[8]~44_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator0[8]~45\ : std_logic;
SIGNAL \inst_dds|phase_accumulator0[9]~46_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator0[9]~47\ : std_logic;
SIGNAL \inst_dds|phase_accumulator0[10]~48_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator0[10]~49\ : std_logic;
SIGNAL \inst_dds|phase_accumulator0[11]~50_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator0[11]~51\ : std_logic;
SIGNAL \inst_dds|phase_accumulator0[12]~52_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator0[12]~53\ : std_logic;
SIGNAL \inst_dds|phase_accumulator0[13]~54_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator0[13]~55\ : std_logic;
SIGNAL \inst_dds|phase_accumulator0[14]~56_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator0[14]~57\ : std_logic;
SIGNAL \inst_dds|phase_accumulator0[15]~58_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator0[15]~59\ : std_logic;
SIGNAL \inst_dds|phase_accumulator0[16]~60_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator0[16]~61\ : std_logic;
SIGNAL \inst_dds|phase_accumulator0[17]~62_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator0[17]~63\ : std_logic;
SIGNAL \inst_dds|phase_accumulator0[18]~64_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator0[18]~65\ : std_logic;
SIGNAL \inst_dds|phase_accumulator0[19]~66_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator0[19]~67\ : std_logic;
SIGNAL \inst_dds|phase_accumulator0[20]~68_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|register_phase0[4]~feeder_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|Decoder0~3_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|register_phase0[1]~feeder_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|register_phase0[0]~feeder_combout\ : std_logic;
SIGNAL \inst_dds|phase_post_offset0[4]~9_cout\ : std_logic;
SIGNAL \inst_dds|phase_post_offset0[4]~11_cout\ : std_logic;
SIGNAL \inst_dds|phase_post_offset0[4]~13_cout\ : std_logic;
SIGNAL \inst_dds|phase_post_offset0[4]~15_cout\ : std_logic;
SIGNAL \inst_dds|phase_post_offset0[4]~16_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator0[20]~69\ : std_logic;
SIGNAL \inst_dds|phase_accumulator0[21]~70_combout\ : std_logic;
SIGNAL \inst_dds|phase_post_offset0[4]~17\ : std_logic;
SIGNAL \inst_dds|phase_post_offset0[5]~18_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|register_freq0[22]~feeder_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator0[21]~71\ : std_logic;
SIGNAL \inst_dds|phase_accumulator0[22]~72_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|register_phase0[6]~feeder_combout\ : std_logic;
SIGNAL \inst_dds|phase_post_offset0[5]~19\ : std_logic;
SIGNAL \inst_dds|phase_post_offset0[6]~20_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|register_phase0[7]~feeder_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|register_freq0[23]~feeder_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator0[22]~73\ : std_logic;
SIGNAL \inst_dds|phase_accumulator0[23]~74_combout\ : std_logic;
SIGNAL \inst_dds|phase_post_offset0[6]~21\ : std_logic;
SIGNAL \inst_dds|phase_post_offset0[7]~22_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|register_freq0[24]~feeder_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator0[23]~75\ : std_logic;
SIGNAL \inst_dds|phase_accumulator0[24]~76_combout\ : std_logic;
SIGNAL \inst_dds|phase_post_offset0[7]~23\ : std_logic;
SIGNAL \inst_dds|phase_post_offset0[8]~24_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|register_phase0[9]~feeder_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|register_freq0[25]~feeder_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator0[24]~77\ : std_logic;
SIGNAL \inst_dds|phase_accumulator0[25]~78_combout\ : std_logic;
SIGNAL \inst_dds|phase_post_offset0[8]~25\ : std_logic;
SIGNAL \inst_dds|phase_post_offset0[9]~26_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|register_freq0[26]~feeder_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator0[25]~79\ : std_logic;
SIGNAL \inst_dds|phase_accumulator0[26]~80_combout\ : std_logic;
SIGNAL \inst_dds|phase_post_offset0[9]~27\ : std_logic;
SIGNAL \inst_dds|phase_post_offset0[10]~28_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|register_freq0[27]~feeder_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator0[26]~81\ : std_logic;
SIGNAL \inst_dds|phase_accumulator0[27]~82_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|register_phase0[11]~feeder_combout\ : std_logic;
SIGNAL \inst_dds|phase_post_offset0[10]~29\ : std_logic;
SIGNAL \inst_dds|phase_post_offset0[11]~30_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|Decoder0~6_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|register_freq1[19]~feeder_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|register_freq1[17]~feeder_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|register_freq1[13]~feeder_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|register_freq1[12]~feeder_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|register_freq1[10]~feeder_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|register_freq1[9]~feeder_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|register_freq1[8]~feeder_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|register_freq1[7]~feeder_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|register_freq1[5]~feeder_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|register_freq1[4]~feeder_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|register_freq1[3]~feeder_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|register_freq1[2]~feeder_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|register_freq1[0]~feeder_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator1[0]~28_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator1[0]~29\ : std_logic;
SIGNAL \inst_dds|phase_accumulator1[1]~30_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator1[1]~31\ : std_logic;
SIGNAL \inst_dds|phase_accumulator1[2]~32_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator1[2]~33\ : std_logic;
SIGNAL \inst_dds|phase_accumulator1[3]~34_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator1[3]~35\ : std_logic;
SIGNAL \inst_dds|phase_accumulator1[4]~36_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator1[4]~37\ : std_logic;
SIGNAL \inst_dds|phase_accumulator1[5]~38_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator1[5]~39\ : std_logic;
SIGNAL \inst_dds|phase_accumulator1[6]~40_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator1[6]~41\ : std_logic;
SIGNAL \inst_dds|phase_accumulator1[7]~42_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator1[7]~43\ : std_logic;
SIGNAL \inst_dds|phase_accumulator1[8]~44_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator1[8]~45\ : std_logic;
SIGNAL \inst_dds|phase_accumulator1[9]~46_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator1[9]~47\ : std_logic;
SIGNAL \inst_dds|phase_accumulator1[10]~48_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator1[10]~49\ : std_logic;
SIGNAL \inst_dds|phase_accumulator1[11]~50_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator1[11]~51\ : std_logic;
SIGNAL \inst_dds|phase_accumulator1[12]~52_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator1[12]~53\ : std_logic;
SIGNAL \inst_dds|phase_accumulator1[13]~54_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator1[13]~55\ : std_logic;
SIGNAL \inst_dds|phase_accumulator1[14]~56_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator1[14]~57\ : std_logic;
SIGNAL \inst_dds|phase_accumulator1[15]~58_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator1[15]~59\ : std_logic;
SIGNAL \inst_dds|phase_accumulator1[16]~60_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator1[16]~61\ : std_logic;
SIGNAL \inst_dds|phase_accumulator1[17]~62_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator1[17]~63\ : std_logic;
SIGNAL \inst_dds|phase_accumulator1[18]~64_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator1[18]~65\ : std_logic;
SIGNAL \inst_dds|phase_accumulator1[19]~66_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator1[19]~67\ : std_logic;
SIGNAL \inst_dds|phase_accumulator1[20]~68_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|register_phase1[4]~feeder_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|Decoder0~4_combout\ : std_logic;
SIGNAL \inst_dds|phase_post_offset1[4]~9_cout\ : std_logic;
SIGNAL \inst_dds|phase_post_offset1[4]~11_cout\ : std_logic;
SIGNAL \inst_dds|phase_post_offset1[4]~13_cout\ : std_logic;
SIGNAL \inst_dds|phase_post_offset1[4]~15_cout\ : std_logic;
SIGNAL \inst_dds|phase_post_offset1[4]~16_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|register_freq1[21]~feeder_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator1[20]~69\ : std_logic;
SIGNAL \inst_dds|phase_accumulator1[21]~70_combout\ : std_logic;
SIGNAL \inst_dds|phase_post_offset1[4]~17\ : std_logic;
SIGNAL \inst_dds|phase_post_offset1[5]~18_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|register_freq1[22]~feeder_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator1[21]~71\ : std_logic;
SIGNAL \inst_dds|phase_accumulator1[22]~72_combout\ : std_logic;
SIGNAL \inst_dds|phase_post_offset1[5]~19\ : std_logic;
SIGNAL \inst_dds|phase_post_offset1[6]~20_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|register_freq1[23]~feeder_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator1[22]~73\ : std_logic;
SIGNAL \inst_dds|phase_accumulator1[23]~74_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|register_phase1[7]~feeder_combout\ : std_logic;
SIGNAL \inst_dds|phase_post_offset1[6]~21\ : std_logic;
SIGNAL \inst_dds|phase_post_offset1[7]~22_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|register_freq1[24]~feeder_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator1[23]~75\ : std_logic;
SIGNAL \inst_dds|phase_accumulator1[24]~76_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|register_phase1[8]~feeder_combout\ : std_logic;
SIGNAL \inst_dds|phase_post_offset1[7]~23\ : std_logic;
SIGNAL \inst_dds|phase_post_offset1[8]~24_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|register_phase1[9]~feeder_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|register_freq1[25]~feeder_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator1[24]~77\ : std_logic;
SIGNAL \inst_dds|phase_accumulator1[25]~78_combout\ : std_logic;
SIGNAL \inst_dds|phase_post_offset1[8]~25\ : std_logic;
SIGNAL \inst_dds|phase_post_offset1[9]~26_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator1[25]~79\ : std_logic;
SIGNAL \inst_dds|phase_accumulator1[26]~80_combout\ : std_logic;
SIGNAL \inst_dds|phase_post_offset1[9]~27\ : std_logic;
SIGNAL \inst_dds|phase_post_offset1[10]~28_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|register_freq1[27]~feeder_combout\ : std_logic;
SIGNAL \inst_dds|phase_accumulator1[26]~81\ : std_logic;
SIGNAL \inst_dds|phase_accumulator1[27]~82_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|register_phase1[11]~feeder_combout\ : std_logic;
SIGNAL \inst_dds|phase_post_offset1[10]~29\ : std_logic;
SIGNAL \inst_dds|phase_post_offset1[11]~30_combout\ : std_logic;
SIGNAL \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a1\ : std_logic;
SIGNAL \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a1~PORTBDATAOUT0\ : std_logic;
SIGNAL \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a0~portadataout\ : std_logic;
SIGNAL \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a0~PORTBDATAOUT0\ : std_logic;
SIGNAL \inst_dds|Add4~1_cout\ : std_logic;
SIGNAL \inst_dds|sine_sum[1]~0_combout\ : std_logic;
SIGNAL \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a2~PORTBDATAOUT0\ : std_logic;
SIGNAL \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a2\ : std_logic;
SIGNAL \inst_dds|sine_sum[1]~1\ : std_logic;
SIGNAL \inst_dds|sine_sum[2]~2_combout\ : std_logic;
SIGNAL \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a3~PORTBDATAOUT0\ : std_logic;
SIGNAL \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a3\ : std_logic;
SIGNAL \inst_dds|sine_sum[2]~3\ : std_logic;
SIGNAL \inst_dds|sine_sum[3]~4_combout\ : std_logic;
SIGNAL \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a4\ : std_logic;
SIGNAL \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a4~PORTBDATAOUT0\ : std_logic;
SIGNAL \inst_dds|sine_sum[3]~5\ : std_logic;
SIGNAL \inst_dds|sine_sum[4]~6_combout\ : std_logic;
SIGNAL \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a5~PORTBDATAOUT0\ : std_logic;
SIGNAL \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a5\ : std_logic;
SIGNAL \inst_dds|sine_sum[4]~7\ : std_logic;
SIGNAL \inst_dds|sine_sum[5]~8_combout\ : std_logic;
SIGNAL \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a6\ : std_logic;
SIGNAL \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a6~PORTBDATAOUT0\ : std_logic;
SIGNAL \inst_dds|sine_sum[5]~9\ : std_logic;
SIGNAL \inst_dds|sine_sum[6]~10_combout\ : std_logic;
SIGNAL \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a7\ : std_logic;
SIGNAL \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a7~PORTBDATAOUT0\ : std_logic;
SIGNAL \inst_dds|sine_sum[6]~11\ : std_logic;
SIGNAL \inst_dds|sine_sum[7]~12_combout\ : std_logic;
SIGNAL \inst_dds|sine_sum[7]~13\ : std_logic;
SIGNAL \inst_dds|sine_sum[8]~14_combout\ : std_logic;
SIGNAL \inst_dds|Mult0|auto_generated|mac_mult1~dataout\ : std_logic;
SIGNAL \inst_dds|Mult0|auto_generated|mac_mult1~DATAOUT1\ : std_logic;
SIGNAL \inst_dds|Mult0|auto_generated|mac_mult1~DATAOUT2\ : std_logic;
SIGNAL \inst_dds|Mult0|auto_generated|mac_mult1~DATAOUT3\ : std_logic;
SIGNAL \inst_dds|Mult0|auto_generated|mac_mult1~DATAOUT4\ : std_logic;
SIGNAL \inst_dds|Mult0|auto_generated|mac_mult1~DATAOUT5\ : std_logic;
SIGNAL \inst_dds|Mult0|auto_generated|mac_mult1~DATAOUT6\ : std_logic;
SIGNAL \inst_dds|Mult0|auto_generated|mac_mult1~DATAOUT7\ : std_logic;
SIGNAL \inst_dds|Mult0|auto_generated|mac_mult1~DATAOUT8\ : std_logic;
SIGNAL \inst_dds|Mult0|auto_generated|mac_mult1~DATAOUT9\ : std_logic;
SIGNAL \inst_dds|Mult0|auto_generated|mac_mult1~DATAOUT10\ : std_logic;
SIGNAL \inst_dds|Mult0|auto_generated|mac_mult1~DATAOUT11\ : std_logic;
SIGNAL \inst_dds|Mult0|auto_generated|mac_mult1~DATAOUT12\ : std_logic;
SIGNAL \inst_dds|Mult0|auto_generated|mac_mult1~DATAOUT13\ : std_logic;
SIGNAL \inst_dds|Mult0|auto_generated|mac_mult1~DATAOUT14\ : std_logic;
SIGNAL \inst_dds|Mult0|auto_generated|mac_mult1~DATAOUT15\ : std_logic;
SIGNAL \inst_dds|Mult0|auto_generated|mac_mult1~0\ : std_logic;
SIGNAL \inst_dds|Mult0|auto_generated|mac_mult1~1\ : std_logic;
SIGNAL \inst_spi_slave_interface|Decoder0~1_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|register_offset[1]~feeder_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|register_offset[0]~feeder_combout\ : std_logic;
SIGNAL \inst_dds|sine_data_post_offset[0]~10\ : std_logic;
SIGNAL \inst_dds|sine_data_post_offset[1]~12\ : std_logic;
SIGNAL \inst_dds|sine_data_post_offset[2]~14\ : std_logic;
SIGNAL \inst_dds|sine_data_post_offset[3]~16\ : std_logic;
SIGNAL \inst_dds|sine_data_post_offset[4]~18\ : std_logic;
SIGNAL \inst_dds|sine_data_post_offset[5]~20\ : std_logic;
SIGNAL \inst_dds|sine_data_post_offset[6]~22\ : std_logic;
SIGNAL \inst_dds|sine_data_post_offset[7]~23_combout\ : std_logic;
SIGNAL \inst_dds|sine_data_post_offset[7]~24\ : std_logic;
SIGNAL \inst_dds|sine_data_post_offset[8]~25_combout\ : std_logic;
SIGNAL \inst_dds|sine_data_post_offset[0]~9_combout\ : std_logic;
SIGNAL \inst_dds|sine_data_post_offset_satured~0_combout\ : std_logic;
SIGNAL \inst_dds|sine_data_post_offset[1]~11_combout\ : std_logic;
SIGNAL \inst_dds|sine_data_post_offset_satured~1_combout\ : std_logic;
SIGNAL \inst_dds|sine_data_post_offset[2]~13_combout\ : std_logic;
SIGNAL \inst_dds|sine_data_post_offset_satured~2_combout\ : std_logic;
SIGNAL \inst_dds|sine_data_post_offset[3]~15_combout\ : std_logic;
SIGNAL \inst_dds|sine_data_post_offset_satured~3_combout\ : std_logic;
SIGNAL \inst_dds|sine_data_post_offset[4]~17_combout\ : std_logic;
SIGNAL \inst_dds|sine_data_post_offset_satured~4_combout\ : std_logic;
SIGNAL \inst_dds|sine_data_post_offset[5]~19_combout\ : std_logic;
SIGNAL \inst_dds|sine_data_post_offset_satured~5_combout\ : std_logic;
SIGNAL \inst_dds|sine_data_post_offset[6]~21_combout\ : std_logic;
SIGNAL \inst_dds|sine_data_post_offset_satured~6_combout\ : std_logic;
SIGNAL \inst_dds|sine_data_post_offset_satured[7]~feeder_combout\ : std_logic;
SIGNAL \inst_spi_slave_interface|register_phase0\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \inst_spi_slave_interface|shift_register\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \inst_dds|phase_accumulator0\ : std_logic_vector(27 DOWNTO 0);
SIGNAL \inst_spi_slave_interface|register_phase1\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \inst_spi_slave_interface|register_freq1\ : std_logic_vector(27 DOWNTO 0);
SIGNAL \inst_spi_slave_interface|register_offset\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst_spi_slave_interface|register_gain\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst_dds|phase_post_offset1\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \inst_dds|sine_data_post_gain\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \inst_dds|sine_data_post_offset\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \inst_dds|sine_data_post_offset_satured\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst_dds|phase_post_offset0\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \inst_spi_slave_interface|register_freq0\ : std_logic_vector(27 DOWNTO 0);
SIGNAL \inst_dds|phase_accumulator1\ : std_logic_vector(27 DOWNTO 0);
SIGNAL \ALT_INV_rst_n~input_o\ : std_logic;
SIGNAL \inst_dds|ALT_INV_sine_data_post_offset_satured\ : std_logic_vector(7 DOWNTO 7);

BEGIN

ww_clk <= clk;
ww_rst_n <= rst_n;
ww_spi_clock <= spi_clock;
ww_spi_cs_n <= spi_cs_n;
ww_spi_mosi <= spi_mosi;
ww_fselect <= fselect;
ww_pselect <= pselect;
dds_output <= ww_dds_output;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\inst_dds|Mult0|auto_generated|mac_out2_DATAA_bus\ <= (\inst_dds|Mult0|auto_generated|mac_mult1~DATAOUT15\ & \inst_dds|Mult0|auto_generated|mac_mult1~DATAOUT14\ & \inst_dds|Mult0|auto_generated|mac_mult1~DATAOUT13\ & 
\inst_dds|Mult0|auto_generated|mac_mult1~DATAOUT12\ & \inst_dds|Mult0|auto_generated|mac_mult1~DATAOUT11\ & \inst_dds|Mult0|auto_generated|mac_mult1~DATAOUT10\ & \inst_dds|Mult0|auto_generated|mac_mult1~DATAOUT9\ & 
\inst_dds|Mult0|auto_generated|mac_mult1~DATAOUT8\ & \inst_dds|Mult0|auto_generated|mac_mult1~DATAOUT7\ & \inst_dds|Mult0|auto_generated|mac_mult1~DATAOUT6\ & \inst_dds|Mult0|auto_generated|mac_mult1~DATAOUT5\ & 
\inst_dds|Mult0|auto_generated|mac_mult1~DATAOUT4\ & \inst_dds|Mult0|auto_generated|mac_mult1~DATAOUT3\ & \inst_dds|Mult0|auto_generated|mac_mult1~DATAOUT2\ & \inst_dds|Mult0|auto_generated|mac_mult1~DATAOUT1\ & 
\inst_dds|Mult0|auto_generated|mac_mult1~dataout\ & \inst_dds|Mult0|auto_generated|mac_mult1~1\ & \inst_dds|Mult0|auto_generated|mac_mult1~0\);

\inst_dds|Mult0|auto_generated|mac_out2~0\ <= \inst_dds|Mult0|auto_generated|mac_out2_DATAOUT_bus\(0);
\inst_dds|Mult0|auto_generated|mac_out2~1\ <= \inst_dds|Mult0|auto_generated|mac_out2_DATAOUT_bus\(1);
\inst_dds|Mult0|auto_generated|mac_out2~dataout\ <= \inst_dds|Mult0|auto_generated|mac_out2_DATAOUT_bus\(2);
\inst_dds|Mult0|auto_generated|mac_out2~DATAOUT1\ <= \inst_dds|Mult0|auto_generated|mac_out2_DATAOUT_bus\(3);
\inst_dds|Mult0|auto_generated|mac_out2~DATAOUT2\ <= \inst_dds|Mult0|auto_generated|mac_out2_DATAOUT_bus\(4);
\inst_dds|Mult0|auto_generated|mac_out2~DATAOUT3\ <= \inst_dds|Mult0|auto_generated|mac_out2_DATAOUT_bus\(5);
\inst_dds|Mult0|auto_generated|mac_out2~DATAOUT4\ <= \inst_dds|Mult0|auto_generated|mac_out2_DATAOUT_bus\(6);
\inst_dds|Mult0|auto_generated|mac_out2~DATAOUT5\ <= \inst_dds|Mult0|auto_generated|mac_out2_DATAOUT_bus\(7);
\inst_dds|Mult0|auto_generated|mac_out2~DATAOUT6\ <= \inst_dds|Mult0|auto_generated|mac_out2_DATAOUT_bus\(8);
\inst_dds|Mult0|auto_generated|mac_out2~DATAOUT7\ <= \inst_dds|Mult0|auto_generated|mac_out2_DATAOUT_bus\(9);
\inst_dds|sine_data_post_gain\(8) <= \inst_dds|Mult0|auto_generated|mac_out2_DATAOUT_bus\(10);
\inst_dds|sine_data_post_gain\(9) <= \inst_dds|Mult0|auto_generated|mac_out2_DATAOUT_bus\(11);
\inst_dds|sine_data_post_gain\(10) <= \inst_dds|Mult0|auto_generated|mac_out2_DATAOUT_bus\(12);
\inst_dds|sine_data_post_gain\(11) <= \inst_dds|Mult0|auto_generated|mac_out2_DATAOUT_bus\(13);
\inst_dds|sine_data_post_gain\(12) <= \inst_dds|Mult0|auto_generated|mac_out2_DATAOUT_bus\(14);
\inst_dds|sine_data_post_gain\(13) <= \inst_dds|Mult0|auto_generated|mac_out2_DATAOUT_bus\(15);
\inst_dds|sine_data_post_gain\(14) <= \inst_dds|Mult0|auto_generated|mac_out2_DATAOUT_bus\(16);
\inst_dds|sine_data_post_gain\(15) <= \inst_dds|Mult0|auto_generated|mac_out2_DATAOUT_bus\(17);

\inst_dds|Mult0|auto_generated|mac_mult1_DATAA_bus\ <= (\inst_spi_slave_interface|register_gain\(7) & \inst_spi_slave_interface|register_gain\(6) & \inst_spi_slave_interface|register_gain\(5) & \inst_spi_slave_interface|register_gain\(4) & 
\inst_spi_slave_interface|register_gain\(3) & \inst_spi_slave_interface|register_gain\(2) & \inst_spi_slave_interface|register_gain\(1) & \inst_spi_slave_interface|register_gain\(0) & gnd);

\inst_dds|Mult0|auto_generated|mac_mult1_DATAB_bus\ <= (\inst_dds|sine_sum[8]~14_combout\ & \inst_dds|sine_sum[7]~12_combout\ & \inst_dds|sine_sum[6]~10_combout\ & \inst_dds|sine_sum[5]~8_combout\ & \inst_dds|sine_sum[4]~6_combout\ & 
\inst_dds|sine_sum[3]~4_combout\ & \inst_dds|sine_sum[2]~2_combout\ & \inst_dds|sine_sum[1]~0_combout\ & gnd);

\inst_dds|Mult0|auto_generated|mac_mult1~0\ <= \inst_dds|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(0);
\inst_dds|Mult0|auto_generated|mac_mult1~1\ <= \inst_dds|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(1);
\inst_dds|Mult0|auto_generated|mac_mult1~dataout\ <= \inst_dds|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(2);
\inst_dds|Mult0|auto_generated|mac_mult1~DATAOUT1\ <= \inst_dds|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(3);
\inst_dds|Mult0|auto_generated|mac_mult1~DATAOUT2\ <= \inst_dds|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(4);
\inst_dds|Mult0|auto_generated|mac_mult1~DATAOUT3\ <= \inst_dds|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(5);
\inst_dds|Mult0|auto_generated|mac_mult1~DATAOUT4\ <= \inst_dds|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(6);
\inst_dds|Mult0|auto_generated|mac_mult1~DATAOUT5\ <= \inst_dds|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(7);
\inst_dds|Mult0|auto_generated|mac_mult1~DATAOUT6\ <= \inst_dds|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(8);
\inst_dds|Mult0|auto_generated|mac_mult1~DATAOUT7\ <= \inst_dds|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(9);
\inst_dds|Mult0|auto_generated|mac_mult1~DATAOUT8\ <= \inst_dds|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(10);
\inst_dds|Mult0|auto_generated|mac_mult1~DATAOUT9\ <= \inst_dds|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(11);
\inst_dds|Mult0|auto_generated|mac_mult1~DATAOUT10\ <= \inst_dds|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(12);
\inst_dds|Mult0|auto_generated|mac_mult1~DATAOUT11\ <= \inst_dds|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(13);
\inst_dds|Mult0|auto_generated|mac_mult1~DATAOUT12\ <= \inst_dds|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(14);
\inst_dds|Mult0|auto_generated|mac_mult1~DATAOUT13\ <= \inst_dds|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(15);
\inst_dds|Mult0|auto_generated|mac_mult1~DATAOUT14\ <= \inst_dds|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(16);
\inst_dds|Mult0|auto_generated|mac_mult1~DATAOUT15\ <= \inst_dds|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(17);

\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a0_PORTBDATAIN_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & vcc & vcc & vcc & vcc & vcc & vcc & vcc & vcc);

\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\inst_dds|phase_post_offset0\(11) & \inst_dds|phase_post_offset0\(10) & \inst_dds|phase_post_offset0\(9) & \inst_dds|phase_post_offset0\(8) & 
\inst_dds|phase_post_offset0\(7) & \inst_dds|phase_post_offset0\(6) & \inst_dds|phase_post_offset0\(5) & \inst_dds|phase_post_offset0\(4));

\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\ <= (\inst_dds|phase_post_offset1\(11) & \inst_dds|phase_post_offset1\(10) & \inst_dds|phase_post_offset1\(9) & \inst_dds|phase_post_offset1\(8) & 
\inst_dds|phase_post_offset1\(7) & \inst_dds|phase_post_offset1\(6) & \inst_dds|phase_post_offset1\(5) & \inst_dds|phase_post_offset1\(4));

\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a0~portadataout\ <= \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(0);
\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a1\ <= \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(1);
\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a2\ <= \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(2);
\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a3\ <= \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(3);
\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a4\ <= \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(4);
\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a5\ <= \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(5);
\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a6\ <= \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(6);
\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a7\ <= \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\(7);

\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a0~PORTBDATAOUT0\ <= \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(0);
\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a1~PORTBDATAOUT0\ <= \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(1);
\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a2~PORTBDATAOUT0\ <= \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(2);
\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a3~PORTBDATAOUT0\ <= \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(3);
\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a4~PORTBDATAOUT0\ <= \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(4);
\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a5~PORTBDATAOUT0\ <= \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(5);
\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a6~PORTBDATAOUT0\ <= \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(6);
\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a7~PORTBDATAOUT0\ <= \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(7);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\ALT_INV_rst_n~input_o\ <= NOT \rst_n~input_o\;
\inst_dds|ALT_INV_sine_data_post_offset_satured\(7) <= NOT \inst_dds|sine_data_post_offset_satured\(7);

-- Location: IOOBUF_X9_Y29_N9
\dds_output[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_dds|sine_data_post_offset_satured\(0),
	devoe => ww_devoe,
	o => \dds_output[0]~output_o\);

-- Location: IOOBUF_X5_Y29_N2
\dds_output[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_dds|sine_data_post_offset_satured\(1),
	devoe => ww_devoe,
	o => \dds_output[1]~output_o\);

-- Location: IOOBUF_X5_Y29_N16
\dds_output[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_dds|sine_data_post_offset_satured\(2),
	devoe => ww_devoe,
	o => \dds_output[2]~output_o\);

-- Location: IOOBUF_X3_Y29_N2
\dds_output[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_dds|sine_data_post_offset_satured\(3),
	devoe => ww_devoe,
	o => \dds_output[3]~output_o\);

-- Location: IOOBUF_X3_Y29_N9
\dds_output[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_dds|sine_data_post_offset_satured\(4),
	devoe => ww_devoe,
	o => \dds_output[4]~output_o\);

-- Location: IOOBUF_X3_Y29_N30
\dds_output[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_dds|sine_data_post_offset_satured\(5),
	devoe => ww_devoe,
	o => \dds_output[5]~output_o\);

-- Location: IOOBUF_X1_Y29_N2
\dds_output[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_dds|sine_data_post_offset_satured\(6),
	devoe => ww_devoe,
	o => \dds_output[6]~output_o\);

-- Location: IOOBUF_X3_Y29_N16
\dds_output[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_dds|ALT_INV_sine_data_post_offset_satured\(7),
	devoe => ww_devoe,
	o => \dds_output[7]~output_o\);

-- Location: IOIBUF_X21_Y0_N15
\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G19
\clk~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: IOIBUF_X21_Y0_N22
\spi_mosi~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_spi_mosi,
	o => \spi_mosi~input_o\);

-- Location: LCCOMB_X17_Y22_N30
\inst_spi_slave_interface|shift_register[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|shift_register[0]~feeder_combout\ = \spi_mosi~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \spi_mosi~input_o\,
	combout => \inst_spi_slave_interface|shift_register[0]~feeder_combout\);

-- Location: IOIBUF_X11_Y29_N1
\rst_n~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst_n,
	o => \rst_n~input_o\);

-- Location: IOIBUF_X0_Y26_N15
\spi_clock~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_spi_clock,
	o => \spi_clock~input_o\);

-- Location: FF_X12_Y26_N29
\inst_spi_slave_interface|spi_clock_d\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \spi_clock~input_o\,
	clrn => \rst_n~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|spi_clock_d~q\);

-- Location: LCCOMB_X12_Y26_N28
\inst_spi_slave_interface|always0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|always0~0_combout\ = (\spi_clock~input_o\ & !\inst_spi_slave_interface|spi_clock_d~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \spi_clock~input_o\,
	datac => \inst_spi_slave_interface|spi_clock_d~q\,
	combout => \inst_spi_slave_interface|always0~0_combout\);

-- Location: FF_X17_Y22_N31
\inst_spi_slave_interface|shift_register[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|shift_register[0]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|always0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|shift_register\(0));

-- Location: LCCOMB_X17_Y19_N8
\inst_spi_slave_interface|register_gain[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|register_gain[0]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(0),
	combout => \inst_spi_slave_interface|register_gain[0]~feeder_combout\);

-- Location: FF_X17_Y22_N25
\inst_spi_slave_interface|shift_register[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(0),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|always0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|shift_register\(1));

-- Location: FF_X16_Y20_N23
\inst_spi_slave_interface|shift_register[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(1),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|always0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|shift_register\(2));

-- Location: FF_X16_Y20_N17
\inst_spi_slave_interface|shift_register[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(2),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|always0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|shift_register\(3));

-- Location: LCCOMB_X16_Y20_N14
\inst_spi_slave_interface|shift_register[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|shift_register[4]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(3),
	combout => \inst_spi_slave_interface|shift_register[4]~feeder_combout\);

-- Location: FF_X16_Y20_N15
\inst_spi_slave_interface|shift_register[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|shift_register[4]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|always0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|shift_register\(4));

-- Location: FF_X16_Y20_N1
\inst_spi_slave_interface|shift_register[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(4),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|always0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|shift_register\(5));

-- Location: LCCOMB_X16_Y20_N2
\inst_spi_slave_interface|shift_register[6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|shift_register[6]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(5),
	combout => \inst_spi_slave_interface|shift_register[6]~feeder_combout\);

-- Location: FF_X16_Y20_N3
\inst_spi_slave_interface|shift_register[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|shift_register[6]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|always0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|shift_register\(6));

-- Location: LCCOMB_X16_Y20_N4
\inst_spi_slave_interface|shift_register[7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|shift_register[7]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(6),
	combout => \inst_spi_slave_interface|shift_register[7]~feeder_combout\);

-- Location: FF_X16_Y20_N5
\inst_spi_slave_interface|shift_register[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|shift_register[7]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|always0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|shift_register\(7));

-- Location: FF_X16_Y20_N19
\inst_spi_slave_interface|shift_register[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(7),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|always0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|shift_register\(8));

-- Location: LCCOMB_X16_Y20_N28
\inst_spi_slave_interface|shift_register[9]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|shift_register[9]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(8)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(8),
	combout => \inst_spi_slave_interface|shift_register[9]~feeder_combout\);

-- Location: FF_X16_Y20_N29
\inst_spi_slave_interface|shift_register[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|shift_register[9]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|always0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|shift_register\(9));

-- Location: LCCOMB_X16_Y20_N26
\inst_spi_slave_interface|shift_register[10]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|shift_register[10]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(9)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(9),
	combout => \inst_spi_slave_interface|shift_register[10]~feeder_combout\);

-- Location: FF_X16_Y20_N27
\inst_spi_slave_interface|shift_register[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|shift_register[10]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|always0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|shift_register\(10));

-- Location: LCCOMB_X15_Y22_N8
\inst_spi_slave_interface|shift_register[11]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|shift_register[11]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(10)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(10),
	combout => \inst_spi_slave_interface|shift_register[11]~feeder_combout\);

-- Location: FF_X15_Y22_N9
\inst_spi_slave_interface|shift_register[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|shift_register[11]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|always0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|shift_register\(11));

-- Location: FF_X15_Y22_N23
\inst_spi_slave_interface|shift_register[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(11),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|always0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|shift_register\(12));

-- Location: FF_X15_Y22_N13
\inst_spi_slave_interface|shift_register[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(12),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|always0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|shift_register\(13));

-- Location: LCCOMB_X15_Y22_N26
\inst_spi_slave_interface|shift_register[14]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|shift_register[14]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(13)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(13),
	combout => \inst_spi_slave_interface|shift_register[14]~feeder_combout\);

-- Location: FF_X15_Y22_N27
\inst_spi_slave_interface|shift_register[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|shift_register[14]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|always0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|shift_register\(14));

-- Location: FF_X15_Y22_N29
\inst_spi_slave_interface|shift_register[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(14),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|always0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|shift_register\(15));

-- Location: LCCOMB_X15_Y22_N2
\inst_spi_slave_interface|shift_register[16]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|shift_register[16]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(15)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(15),
	combout => \inst_spi_slave_interface|shift_register[16]~feeder_combout\);

-- Location: FF_X15_Y22_N3
\inst_spi_slave_interface|shift_register[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|shift_register[16]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|always0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|shift_register\(16));

-- Location: LCCOMB_X15_Y22_N16
\inst_spi_slave_interface|shift_register[17]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|shift_register[17]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(16)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(16),
	combout => \inst_spi_slave_interface|shift_register[17]~feeder_combout\);

-- Location: FF_X15_Y22_N17
\inst_spi_slave_interface|shift_register[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|shift_register[17]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|always0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|shift_register\(17));

-- Location: LCCOMB_X15_Y22_N30
\inst_spi_slave_interface|shift_register[18]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|shift_register[18]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(17)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(17),
	combout => \inst_spi_slave_interface|shift_register[18]~feeder_combout\);

-- Location: FF_X15_Y22_N31
\inst_spi_slave_interface|shift_register[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|shift_register[18]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|always0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|shift_register\(18));

-- Location: FF_X15_Y22_N1
\inst_spi_slave_interface|shift_register[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(18),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|always0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|shift_register\(19));

-- Location: FF_X14_Y21_N19
\inst_spi_slave_interface|shift_register[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(19),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|always0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|shift_register\(20));

-- Location: LCCOMB_X14_Y21_N30
\inst_spi_slave_interface|shift_register[21]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|shift_register[21]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(20)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(20),
	combout => \inst_spi_slave_interface|shift_register[21]~feeder_combout\);

-- Location: FF_X14_Y21_N31
\inst_spi_slave_interface|shift_register[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|shift_register[21]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|always0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|shift_register\(21));

-- Location: FF_X14_Y21_N25
\inst_spi_slave_interface|shift_register[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(21),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|always0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|shift_register\(22));

-- Location: LCCOMB_X14_Y21_N10
\inst_spi_slave_interface|shift_register[23]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|shift_register[23]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(22)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(22),
	combout => \inst_spi_slave_interface|shift_register[23]~feeder_combout\);

-- Location: FF_X14_Y21_N11
\inst_spi_slave_interface|shift_register[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|shift_register[23]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|always0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|shift_register\(23));

-- Location: LCCOMB_X14_Y21_N12
\inst_spi_slave_interface|shift_register[24]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|shift_register[24]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(23)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(23),
	combout => \inst_spi_slave_interface|shift_register[24]~feeder_combout\);

-- Location: FF_X14_Y21_N13
\inst_spi_slave_interface|shift_register[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|shift_register[24]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|always0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|shift_register\(24));

-- Location: LCCOMB_X14_Y21_N2
\inst_spi_slave_interface|shift_register[25]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|shift_register[25]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(24)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(24),
	combout => \inst_spi_slave_interface|shift_register[25]~feeder_combout\);

-- Location: FF_X14_Y21_N3
\inst_spi_slave_interface|shift_register[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|shift_register[25]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|always0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|shift_register\(25));

-- Location: LCCOMB_X14_Y21_N4
\inst_spi_slave_interface|shift_register[26]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|shift_register[26]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(25)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(25),
	combout => \inst_spi_slave_interface|shift_register[26]~feeder_combout\);

-- Location: FF_X14_Y21_N5
\inst_spi_slave_interface|shift_register[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|shift_register[26]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|always0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|shift_register\(26));

-- Location: FF_X14_Y21_N15
\inst_spi_slave_interface|shift_register[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(26),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|always0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|shift_register\(27));

-- Location: FF_X14_Y21_N29
\inst_spi_slave_interface|shift_register[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(27),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|always0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|shift_register\(28));

-- Location: FF_X14_Y21_N23
\inst_spi_slave_interface|shift_register[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(28),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|always0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|shift_register\(29));

-- Location: FF_X14_Y21_N9
\inst_spi_slave_interface|shift_register[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(29),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|always0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|shift_register\(30));

-- Location: IOIBUF_X5_Y0_N8
\spi_cs_n~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_spi_cs_n,
	o => \spi_cs_n~input_o\);

-- Location: FF_X14_Y21_N21
\inst_spi_slave_interface|shift_register[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(30),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|always0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|shift_register\(31));

-- Location: LCCOMB_X14_Y21_N0
\inst_spi_slave_interface|spi_cs_n_d~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|spi_cs_n_d~0_combout\ = !\spi_cs_n~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \spi_cs_n~input_o\,
	combout => \inst_spi_slave_interface|spi_cs_n_d~0_combout\);

-- Location: FF_X14_Y21_N1
\inst_spi_slave_interface|spi_cs_n_d\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|spi_cs_n_d~0_combout\,
	clrn => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|spi_cs_n_d~q\);

-- Location: LCCOMB_X14_Y21_N20
\inst_spi_slave_interface|Decoder0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|Decoder0~0_combout\ = (\spi_cs_n~input_o\ & (!\inst_spi_slave_interface|shift_register\(31) & \inst_spi_slave_interface|spi_cs_n_d~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \spi_cs_n~input_o\,
	datac => \inst_spi_slave_interface|shift_register\(31),
	datad => \inst_spi_slave_interface|spi_cs_n_d~q\,
	combout => \inst_spi_slave_interface|Decoder0~0_combout\);

-- Location: LCCOMB_X14_Y21_N6
\inst_spi_slave_interface|Decoder0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|Decoder0~2_combout\ = (!\inst_spi_slave_interface|shift_register\(29) & (\inst_spi_slave_interface|shift_register\(28) & (\inst_spi_slave_interface|shift_register\(30) & \inst_spi_slave_interface|Decoder0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_spi_slave_interface|shift_register\(29),
	datab => \inst_spi_slave_interface|shift_register\(28),
	datac => \inst_spi_slave_interface|shift_register\(30),
	datad => \inst_spi_slave_interface|Decoder0~0_combout\,
	combout => \inst_spi_slave_interface|Decoder0~2_combout\);

-- Location: FF_X17_Y19_N9
\inst_spi_slave_interface|register_gain[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|register_gain[0]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|Decoder0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_gain\(0));

-- Location: LCCOMB_X17_Y19_N22
\inst_spi_slave_interface|register_gain[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|register_gain[1]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(1),
	combout => \inst_spi_slave_interface|register_gain[1]~feeder_combout\);

-- Location: FF_X17_Y19_N23
\inst_spi_slave_interface|register_gain[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|register_gain[1]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|Decoder0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_gain\(1));

-- Location: FF_X17_Y19_N29
\inst_spi_slave_interface|register_gain[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(2),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|Decoder0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_gain\(2));

-- Location: FF_X17_Y19_N3
\inst_spi_slave_interface|register_gain[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(3),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|Decoder0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_gain\(3));

-- Location: FF_X17_Y19_N5
\inst_spi_slave_interface|register_gain[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(4),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|Decoder0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_gain\(4));

-- Location: FF_X17_Y19_N15
\inst_spi_slave_interface|register_gain[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(5),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|Decoder0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_gain\(5));

-- Location: FF_X17_Y19_N1
\inst_spi_slave_interface|register_gain[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(6),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|Decoder0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_gain\(6));

-- Location: FF_X17_Y19_N7
\inst_spi_slave_interface|register_gain[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(7),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|Decoder0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_gain\(7));

-- Location: LCCOMB_X14_Y19_N28
\inst_spi_slave_interface|register_freq0[20]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|register_freq0[20]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(20)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(20),
	combout => \inst_spi_slave_interface|register_freq0[20]~feeder_combout\);

-- Location: LCCOMB_X14_Y21_N22
\inst_spi_slave_interface|Decoder0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|Decoder0~5_combout\ = (\inst_spi_slave_interface|shift_register\(28) & (!\inst_spi_slave_interface|shift_register\(30) & (!\inst_spi_slave_interface|shift_register\(29) & \inst_spi_slave_interface|Decoder0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_spi_slave_interface|shift_register\(28),
	datab => \inst_spi_slave_interface|shift_register\(30),
	datac => \inst_spi_slave_interface|shift_register\(29),
	datad => \inst_spi_slave_interface|Decoder0~0_combout\,
	combout => \inst_spi_slave_interface|Decoder0~5_combout\);

-- Location: FF_X14_Y19_N29
\inst_spi_slave_interface|register_freq0[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|register_freq0[20]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq0\(20));

-- Location: FF_X14_Y19_N7
\inst_spi_slave_interface|register_freq0[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(19),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq0\(19));

-- Location: FF_X14_Y19_N13
\inst_spi_slave_interface|register_freq0[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(18),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq0\(18));

-- Location: LCCOMB_X15_Y19_N28
\inst_spi_slave_interface|register_freq0[17]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|register_freq0[17]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(17)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(17),
	combout => \inst_spi_slave_interface|register_freq0[17]~feeder_combout\);

-- Location: FF_X15_Y19_N29
\inst_spi_slave_interface|register_freq0[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|register_freq0[17]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq0\(17));

-- Location: FF_X15_Y18_N1
\inst_spi_slave_interface|register_freq0[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(16),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq0\(16));

-- Location: LCCOMB_X14_Y19_N8
\inst_spi_slave_interface|register_freq0[15]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|register_freq0[15]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(15)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(15),
	combout => \inst_spi_slave_interface|register_freq0[15]~feeder_combout\);

-- Location: FF_X14_Y19_N9
\inst_spi_slave_interface|register_freq0[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|register_freq0[15]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq0\(15));

-- Location: LCCOMB_X14_Y19_N2
\inst_spi_slave_interface|register_freq0[14]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|register_freq0[14]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(14)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(14),
	combout => \inst_spi_slave_interface|register_freq0[14]~feeder_combout\);

-- Location: FF_X14_Y19_N3
\inst_spi_slave_interface|register_freq0[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|register_freq0[14]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq0\(14));

-- Location: FF_X14_Y22_N19
\inst_spi_slave_interface|register_freq0[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(13),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq0\(13));

-- Location: LCCOMB_X15_Y18_N2
\inst_spi_slave_interface|register_freq0[12]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|register_freq0[12]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(12)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(12),
	combout => \inst_spi_slave_interface|register_freq0[12]~feeder_combout\);

-- Location: FF_X15_Y18_N3
\inst_spi_slave_interface|register_freq0[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|register_freq0[12]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq0\(12));

-- Location: LCCOMB_X15_Y20_N0
\inst_spi_slave_interface|register_freq0[11]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|register_freq0[11]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(11)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(11),
	combout => \inst_spi_slave_interface|register_freq0[11]~feeder_combout\);

-- Location: FF_X15_Y20_N1
\inst_spi_slave_interface|register_freq0[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|register_freq0[11]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq0\(11));

-- Location: FF_X16_Y20_N25
\inst_spi_slave_interface|register_freq0[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(10),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq0\(10));

-- Location: LCCOMB_X14_Y19_N4
\inst_spi_slave_interface|register_freq0[9]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|register_freq0[9]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(9)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(9),
	combout => \inst_spi_slave_interface|register_freq0[9]~feeder_combout\);

-- Location: FF_X14_Y19_N5
\inst_spi_slave_interface|register_freq0[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|register_freq0[9]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq0\(9));

-- Location: LCCOMB_X16_Y20_N10
\inst_spi_slave_interface|register_freq0[8]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|register_freq0[8]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(8)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(8),
	combout => \inst_spi_slave_interface|register_freq0[8]~feeder_combout\);

-- Location: FF_X16_Y20_N11
\inst_spi_slave_interface|register_freq0[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|register_freq0[8]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq0\(8));

-- Location: FF_X16_Y20_N21
\inst_spi_slave_interface|register_freq0[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(7),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq0\(7));

-- Location: LCCOMB_X16_Y20_N30
\inst_spi_slave_interface|register_freq0[6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|register_freq0[6]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(6),
	combout => \inst_spi_slave_interface|register_freq0[6]~feeder_combout\);

-- Location: FF_X16_Y20_N31
\inst_spi_slave_interface|register_freq0[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|register_freq0[6]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq0\(6));

-- Location: LCCOMB_X16_Y20_N8
\inst_spi_slave_interface|register_freq0[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|register_freq0[5]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(5),
	combout => \inst_spi_slave_interface|register_freq0[5]~feeder_combout\);

-- Location: FF_X16_Y20_N9
\inst_spi_slave_interface|register_freq0[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|register_freq0[5]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq0\(5));

-- Location: LCCOMB_X15_Y20_N2
\inst_spi_slave_interface|register_freq0[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|register_freq0[4]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst_spi_slave_interface|shift_register\(4),
	combout => \inst_spi_slave_interface|register_freq0[4]~feeder_combout\);

-- Location: FF_X15_Y20_N3
\inst_spi_slave_interface|register_freq0[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|register_freq0[4]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq0\(4));

-- Location: LCCOMB_X15_Y19_N30
\inst_spi_slave_interface|register_freq0[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|register_freq0[3]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(3),
	combout => \inst_spi_slave_interface|register_freq0[3]~feeder_combout\);

-- Location: FF_X15_Y19_N31
\inst_spi_slave_interface|register_freq0[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|register_freq0[3]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq0\(3));

-- Location: FF_X16_Y20_N7
\inst_spi_slave_interface|register_freq0[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(2),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq0\(2));

-- Location: FF_X16_Y20_N13
\inst_spi_slave_interface|register_freq0[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(1),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq0\(1));

-- Location: LCCOMB_X15_Y21_N28
\inst_spi_slave_interface|register_freq0[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|register_freq0[0]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(0),
	combout => \inst_spi_slave_interface|register_freq0[0]~feeder_combout\);

-- Location: FF_X15_Y21_N29
\inst_spi_slave_interface|register_freq0[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|register_freq0[0]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq0\(0));

-- Location: LCCOMB_X15_Y20_N4
\inst_dds|phase_accumulator0[0]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator0[0]~28_combout\ = (\inst_spi_slave_interface|register_freq0\(0) & (\inst_dds|phase_accumulator0\(0) $ (VCC))) # (!\inst_spi_slave_interface|register_freq0\(0) & (\inst_dds|phase_accumulator0\(0) & VCC))
-- \inst_dds|phase_accumulator0[0]~29\ = CARRY((\inst_spi_slave_interface|register_freq0\(0) & \inst_dds|phase_accumulator0\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_spi_slave_interface|register_freq0\(0),
	datab => \inst_dds|phase_accumulator0\(0),
	datad => VCC,
	combout => \inst_dds|phase_accumulator0[0]~28_combout\,
	cout => \inst_dds|phase_accumulator0[0]~29\);

-- Location: FF_X15_Y20_N5
\inst_dds|phase_accumulator0[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator0[0]~28_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator0\(0));

-- Location: LCCOMB_X15_Y20_N6
\inst_dds|phase_accumulator0[1]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator0[1]~30_combout\ = (\inst_dds|phase_accumulator0\(1) & ((\inst_spi_slave_interface|register_freq0\(1) & (\inst_dds|phase_accumulator0[0]~29\ & VCC)) # (!\inst_spi_slave_interface|register_freq0\(1) & 
-- (!\inst_dds|phase_accumulator0[0]~29\)))) # (!\inst_dds|phase_accumulator0\(1) & ((\inst_spi_slave_interface|register_freq0\(1) & (!\inst_dds|phase_accumulator0[0]~29\)) # (!\inst_spi_slave_interface|register_freq0\(1) & 
-- ((\inst_dds|phase_accumulator0[0]~29\) # (GND)))))
-- \inst_dds|phase_accumulator0[1]~31\ = CARRY((\inst_dds|phase_accumulator0\(1) & (!\inst_spi_slave_interface|register_freq0\(1) & !\inst_dds|phase_accumulator0[0]~29\)) # (!\inst_dds|phase_accumulator0\(1) & ((!\inst_dds|phase_accumulator0[0]~29\) # 
-- (!\inst_spi_slave_interface|register_freq0\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|phase_accumulator0\(1),
	datab => \inst_spi_slave_interface|register_freq0\(1),
	datad => VCC,
	cin => \inst_dds|phase_accumulator0[0]~29\,
	combout => \inst_dds|phase_accumulator0[1]~30_combout\,
	cout => \inst_dds|phase_accumulator0[1]~31\);

-- Location: FF_X15_Y20_N7
\inst_dds|phase_accumulator0[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator0[1]~30_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator0\(1));

-- Location: LCCOMB_X15_Y20_N8
\inst_dds|phase_accumulator0[2]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator0[2]~32_combout\ = ((\inst_spi_slave_interface|register_freq0\(2) $ (\inst_dds|phase_accumulator0\(2) $ (!\inst_dds|phase_accumulator0[1]~31\)))) # (GND)
-- \inst_dds|phase_accumulator0[2]~33\ = CARRY((\inst_spi_slave_interface|register_freq0\(2) & ((\inst_dds|phase_accumulator0\(2)) # (!\inst_dds|phase_accumulator0[1]~31\))) # (!\inst_spi_slave_interface|register_freq0\(2) & (\inst_dds|phase_accumulator0\(2) 
-- & !\inst_dds|phase_accumulator0[1]~31\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_spi_slave_interface|register_freq0\(2),
	datab => \inst_dds|phase_accumulator0\(2),
	datad => VCC,
	cin => \inst_dds|phase_accumulator0[1]~31\,
	combout => \inst_dds|phase_accumulator0[2]~32_combout\,
	cout => \inst_dds|phase_accumulator0[2]~33\);

-- Location: FF_X15_Y20_N9
\inst_dds|phase_accumulator0[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator0[2]~32_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator0\(2));

-- Location: LCCOMB_X15_Y20_N10
\inst_dds|phase_accumulator0[3]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator0[3]~34_combout\ = (\inst_dds|phase_accumulator0\(3) & ((\inst_spi_slave_interface|register_freq0\(3) & (\inst_dds|phase_accumulator0[2]~33\ & VCC)) # (!\inst_spi_slave_interface|register_freq0\(3) & 
-- (!\inst_dds|phase_accumulator0[2]~33\)))) # (!\inst_dds|phase_accumulator0\(3) & ((\inst_spi_slave_interface|register_freq0\(3) & (!\inst_dds|phase_accumulator0[2]~33\)) # (!\inst_spi_slave_interface|register_freq0\(3) & 
-- ((\inst_dds|phase_accumulator0[2]~33\) # (GND)))))
-- \inst_dds|phase_accumulator0[3]~35\ = CARRY((\inst_dds|phase_accumulator0\(3) & (!\inst_spi_slave_interface|register_freq0\(3) & !\inst_dds|phase_accumulator0[2]~33\)) # (!\inst_dds|phase_accumulator0\(3) & ((!\inst_dds|phase_accumulator0[2]~33\) # 
-- (!\inst_spi_slave_interface|register_freq0\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|phase_accumulator0\(3),
	datab => \inst_spi_slave_interface|register_freq0\(3),
	datad => VCC,
	cin => \inst_dds|phase_accumulator0[2]~33\,
	combout => \inst_dds|phase_accumulator0[3]~34_combout\,
	cout => \inst_dds|phase_accumulator0[3]~35\);

-- Location: FF_X15_Y20_N11
\inst_dds|phase_accumulator0[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator0[3]~34_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator0\(3));

-- Location: LCCOMB_X15_Y20_N12
\inst_dds|phase_accumulator0[4]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator0[4]~36_combout\ = ((\inst_dds|phase_accumulator0\(4) $ (\inst_spi_slave_interface|register_freq0\(4) $ (!\inst_dds|phase_accumulator0[3]~35\)))) # (GND)
-- \inst_dds|phase_accumulator0[4]~37\ = CARRY((\inst_dds|phase_accumulator0\(4) & ((\inst_spi_slave_interface|register_freq0\(4)) # (!\inst_dds|phase_accumulator0[3]~35\))) # (!\inst_dds|phase_accumulator0\(4) & (\inst_spi_slave_interface|register_freq0\(4) 
-- & !\inst_dds|phase_accumulator0[3]~35\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|phase_accumulator0\(4),
	datab => \inst_spi_slave_interface|register_freq0\(4),
	datad => VCC,
	cin => \inst_dds|phase_accumulator0[3]~35\,
	combout => \inst_dds|phase_accumulator0[4]~36_combout\,
	cout => \inst_dds|phase_accumulator0[4]~37\);

-- Location: FF_X15_Y20_N13
\inst_dds|phase_accumulator0[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator0[4]~36_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator0\(4));

-- Location: LCCOMB_X15_Y20_N14
\inst_dds|phase_accumulator0[5]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator0[5]~38_combout\ = (\inst_dds|phase_accumulator0\(5) & ((\inst_spi_slave_interface|register_freq0\(5) & (\inst_dds|phase_accumulator0[4]~37\ & VCC)) # (!\inst_spi_slave_interface|register_freq0\(5) & 
-- (!\inst_dds|phase_accumulator0[4]~37\)))) # (!\inst_dds|phase_accumulator0\(5) & ((\inst_spi_slave_interface|register_freq0\(5) & (!\inst_dds|phase_accumulator0[4]~37\)) # (!\inst_spi_slave_interface|register_freq0\(5) & 
-- ((\inst_dds|phase_accumulator0[4]~37\) # (GND)))))
-- \inst_dds|phase_accumulator0[5]~39\ = CARRY((\inst_dds|phase_accumulator0\(5) & (!\inst_spi_slave_interface|register_freq0\(5) & !\inst_dds|phase_accumulator0[4]~37\)) # (!\inst_dds|phase_accumulator0\(5) & ((!\inst_dds|phase_accumulator0[4]~37\) # 
-- (!\inst_spi_slave_interface|register_freq0\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|phase_accumulator0\(5),
	datab => \inst_spi_slave_interface|register_freq0\(5),
	datad => VCC,
	cin => \inst_dds|phase_accumulator0[4]~37\,
	combout => \inst_dds|phase_accumulator0[5]~38_combout\,
	cout => \inst_dds|phase_accumulator0[5]~39\);

-- Location: FF_X15_Y20_N15
\inst_dds|phase_accumulator0[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator0[5]~38_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator0\(5));

-- Location: LCCOMB_X15_Y20_N16
\inst_dds|phase_accumulator0[6]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator0[6]~40_combout\ = ((\inst_spi_slave_interface|register_freq0\(6) $ (\inst_dds|phase_accumulator0\(6) $ (!\inst_dds|phase_accumulator0[5]~39\)))) # (GND)
-- \inst_dds|phase_accumulator0[6]~41\ = CARRY((\inst_spi_slave_interface|register_freq0\(6) & ((\inst_dds|phase_accumulator0\(6)) # (!\inst_dds|phase_accumulator0[5]~39\))) # (!\inst_spi_slave_interface|register_freq0\(6) & (\inst_dds|phase_accumulator0\(6) 
-- & !\inst_dds|phase_accumulator0[5]~39\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_spi_slave_interface|register_freq0\(6),
	datab => \inst_dds|phase_accumulator0\(6),
	datad => VCC,
	cin => \inst_dds|phase_accumulator0[5]~39\,
	combout => \inst_dds|phase_accumulator0[6]~40_combout\,
	cout => \inst_dds|phase_accumulator0[6]~41\);

-- Location: FF_X15_Y20_N17
\inst_dds|phase_accumulator0[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator0[6]~40_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator0\(6));

-- Location: LCCOMB_X15_Y20_N18
\inst_dds|phase_accumulator0[7]~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator0[7]~42_combout\ = (\inst_spi_slave_interface|register_freq0\(7) & ((\inst_dds|phase_accumulator0\(7) & (\inst_dds|phase_accumulator0[6]~41\ & VCC)) # (!\inst_dds|phase_accumulator0\(7) & 
-- (!\inst_dds|phase_accumulator0[6]~41\)))) # (!\inst_spi_slave_interface|register_freq0\(7) & ((\inst_dds|phase_accumulator0\(7) & (!\inst_dds|phase_accumulator0[6]~41\)) # (!\inst_dds|phase_accumulator0\(7) & ((\inst_dds|phase_accumulator0[6]~41\) # 
-- (GND)))))
-- \inst_dds|phase_accumulator0[7]~43\ = CARRY((\inst_spi_slave_interface|register_freq0\(7) & (!\inst_dds|phase_accumulator0\(7) & !\inst_dds|phase_accumulator0[6]~41\)) # (!\inst_spi_slave_interface|register_freq0\(7) & 
-- ((!\inst_dds|phase_accumulator0[6]~41\) # (!\inst_dds|phase_accumulator0\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_spi_slave_interface|register_freq0\(7),
	datab => \inst_dds|phase_accumulator0\(7),
	datad => VCC,
	cin => \inst_dds|phase_accumulator0[6]~41\,
	combout => \inst_dds|phase_accumulator0[7]~42_combout\,
	cout => \inst_dds|phase_accumulator0[7]~43\);

-- Location: FF_X15_Y20_N19
\inst_dds|phase_accumulator0[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator0[7]~42_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator0\(7));

-- Location: LCCOMB_X15_Y20_N20
\inst_dds|phase_accumulator0[8]~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator0[8]~44_combout\ = ((\inst_dds|phase_accumulator0\(8) $ (\inst_spi_slave_interface|register_freq0\(8) $ (!\inst_dds|phase_accumulator0[7]~43\)))) # (GND)
-- \inst_dds|phase_accumulator0[8]~45\ = CARRY((\inst_dds|phase_accumulator0\(8) & ((\inst_spi_slave_interface|register_freq0\(8)) # (!\inst_dds|phase_accumulator0[7]~43\))) # (!\inst_dds|phase_accumulator0\(8) & (\inst_spi_slave_interface|register_freq0\(8) 
-- & !\inst_dds|phase_accumulator0[7]~43\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|phase_accumulator0\(8),
	datab => \inst_spi_slave_interface|register_freq0\(8),
	datad => VCC,
	cin => \inst_dds|phase_accumulator0[7]~43\,
	combout => \inst_dds|phase_accumulator0[8]~44_combout\,
	cout => \inst_dds|phase_accumulator0[8]~45\);

-- Location: FF_X15_Y20_N21
\inst_dds|phase_accumulator0[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator0[8]~44_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator0\(8));

-- Location: LCCOMB_X15_Y20_N22
\inst_dds|phase_accumulator0[9]~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator0[9]~46_combout\ = (\inst_dds|phase_accumulator0\(9) & ((\inst_spi_slave_interface|register_freq0\(9) & (\inst_dds|phase_accumulator0[8]~45\ & VCC)) # (!\inst_spi_slave_interface|register_freq0\(9) & 
-- (!\inst_dds|phase_accumulator0[8]~45\)))) # (!\inst_dds|phase_accumulator0\(9) & ((\inst_spi_slave_interface|register_freq0\(9) & (!\inst_dds|phase_accumulator0[8]~45\)) # (!\inst_spi_slave_interface|register_freq0\(9) & 
-- ((\inst_dds|phase_accumulator0[8]~45\) # (GND)))))
-- \inst_dds|phase_accumulator0[9]~47\ = CARRY((\inst_dds|phase_accumulator0\(9) & (!\inst_spi_slave_interface|register_freq0\(9) & !\inst_dds|phase_accumulator0[8]~45\)) # (!\inst_dds|phase_accumulator0\(9) & ((!\inst_dds|phase_accumulator0[8]~45\) # 
-- (!\inst_spi_slave_interface|register_freq0\(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|phase_accumulator0\(9),
	datab => \inst_spi_slave_interface|register_freq0\(9),
	datad => VCC,
	cin => \inst_dds|phase_accumulator0[8]~45\,
	combout => \inst_dds|phase_accumulator0[9]~46_combout\,
	cout => \inst_dds|phase_accumulator0[9]~47\);

-- Location: FF_X15_Y20_N23
\inst_dds|phase_accumulator0[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator0[9]~46_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator0\(9));

-- Location: LCCOMB_X15_Y20_N24
\inst_dds|phase_accumulator0[10]~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator0[10]~48_combout\ = ((\inst_dds|phase_accumulator0\(10) $ (\inst_spi_slave_interface|register_freq0\(10) $ (!\inst_dds|phase_accumulator0[9]~47\)))) # (GND)
-- \inst_dds|phase_accumulator0[10]~49\ = CARRY((\inst_dds|phase_accumulator0\(10) & ((\inst_spi_slave_interface|register_freq0\(10)) # (!\inst_dds|phase_accumulator0[9]~47\))) # (!\inst_dds|phase_accumulator0\(10) & 
-- (\inst_spi_slave_interface|register_freq0\(10) & !\inst_dds|phase_accumulator0[9]~47\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|phase_accumulator0\(10),
	datab => \inst_spi_slave_interface|register_freq0\(10),
	datad => VCC,
	cin => \inst_dds|phase_accumulator0[9]~47\,
	combout => \inst_dds|phase_accumulator0[10]~48_combout\,
	cout => \inst_dds|phase_accumulator0[10]~49\);

-- Location: FF_X15_Y20_N25
\inst_dds|phase_accumulator0[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator0[10]~48_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator0\(10));

-- Location: LCCOMB_X15_Y20_N26
\inst_dds|phase_accumulator0[11]~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator0[11]~50_combout\ = (\inst_dds|phase_accumulator0\(11) & ((\inst_spi_slave_interface|register_freq0\(11) & (\inst_dds|phase_accumulator0[10]~49\ & VCC)) # (!\inst_spi_slave_interface|register_freq0\(11) & 
-- (!\inst_dds|phase_accumulator0[10]~49\)))) # (!\inst_dds|phase_accumulator0\(11) & ((\inst_spi_slave_interface|register_freq0\(11) & (!\inst_dds|phase_accumulator0[10]~49\)) # (!\inst_spi_slave_interface|register_freq0\(11) & 
-- ((\inst_dds|phase_accumulator0[10]~49\) # (GND)))))
-- \inst_dds|phase_accumulator0[11]~51\ = CARRY((\inst_dds|phase_accumulator0\(11) & (!\inst_spi_slave_interface|register_freq0\(11) & !\inst_dds|phase_accumulator0[10]~49\)) # (!\inst_dds|phase_accumulator0\(11) & ((!\inst_dds|phase_accumulator0[10]~49\) # 
-- (!\inst_spi_slave_interface|register_freq0\(11)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|phase_accumulator0\(11),
	datab => \inst_spi_slave_interface|register_freq0\(11),
	datad => VCC,
	cin => \inst_dds|phase_accumulator0[10]~49\,
	combout => \inst_dds|phase_accumulator0[11]~50_combout\,
	cout => \inst_dds|phase_accumulator0[11]~51\);

-- Location: FF_X15_Y20_N27
\inst_dds|phase_accumulator0[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator0[11]~50_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator0\(11));

-- Location: LCCOMB_X15_Y20_N28
\inst_dds|phase_accumulator0[12]~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator0[12]~52_combout\ = ((\inst_spi_slave_interface|register_freq0\(12) $ (\inst_dds|phase_accumulator0\(12) $ (!\inst_dds|phase_accumulator0[11]~51\)))) # (GND)
-- \inst_dds|phase_accumulator0[12]~53\ = CARRY((\inst_spi_slave_interface|register_freq0\(12) & ((\inst_dds|phase_accumulator0\(12)) # (!\inst_dds|phase_accumulator0[11]~51\))) # (!\inst_spi_slave_interface|register_freq0\(12) & 
-- (\inst_dds|phase_accumulator0\(12) & !\inst_dds|phase_accumulator0[11]~51\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_spi_slave_interface|register_freq0\(12),
	datab => \inst_dds|phase_accumulator0\(12),
	datad => VCC,
	cin => \inst_dds|phase_accumulator0[11]~51\,
	combout => \inst_dds|phase_accumulator0[12]~52_combout\,
	cout => \inst_dds|phase_accumulator0[12]~53\);

-- Location: FF_X15_Y20_N29
\inst_dds|phase_accumulator0[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator0[12]~52_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator0\(12));

-- Location: LCCOMB_X15_Y20_N30
\inst_dds|phase_accumulator0[13]~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator0[13]~54_combout\ = (\inst_dds|phase_accumulator0\(13) & ((\inst_spi_slave_interface|register_freq0\(13) & (\inst_dds|phase_accumulator0[12]~53\ & VCC)) # (!\inst_spi_slave_interface|register_freq0\(13) & 
-- (!\inst_dds|phase_accumulator0[12]~53\)))) # (!\inst_dds|phase_accumulator0\(13) & ((\inst_spi_slave_interface|register_freq0\(13) & (!\inst_dds|phase_accumulator0[12]~53\)) # (!\inst_spi_slave_interface|register_freq0\(13) & 
-- ((\inst_dds|phase_accumulator0[12]~53\) # (GND)))))
-- \inst_dds|phase_accumulator0[13]~55\ = CARRY((\inst_dds|phase_accumulator0\(13) & (!\inst_spi_slave_interface|register_freq0\(13) & !\inst_dds|phase_accumulator0[12]~53\)) # (!\inst_dds|phase_accumulator0\(13) & ((!\inst_dds|phase_accumulator0[12]~53\) # 
-- (!\inst_spi_slave_interface|register_freq0\(13)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|phase_accumulator0\(13),
	datab => \inst_spi_slave_interface|register_freq0\(13),
	datad => VCC,
	cin => \inst_dds|phase_accumulator0[12]~53\,
	combout => \inst_dds|phase_accumulator0[13]~54_combout\,
	cout => \inst_dds|phase_accumulator0[13]~55\);

-- Location: FF_X15_Y20_N31
\inst_dds|phase_accumulator0[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator0[13]~54_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator0\(13));

-- Location: LCCOMB_X15_Y19_N0
\inst_dds|phase_accumulator0[14]~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator0[14]~56_combout\ = ((\inst_spi_slave_interface|register_freq0\(14) $ (\inst_dds|phase_accumulator0\(14) $ (!\inst_dds|phase_accumulator0[13]~55\)))) # (GND)
-- \inst_dds|phase_accumulator0[14]~57\ = CARRY((\inst_spi_slave_interface|register_freq0\(14) & ((\inst_dds|phase_accumulator0\(14)) # (!\inst_dds|phase_accumulator0[13]~55\))) # (!\inst_spi_slave_interface|register_freq0\(14) & 
-- (\inst_dds|phase_accumulator0\(14) & !\inst_dds|phase_accumulator0[13]~55\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_spi_slave_interface|register_freq0\(14),
	datab => \inst_dds|phase_accumulator0\(14),
	datad => VCC,
	cin => \inst_dds|phase_accumulator0[13]~55\,
	combout => \inst_dds|phase_accumulator0[14]~56_combout\,
	cout => \inst_dds|phase_accumulator0[14]~57\);

-- Location: FF_X15_Y19_N1
\inst_dds|phase_accumulator0[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator0[14]~56_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator0\(14));

-- Location: LCCOMB_X15_Y19_N2
\inst_dds|phase_accumulator0[15]~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator0[15]~58_combout\ = (\inst_spi_slave_interface|register_freq0\(15) & ((\inst_dds|phase_accumulator0\(15) & (\inst_dds|phase_accumulator0[14]~57\ & VCC)) # (!\inst_dds|phase_accumulator0\(15) & 
-- (!\inst_dds|phase_accumulator0[14]~57\)))) # (!\inst_spi_slave_interface|register_freq0\(15) & ((\inst_dds|phase_accumulator0\(15) & (!\inst_dds|phase_accumulator0[14]~57\)) # (!\inst_dds|phase_accumulator0\(15) & ((\inst_dds|phase_accumulator0[14]~57\) # 
-- (GND)))))
-- \inst_dds|phase_accumulator0[15]~59\ = CARRY((\inst_spi_slave_interface|register_freq0\(15) & (!\inst_dds|phase_accumulator0\(15) & !\inst_dds|phase_accumulator0[14]~57\)) # (!\inst_spi_slave_interface|register_freq0\(15) & 
-- ((!\inst_dds|phase_accumulator0[14]~57\) # (!\inst_dds|phase_accumulator0\(15)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_spi_slave_interface|register_freq0\(15),
	datab => \inst_dds|phase_accumulator0\(15),
	datad => VCC,
	cin => \inst_dds|phase_accumulator0[14]~57\,
	combout => \inst_dds|phase_accumulator0[15]~58_combout\,
	cout => \inst_dds|phase_accumulator0[15]~59\);

-- Location: FF_X15_Y19_N3
\inst_dds|phase_accumulator0[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator0[15]~58_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator0\(15));

-- Location: LCCOMB_X15_Y19_N4
\inst_dds|phase_accumulator0[16]~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator0[16]~60_combout\ = ((\inst_dds|phase_accumulator0\(16) $ (\inst_spi_slave_interface|register_freq0\(16) $ (!\inst_dds|phase_accumulator0[15]~59\)))) # (GND)
-- \inst_dds|phase_accumulator0[16]~61\ = CARRY((\inst_dds|phase_accumulator0\(16) & ((\inst_spi_slave_interface|register_freq0\(16)) # (!\inst_dds|phase_accumulator0[15]~59\))) # (!\inst_dds|phase_accumulator0\(16) & 
-- (\inst_spi_slave_interface|register_freq0\(16) & !\inst_dds|phase_accumulator0[15]~59\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|phase_accumulator0\(16),
	datab => \inst_spi_slave_interface|register_freq0\(16),
	datad => VCC,
	cin => \inst_dds|phase_accumulator0[15]~59\,
	combout => \inst_dds|phase_accumulator0[16]~60_combout\,
	cout => \inst_dds|phase_accumulator0[16]~61\);

-- Location: FF_X15_Y19_N5
\inst_dds|phase_accumulator0[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator0[16]~60_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator0\(16));

-- Location: LCCOMB_X15_Y19_N6
\inst_dds|phase_accumulator0[17]~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator0[17]~62_combout\ = (\inst_dds|phase_accumulator0\(17) & ((\inst_spi_slave_interface|register_freq0\(17) & (\inst_dds|phase_accumulator0[16]~61\ & VCC)) # (!\inst_spi_slave_interface|register_freq0\(17) & 
-- (!\inst_dds|phase_accumulator0[16]~61\)))) # (!\inst_dds|phase_accumulator0\(17) & ((\inst_spi_slave_interface|register_freq0\(17) & (!\inst_dds|phase_accumulator0[16]~61\)) # (!\inst_spi_slave_interface|register_freq0\(17) & 
-- ((\inst_dds|phase_accumulator0[16]~61\) # (GND)))))
-- \inst_dds|phase_accumulator0[17]~63\ = CARRY((\inst_dds|phase_accumulator0\(17) & (!\inst_spi_slave_interface|register_freq0\(17) & !\inst_dds|phase_accumulator0[16]~61\)) # (!\inst_dds|phase_accumulator0\(17) & ((!\inst_dds|phase_accumulator0[16]~61\) # 
-- (!\inst_spi_slave_interface|register_freq0\(17)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|phase_accumulator0\(17),
	datab => \inst_spi_slave_interface|register_freq0\(17),
	datad => VCC,
	cin => \inst_dds|phase_accumulator0[16]~61\,
	combout => \inst_dds|phase_accumulator0[17]~62_combout\,
	cout => \inst_dds|phase_accumulator0[17]~63\);

-- Location: FF_X15_Y19_N7
\inst_dds|phase_accumulator0[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator0[17]~62_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator0\(17));

-- Location: LCCOMB_X15_Y19_N8
\inst_dds|phase_accumulator0[18]~64\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator0[18]~64_combout\ = ((\inst_spi_slave_interface|register_freq0\(18) $ (\inst_dds|phase_accumulator0\(18) $ (!\inst_dds|phase_accumulator0[17]~63\)))) # (GND)
-- \inst_dds|phase_accumulator0[18]~65\ = CARRY((\inst_spi_slave_interface|register_freq0\(18) & ((\inst_dds|phase_accumulator0\(18)) # (!\inst_dds|phase_accumulator0[17]~63\))) # (!\inst_spi_slave_interface|register_freq0\(18) & 
-- (\inst_dds|phase_accumulator0\(18) & !\inst_dds|phase_accumulator0[17]~63\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_spi_slave_interface|register_freq0\(18),
	datab => \inst_dds|phase_accumulator0\(18),
	datad => VCC,
	cin => \inst_dds|phase_accumulator0[17]~63\,
	combout => \inst_dds|phase_accumulator0[18]~64_combout\,
	cout => \inst_dds|phase_accumulator0[18]~65\);

-- Location: FF_X15_Y19_N9
\inst_dds|phase_accumulator0[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator0[18]~64_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator0\(18));

-- Location: LCCOMB_X15_Y19_N10
\inst_dds|phase_accumulator0[19]~66\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator0[19]~66_combout\ = (\inst_dds|phase_accumulator0\(19) & ((\inst_spi_slave_interface|register_freq0\(19) & (\inst_dds|phase_accumulator0[18]~65\ & VCC)) # (!\inst_spi_slave_interface|register_freq0\(19) & 
-- (!\inst_dds|phase_accumulator0[18]~65\)))) # (!\inst_dds|phase_accumulator0\(19) & ((\inst_spi_slave_interface|register_freq0\(19) & (!\inst_dds|phase_accumulator0[18]~65\)) # (!\inst_spi_slave_interface|register_freq0\(19) & 
-- ((\inst_dds|phase_accumulator0[18]~65\) # (GND)))))
-- \inst_dds|phase_accumulator0[19]~67\ = CARRY((\inst_dds|phase_accumulator0\(19) & (!\inst_spi_slave_interface|register_freq0\(19) & !\inst_dds|phase_accumulator0[18]~65\)) # (!\inst_dds|phase_accumulator0\(19) & ((!\inst_dds|phase_accumulator0[18]~65\) # 
-- (!\inst_spi_slave_interface|register_freq0\(19)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|phase_accumulator0\(19),
	datab => \inst_spi_slave_interface|register_freq0\(19),
	datad => VCC,
	cin => \inst_dds|phase_accumulator0[18]~65\,
	combout => \inst_dds|phase_accumulator0[19]~66_combout\,
	cout => \inst_dds|phase_accumulator0[19]~67\);

-- Location: FF_X15_Y19_N11
\inst_dds|phase_accumulator0[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator0[19]~66_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator0\(19));

-- Location: LCCOMB_X15_Y19_N12
\inst_dds|phase_accumulator0[20]~68\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator0[20]~68_combout\ = ((\inst_dds|phase_accumulator0\(20) $ (\inst_spi_slave_interface|register_freq0\(20) $ (!\inst_dds|phase_accumulator0[19]~67\)))) # (GND)
-- \inst_dds|phase_accumulator0[20]~69\ = CARRY((\inst_dds|phase_accumulator0\(20) & ((\inst_spi_slave_interface|register_freq0\(20)) # (!\inst_dds|phase_accumulator0[19]~67\))) # (!\inst_dds|phase_accumulator0\(20) & 
-- (\inst_spi_slave_interface|register_freq0\(20) & !\inst_dds|phase_accumulator0[19]~67\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|phase_accumulator0\(20),
	datab => \inst_spi_slave_interface|register_freq0\(20),
	datad => VCC,
	cin => \inst_dds|phase_accumulator0[19]~67\,
	combout => \inst_dds|phase_accumulator0[20]~68_combout\,
	cout => \inst_dds|phase_accumulator0[20]~69\);

-- Location: FF_X15_Y19_N13
\inst_dds|phase_accumulator0[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator0[20]~68_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator0\(20));

-- Location: LCCOMB_X17_Y20_N24
\inst_spi_slave_interface|register_phase0[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|register_phase0[4]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(4),
	combout => \inst_spi_slave_interface|register_phase0[4]~feeder_combout\);

-- Location: LCCOMB_X14_Y21_N8
\inst_spi_slave_interface|Decoder0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|Decoder0~3_combout\ = (\inst_spi_slave_interface|shift_register\(29) & (\inst_spi_slave_interface|shift_register\(28) & (!\inst_spi_slave_interface|shift_register\(30) & \inst_spi_slave_interface|Decoder0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_spi_slave_interface|shift_register\(29),
	datab => \inst_spi_slave_interface|shift_register\(28),
	datac => \inst_spi_slave_interface|shift_register\(30),
	datad => \inst_spi_slave_interface|Decoder0~0_combout\,
	combout => \inst_spi_slave_interface|Decoder0~3_combout\);

-- Location: FF_X17_Y20_N25
\inst_spi_slave_interface|register_phase0[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|register_phase0[4]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|Decoder0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_phase0\(4));

-- Location: FF_X16_Y19_N13
\inst_spi_slave_interface|register_phase0[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(3),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|Decoder0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_phase0\(3));

-- Location: FF_X16_Y19_N11
\inst_spi_slave_interface|register_phase0[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(2),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|Decoder0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_phase0\(2));

-- Location: LCCOMB_X16_Y19_N0
\inst_spi_slave_interface|register_phase0[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|register_phase0[1]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(1),
	combout => \inst_spi_slave_interface|register_phase0[1]~feeder_combout\);

-- Location: FF_X16_Y19_N1
\inst_spi_slave_interface|register_phase0[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|register_phase0[1]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|Decoder0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_phase0\(1));

-- Location: LCCOMB_X16_Y19_N30
\inst_spi_slave_interface|register_phase0[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|register_phase0[0]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(0),
	combout => \inst_spi_slave_interface|register_phase0[0]~feeder_combout\);

-- Location: FF_X16_Y19_N31
\inst_spi_slave_interface|register_phase0[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|register_phase0[0]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|Decoder0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_phase0\(0));

-- Location: LCCOMB_X16_Y19_N6
\inst_dds|phase_post_offset0[4]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_post_offset0[4]~9_cout\ = CARRY((\inst_spi_slave_interface|register_phase0\(0) & \inst_dds|phase_accumulator0\(16)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_spi_slave_interface|register_phase0\(0),
	datab => \inst_dds|phase_accumulator0\(16),
	datad => VCC,
	cout => \inst_dds|phase_post_offset0[4]~9_cout\);

-- Location: LCCOMB_X16_Y19_N8
\inst_dds|phase_post_offset0[4]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_post_offset0[4]~11_cout\ = CARRY((\inst_dds|phase_accumulator0\(17) & (!\inst_spi_slave_interface|register_phase0\(1) & !\inst_dds|phase_post_offset0[4]~9_cout\)) # (!\inst_dds|phase_accumulator0\(17) & 
-- ((!\inst_dds|phase_post_offset0[4]~9_cout\) # (!\inst_spi_slave_interface|register_phase0\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|phase_accumulator0\(17),
	datab => \inst_spi_slave_interface|register_phase0\(1),
	datad => VCC,
	cin => \inst_dds|phase_post_offset0[4]~9_cout\,
	cout => \inst_dds|phase_post_offset0[4]~11_cout\);

-- Location: LCCOMB_X16_Y19_N10
\inst_dds|phase_post_offset0[4]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_post_offset0[4]~13_cout\ = CARRY((\inst_dds|phase_accumulator0\(18) & ((\inst_spi_slave_interface|register_phase0\(2)) # (!\inst_dds|phase_post_offset0[4]~11_cout\))) # (!\inst_dds|phase_accumulator0\(18) & 
-- (\inst_spi_slave_interface|register_phase0\(2) & !\inst_dds|phase_post_offset0[4]~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|phase_accumulator0\(18),
	datab => \inst_spi_slave_interface|register_phase0\(2),
	datad => VCC,
	cin => \inst_dds|phase_post_offset0[4]~11_cout\,
	cout => \inst_dds|phase_post_offset0[4]~13_cout\);

-- Location: LCCOMB_X16_Y19_N12
\inst_dds|phase_post_offset0[4]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_post_offset0[4]~15_cout\ = CARRY((\inst_dds|phase_accumulator0\(19) & (!\inst_spi_slave_interface|register_phase0\(3) & !\inst_dds|phase_post_offset0[4]~13_cout\)) # (!\inst_dds|phase_accumulator0\(19) & 
-- ((!\inst_dds|phase_post_offset0[4]~13_cout\) # (!\inst_spi_slave_interface|register_phase0\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|phase_accumulator0\(19),
	datab => \inst_spi_slave_interface|register_phase0\(3),
	datad => VCC,
	cin => \inst_dds|phase_post_offset0[4]~13_cout\,
	cout => \inst_dds|phase_post_offset0[4]~15_cout\);

-- Location: LCCOMB_X16_Y19_N14
\inst_dds|phase_post_offset0[4]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_post_offset0[4]~16_combout\ = ((\inst_dds|phase_accumulator0\(20) $ (\inst_spi_slave_interface|register_phase0\(4) $ (!\inst_dds|phase_post_offset0[4]~15_cout\)))) # (GND)
-- \inst_dds|phase_post_offset0[4]~17\ = CARRY((\inst_dds|phase_accumulator0\(20) & ((\inst_spi_slave_interface|register_phase0\(4)) # (!\inst_dds|phase_post_offset0[4]~15_cout\))) # (!\inst_dds|phase_accumulator0\(20) & 
-- (\inst_spi_slave_interface|register_phase0\(4) & !\inst_dds|phase_post_offset0[4]~15_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|phase_accumulator0\(20),
	datab => \inst_spi_slave_interface|register_phase0\(4),
	datad => VCC,
	cin => \inst_dds|phase_post_offset0[4]~15_cout\,
	combout => \inst_dds|phase_post_offset0[4]~16_combout\,
	cout => \inst_dds|phase_post_offset0[4]~17\);

-- Location: FF_X16_Y19_N15
\inst_dds|phase_post_offset0[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_post_offset0[4]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_post_offset0\(4));

-- Location: FF_X16_Y19_N7
\inst_spi_slave_interface|register_phase0[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(5),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|Decoder0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_phase0\(5));

-- Location: FF_X14_Y19_N1
\inst_spi_slave_interface|register_freq0[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(21),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq0\(21));

-- Location: LCCOMB_X15_Y19_N14
\inst_dds|phase_accumulator0[21]~70\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator0[21]~70_combout\ = (\inst_spi_slave_interface|register_freq0\(21) & ((\inst_dds|phase_accumulator0\(21) & (\inst_dds|phase_accumulator0[20]~69\ & VCC)) # (!\inst_dds|phase_accumulator0\(21) & 
-- (!\inst_dds|phase_accumulator0[20]~69\)))) # (!\inst_spi_slave_interface|register_freq0\(21) & ((\inst_dds|phase_accumulator0\(21) & (!\inst_dds|phase_accumulator0[20]~69\)) # (!\inst_dds|phase_accumulator0\(21) & ((\inst_dds|phase_accumulator0[20]~69\) # 
-- (GND)))))
-- \inst_dds|phase_accumulator0[21]~71\ = CARRY((\inst_spi_slave_interface|register_freq0\(21) & (!\inst_dds|phase_accumulator0\(21) & !\inst_dds|phase_accumulator0[20]~69\)) # (!\inst_spi_slave_interface|register_freq0\(21) & 
-- ((!\inst_dds|phase_accumulator0[20]~69\) # (!\inst_dds|phase_accumulator0\(21)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_spi_slave_interface|register_freq0\(21),
	datab => \inst_dds|phase_accumulator0\(21),
	datad => VCC,
	cin => \inst_dds|phase_accumulator0[20]~69\,
	combout => \inst_dds|phase_accumulator0[21]~70_combout\,
	cout => \inst_dds|phase_accumulator0[21]~71\);

-- Location: FF_X15_Y19_N15
\inst_dds|phase_accumulator0[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator0[21]~70_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator0\(21));

-- Location: LCCOMB_X16_Y19_N16
\inst_dds|phase_post_offset0[5]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_post_offset0[5]~18_combout\ = (\inst_spi_slave_interface|register_phase0\(5) & ((\inst_dds|phase_accumulator0\(21) & (\inst_dds|phase_post_offset0[4]~17\ & VCC)) # (!\inst_dds|phase_accumulator0\(21) & 
-- (!\inst_dds|phase_post_offset0[4]~17\)))) # (!\inst_spi_slave_interface|register_phase0\(5) & ((\inst_dds|phase_accumulator0\(21) & (!\inst_dds|phase_post_offset0[4]~17\)) # (!\inst_dds|phase_accumulator0\(21) & ((\inst_dds|phase_post_offset0[4]~17\) # 
-- (GND)))))
-- \inst_dds|phase_post_offset0[5]~19\ = CARRY((\inst_spi_slave_interface|register_phase0\(5) & (!\inst_dds|phase_accumulator0\(21) & !\inst_dds|phase_post_offset0[4]~17\)) # (!\inst_spi_slave_interface|register_phase0\(5) & 
-- ((!\inst_dds|phase_post_offset0[4]~17\) # (!\inst_dds|phase_accumulator0\(21)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_spi_slave_interface|register_phase0\(5),
	datab => \inst_dds|phase_accumulator0\(21),
	datad => VCC,
	cin => \inst_dds|phase_post_offset0[4]~17\,
	combout => \inst_dds|phase_post_offset0[5]~18_combout\,
	cout => \inst_dds|phase_post_offset0[5]~19\);

-- Location: FF_X16_Y19_N17
\inst_dds|phase_post_offset0[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_post_offset0[5]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_post_offset0\(5));

-- Location: LCCOMB_X15_Y21_N14
\inst_spi_slave_interface|register_freq0[22]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|register_freq0[22]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(22)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(22),
	combout => \inst_spi_slave_interface|register_freq0[22]~feeder_combout\);

-- Location: FF_X15_Y21_N15
\inst_spi_slave_interface|register_freq0[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|register_freq0[22]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq0\(22));

-- Location: LCCOMB_X15_Y19_N16
\inst_dds|phase_accumulator0[22]~72\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator0[22]~72_combout\ = ((\inst_spi_slave_interface|register_freq0\(22) $ (\inst_dds|phase_accumulator0\(22) $ (!\inst_dds|phase_accumulator0[21]~71\)))) # (GND)
-- \inst_dds|phase_accumulator0[22]~73\ = CARRY((\inst_spi_slave_interface|register_freq0\(22) & ((\inst_dds|phase_accumulator0\(22)) # (!\inst_dds|phase_accumulator0[21]~71\))) # (!\inst_spi_slave_interface|register_freq0\(22) & 
-- (\inst_dds|phase_accumulator0\(22) & !\inst_dds|phase_accumulator0[21]~71\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_spi_slave_interface|register_freq0\(22),
	datab => \inst_dds|phase_accumulator0\(22),
	datad => VCC,
	cin => \inst_dds|phase_accumulator0[21]~71\,
	combout => \inst_dds|phase_accumulator0[22]~72_combout\,
	cout => \inst_dds|phase_accumulator0[22]~73\);

-- Location: FF_X15_Y19_N17
\inst_dds|phase_accumulator0[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator0[22]~72_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator0\(22));

-- Location: LCCOMB_X16_Y19_N4
\inst_spi_slave_interface|register_phase0[6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|register_phase0[6]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(6),
	combout => \inst_spi_slave_interface|register_phase0[6]~feeder_combout\);

-- Location: FF_X16_Y19_N5
\inst_spi_slave_interface|register_phase0[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|register_phase0[6]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|Decoder0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_phase0\(6));

-- Location: LCCOMB_X16_Y19_N18
\inst_dds|phase_post_offset0[6]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_post_offset0[6]~20_combout\ = ((\inst_dds|phase_accumulator0\(22) $ (\inst_spi_slave_interface|register_phase0\(6) $ (!\inst_dds|phase_post_offset0[5]~19\)))) # (GND)
-- \inst_dds|phase_post_offset0[6]~21\ = CARRY((\inst_dds|phase_accumulator0\(22) & ((\inst_spi_slave_interface|register_phase0\(6)) # (!\inst_dds|phase_post_offset0[5]~19\))) # (!\inst_dds|phase_accumulator0\(22) & 
-- (\inst_spi_slave_interface|register_phase0\(6) & !\inst_dds|phase_post_offset0[5]~19\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|phase_accumulator0\(22),
	datab => \inst_spi_slave_interface|register_phase0\(6),
	datad => VCC,
	cin => \inst_dds|phase_post_offset0[5]~19\,
	combout => \inst_dds|phase_post_offset0[6]~20_combout\,
	cout => \inst_dds|phase_post_offset0[6]~21\);

-- Location: FF_X16_Y19_N19
\inst_dds|phase_post_offset0[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_post_offset0[6]~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_post_offset0\(6));

-- Location: LCCOMB_X16_Y19_N2
\inst_spi_slave_interface|register_phase0[7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|register_phase0[7]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(7),
	combout => \inst_spi_slave_interface|register_phase0[7]~feeder_combout\);

-- Location: FF_X16_Y19_N3
\inst_spi_slave_interface|register_phase0[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|register_phase0[7]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|Decoder0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_phase0\(7));

-- Location: LCCOMB_X15_Y21_N4
\inst_spi_slave_interface|register_freq0[23]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|register_freq0[23]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(23)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(23),
	combout => \inst_spi_slave_interface|register_freq0[23]~feeder_combout\);

-- Location: FF_X15_Y21_N5
\inst_spi_slave_interface|register_freq0[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|register_freq0[23]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq0\(23));

-- Location: LCCOMB_X15_Y19_N18
\inst_dds|phase_accumulator0[23]~74\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator0[23]~74_combout\ = (\inst_dds|phase_accumulator0\(23) & ((\inst_spi_slave_interface|register_freq0\(23) & (\inst_dds|phase_accumulator0[22]~73\ & VCC)) # (!\inst_spi_slave_interface|register_freq0\(23) & 
-- (!\inst_dds|phase_accumulator0[22]~73\)))) # (!\inst_dds|phase_accumulator0\(23) & ((\inst_spi_slave_interface|register_freq0\(23) & (!\inst_dds|phase_accumulator0[22]~73\)) # (!\inst_spi_slave_interface|register_freq0\(23) & 
-- ((\inst_dds|phase_accumulator0[22]~73\) # (GND)))))
-- \inst_dds|phase_accumulator0[23]~75\ = CARRY((\inst_dds|phase_accumulator0\(23) & (!\inst_spi_slave_interface|register_freq0\(23) & !\inst_dds|phase_accumulator0[22]~73\)) # (!\inst_dds|phase_accumulator0\(23) & ((!\inst_dds|phase_accumulator0[22]~73\) # 
-- (!\inst_spi_slave_interface|register_freq0\(23)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|phase_accumulator0\(23),
	datab => \inst_spi_slave_interface|register_freq0\(23),
	datad => VCC,
	cin => \inst_dds|phase_accumulator0[22]~73\,
	combout => \inst_dds|phase_accumulator0[23]~74_combout\,
	cout => \inst_dds|phase_accumulator0[23]~75\);

-- Location: FF_X15_Y19_N19
\inst_dds|phase_accumulator0[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator0[23]~74_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator0\(23));

-- Location: LCCOMB_X16_Y19_N20
\inst_dds|phase_post_offset0[7]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_post_offset0[7]~22_combout\ = (\inst_spi_slave_interface|register_phase0\(7) & ((\inst_dds|phase_accumulator0\(23) & (\inst_dds|phase_post_offset0[6]~21\ & VCC)) # (!\inst_dds|phase_accumulator0\(23) & 
-- (!\inst_dds|phase_post_offset0[6]~21\)))) # (!\inst_spi_slave_interface|register_phase0\(7) & ((\inst_dds|phase_accumulator0\(23) & (!\inst_dds|phase_post_offset0[6]~21\)) # (!\inst_dds|phase_accumulator0\(23) & ((\inst_dds|phase_post_offset0[6]~21\) # 
-- (GND)))))
-- \inst_dds|phase_post_offset0[7]~23\ = CARRY((\inst_spi_slave_interface|register_phase0\(7) & (!\inst_dds|phase_accumulator0\(23) & !\inst_dds|phase_post_offset0[6]~21\)) # (!\inst_spi_slave_interface|register_phase0\(7) & 
-- ((!\inst_dds|phase_post_offset0[6]~21\) # (!\inst_dds|phase_accumulator0\(23)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_spi_slave_interface|register_phase0\(7),
	datab => \inst_dds|phase_accumulator0\(23),
	datad => VCC,
	cin => \inst_dds|phase_post_offset0[6]~21\,
	combout => \inst_dds|phase_post_offset0[7]~22_combout\,
	cout => \inst_dds|phase_post_offset0[7]~23\);

-- Location: FF_X16_Y19_N21
\inst_dds|phase_post_offset0[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_post_offset0[7]~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_post_offset0\(7));

-- Location: LCCOMB_X15_Y21_N10
\inst_spi_slave_interface|register_freq0[24]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|register_freq0[24]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(24)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(24),
	combout => \inst_spi_slave_interface|register_freq0[24]~feeder_combout\);

-- Location: FF_X15_Y21_N11
\inst_spi_slave_interface|register_freq0[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|register_freq0[24]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq0\(24));

-- Location: LCCOMB_X15_Y19_N20
\inst_dds|phase_accumulator0[24]~76\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator0[24]~76_combout\ = ((\inst_spi_slave_interface|register_freq0\(24) $ (\inst_dds|phase_accumulator0\(24) $ (!\inst_dds|phase_accumulator0[23]~75\)))) # (GND)
-- \inst_dds|phase_accumulator0[24]~77\ = CARRY((\inst_spi_slave_interface|register_freq0\(24) & ((\inst_dds|phase_accumulator0\(24)) # (!\inst_dds|phase_accumulator0[23]~75\))) # (!\inst_spi_slave_interface|register_freq0\(24) & 
-- (\inst_dds|phase_accumulator0\(24) & !\inst_dds|phase_accumulator0[23]~75\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_spi_slave_interface|register_freq0\(24),
	datab => \inst_dds|phase_accumulator0\(24),
	datad => VCC,
	cin => \inst_dds|phase_accumulator0[23]~75\,
	combout => \inst_dds|phase_accumulator0[24]~76_combout\,
	cout => \inst_dds|phase_accumulator0[24]~77\);

-- Location: FF_X15_Y19_N21
\inst_dds|phase_accumulator0[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator0[24]~76_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator0\(24));

-- Location: FF_X16_Y19_N9
\inst_spi_slave_interface|register_phase0[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(8),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|Decoder0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_phase0\(8));

-- Location: LCCOMB_X16_Y19_N22
\inst_dds|phase_post_offset0[8]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_post_offset0[8]~24_combout\ = ((\inst_dds|phase_accumulator0\(24) $ (\inst_spi_slave_interface|register_phase0\(8) $ (!\inst_dds|phase_post_offset0[7]~23\)))) # (GND)
-- \inst_dds|phase_post_offset0[8]~25\ = CARRY((\inst_dds|phase_accumulator0\(24) & ((\inst_spi_slave_interface|register_phase0\(8)) # (!\inst_dds|phase_post_offset0[7]~23\))) # (!\inst_dds|phase_accumulator0\(24) & 
-- (\inst_spi_slave_interface|register_phase0\(8) & !\inst_dds|phase_post_offset0[7]~23\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|phase_accumulator0\(24),
	datab => \inst_spi_slave_interface|register_phase0\(8),
	datad => VCC,
	cin => \inst_dds|phase_post_offset0[7]~23\,
	combout => \inst_dds|phase_post_offset0[8]~24_combout\,
	cout => \inst_dds|phase_post_offset0[8]~25\);

-- Location: FF_X16_Y19_N23
\inst_dds|phase_post_offset0[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_post_offset0[8]~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_post_offset0\(8));

-- Location: LCCOMB_X17_Y20_N6
\inst_spi_slave_interface|register_phase0[9]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|register_phase0[9]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(9)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(9),
	combout => \inst_spi_slave_interface|register_phase0[9]~feeder_combout\);

-- Location: FF_X17_Y20_N7
\inst_spi_slave_interface|register_phase0[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|register_phase0[9]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|Decoder0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_phase0\(9));

-- Location: LCCOMB_X15_Y21_N20
\inst_spi_slave_interface|register_freq0[25]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|register_freq0[25]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(25)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(25),
	combout => \inst_spi_slave_interface|register_freq0[25]~feeder_combout\);

-- Location: FF_X15_Y21_N21
\inst_spi_slave_interface|register_freq0[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|register_freq0[25]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq0\(25));

-- Location: LCCOMB_X15_Y19_N22
\inst_dds|phase_accumulator0[25]~78\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator0[25]~78_combout\ = (\inst_dds|phase_accumulator0\(25) & ((\inst_spi_slave_interface|register_freq0\(25) & (\inst_dds|phase_accumulator0[24]~77\ & VCC)) # (!\inst_spi_slave_interface|register_freq0\(25) & 
-- (!\inst_dds|phase_accumulator0[24]~77\)))) # (!\inst_dds|phase_accumulator0\(25) & ((\inst_spi_slave_interface|register_freq0\(25) & (!\inst_dds|phase_accumulator0[24]~77\)) # (!\inst_spi_slave_interface|register_freq0\(25) & 
-- ((\inst_dds|phase_accumulator0[24]~77\) # (GND)))))
-- \inst_dds|phase_accumulator0[25]~79\ = CARRY((\inst_dds|phase_accumulator0\(25) & (!\inst_spi_slave_interface|register_freq0\(25) & !\inst_dds|phase_accumulator0[24]~77\)) # (!\inst_dds|phase_accumulator0\(25) & ((!\inst_dds|phase_accumulator0[24]~77\) # 
-- (!\inst_spi_slave_interface|register_freq0\(25)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|phase_accumulator0\(25),
	datab => \inst_spi_slave_interface|register_freq0\(25),
	datad => VCC,
	cin => \inst_dds|phase_accumulator0[24]~77\,
	combout => \inst_dds|phase_accumulator0[25]~78_combout\,
	cout => \inst_dds|phase_accumulator0[25]~79\);

-- Location: FF_X15_Y19_N23
\inst_dds|phase_accumulator0[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator0[25]~78_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator0\(25));

-- Location: LCCOMB_X16_Y19_N24
\inst_dds|phase_post_offset0[9]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_post_offset0[9]~26_combout\ = (\inst_spi_slave_interface|register_phase0\(9) & ((\inst_dds|phase_accumulator0\(25) & (\inst_dds|phase_post_offset0[8]~25\ & VCC)) # (!\inst_dds|phase_accumulator0\(25) & 
-- (!\inst_dds|phase_post_offset0[8]~25\)))) # (!\inst_spi_slave_interface|register_phase0\(9) & ((\inst_dds|phase_accumulator0\(25) & (!\inst_dds|phase_post_offset0[8]~25\)) # (!\inst_dds|phase_accumulator0\(25) & ((\inst_dds|phase_post_offset0[8]~25\) # 
-- (GND)))))
-- \inst_dds|phase_post_offset0[9]~27\ = CARRY((\inst_spi_slave_interface|register_phase0\(9) & (!\inst_dds|phase_accumulator0\(25) & !\inst_dds|phase_post_offset0[8]~25\)) # (!\inst_spi_slave_interface|register_phase0\(9) & 
-- ((!\inst_dds|phase_post_offset0[8]~25\) # (!\inst_dds|phase_accumulator0\(25)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_spi_slave_interface|register_phase0\(9),
	datab => \inst_dds|phase_accumulator0\(25),
	datad => VCC,
	cin => \inst_dds|phase_post_offset0[8]~25\,
	combout => \inst_dds|phase_post_offset0[9]~26_combout\,
	cout => \inst_dds|phase_post_offset0[9]~27\);

-- Location: FF_X16_Y19_N25
\inst_dds|phase_post_offset0[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_post_offset0[9]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_post_offset0\(9));

-- Location: FF_X17_Y20_N21
\inst_spi_slave_interface|register_phase0[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(10),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|Decoder0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_phase0\(10));

-- Location: LCCOMB_X14_Y19_N30
\inst_spi_slave_interface|register_freq0[26]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|register_freq0[26]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(26)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(26),
	combout => \inst_spi_slave_interface|register_freq0[26]~feeder_combout\);

-- Location: FF_X14_Y19_N31
\inst_spi_slave_interface|register_freq0[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|register_freq0[26]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq0\(26));

-- Location: LCCOMB_X15_Y19_N24
\inst_dds|phase_accumulator0[26]~80\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator0[26]~80_combout\ = ((\inst_spi_slave_interface|register_freq0\(26) $ (\inst_dds|phase_accumulator0\(26) $ (!\inst_dds|phase_accumulator0[25]~79\)))) # (GND)
-- \inst_dds|phase_accumulator0[26]~81\ = CARRY((\inst_spi_slave_interface|register_freq0\(26) & ((\inst_dds|phase_accumulator0\(26)) # (!\inst_dds|phase_accumulator0[25]~79\))) # (!\inst_spi_slave_interface|register_freq0\(26) & 
-- (\inst_dds|phase_accumulator0\(26) & !\inst_dds|phase_accumulator0[25]~79\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_spi_slave_interface|register_freq0\(26),
	datab => \inst_dds|phase_accumulator0\(26),
	datad => VCC,
	cin => \inst_dds|phase_accumulator0[25]~79\,
	combout => \inst_dds|phase_accumulator0[26]~80_combout\,
	cout => \inst_dds|phase_accumulator0[26]~81\);

-- Location: FF_X15_Y19_N25
\inst_dds|phase_accumulator0[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator0[26]~80_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator0\(26));

-- Location: LCCOMB_X16_Y19_N26
\inst_dds|phase_post_offset0[10]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_post_offset0[10]~28_combout\ = ((\inst_spi_slave_interface|register_phase0\(10) $ (\inst_dds|phase_accumulator0\(26) $ (!\inst_dds|phase_post_offset0[9]~27\)))) # (GND)
-- \inst_dds|phase_post_offset0[10]~29\ = CARRY((\inst_spi_slave_interface|register_phase0\(10) & ((\inst_dds|phase_accumulator0\(26)) # (!\inst_dds|phase_post_offset0[9]~27\))) # (!\inst_spi_slave_interface|register_phase0\(10) & 
-- (\inst_dds|phase_accumulator0\(26) & !\inst_dds|phase_post_offset0[9]~27\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_spi_slave_interface|register_phase0\(10),
	datab => \inst_dds|phase_accumulator0\(26),
	datad => VCC,
	cin => \inst_dds|phase_post_offset0[9]~27\,
	combout => \inst_dds|phase_post_offset0[10]~28_combout\,
	cout => \inst_dds|phase_post_offset0[10]~29\);

-- Location: FF_X16_Y19_N27
\inst_dds|phase_post_offset0[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_post_offset0[10]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_post_offset0\(10));

-- Location: LCCOMB_X15_Y21_N30
\inst_spi_slave_interface|register_freq0[27]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|register_freq0[27]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(27)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(27),
	combout => \inst_spi_slave_interface|register_freq0[27]~feeder_combout\);

-- Location: FF_X15_Y21_N31
\inst_spi_slave_interface|register_freq0[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|register_freq0[27]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq0\(27));

-- Location: LCCOMB_X15_Y19_N26
\inst_dds|phase_accumulator0[27]~82\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator0[27]~82_combout\ = \inst_dds|phase_accumulator0\(27) $ (\inst_dds|phase_accumulator0[26]~81\ $ (\inst_spi_slave_interface|register_freq0\(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|phase_accumulator0\(27),
	datad => \inst_spi_slave_interface|register_freq0\(27),
	cin => \inst_dds|phase_accumulator0[26]~81\,
	combout => \inst_dds|phase_accumulator0[27]~82_combout\);

-- Location: FF_X15_Y19_N27
\inst_dds|phase_accumulator0[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator0[27]~82_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator0\(27));

-- Location: LCCOMB_X17_Y20_N30
\inst_spi_slave_interface|register_phase0[11]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|register_phase0[11]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(11)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(11),
	combout => \inst_spi_slave_interface|register_phase0[11]~feeder_combout\);

-- Location: FF_X17_Y20_N31
\inst_spi_slave_interface|register_phase0[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|register_phase0[11]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|Decoder0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_phase0\(11));

-- Location: LCCOMB_X16_Y19_N28
\inst_dds|phase_post_offset0[11]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_post_offset0[11]~30_combout\ = \inst_dds|phase_accumulator0\(27) $ (\inst_dds|phase_post_offset0[10]~29\ $ (\inst_spi_slave_interface|register_phase0\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|phase_accumulator0\(27),
	datad => \inst_spi_slave_interface|register_phase0\(11),
	cin => \inst_dds|phase_post_offset0[10]~29\,
	combout => \inst_dds|phase_post_offset0[11]~30_combout\);

-- Location: FF_X16_Y19_N29
\inst_dds|phase_post_offset0[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_post_offset0[11]~30_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_post_offset0\(11));

-- Location: LCCOMB_X14_Y21_N28
\inst_spi_slave_interface|Decoder0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|Decoder0~6_combout\ = (\inst_spi_slave_interface|shift_register\(29) & (!\inst_spi_slave_interface|shift_register\(30) & (!\inst_spi_slave_interface|shift_register\(28) & \inst_spi_slave_interface|Decoder0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_spi_slave_interface|shift_register\(29),
	datab => \inst_spi_slave_interface|shift_register\(30),
	datac => \inst_spi_slave_interface|shift_register\(28),
	datad => \inst_spi_slave_interface|Decoder0~0_combout\,
	combout => \inst_spi_slave_interface|Decoder0~6_combout\);

-- Location: FF_X15_Y21_N25
\inst_spi_slave_interface|register_freq1[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(20),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|Decoder0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq1\(20));

-- Location: LCCOMB_X14_Y20_N26
\inst_spi_slave_interface|register_freq1[19]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|register_freq1[19]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(19)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(19),
	combout => \inst_spi_slave_interface|register_freq1[19]~feeder_combout\);

-- Location: FF_X14_Y20_N27
\inst_spi_slave_interface|register_freq1[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|register_freq1[19]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|Decoder0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq1\(19));

-- Location: FF_X15_Y21_N19
\inst_spi_slave_interface|register_freq1[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(18),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|Decoder0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq1\(18));

-- Location: LCCOMB_X15_Y18_N20
\inst_spi_slave_interface|register_freq1[17]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|register_freq1[17]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(17)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(17),
	combout => \inst_spi_slave_interface|register_freq1[17]~feeder_combout\);

-- Location: FF_X15_Y18_N21
\inst_spi_slave_interface|register_freq1[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|register_freq1[17]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|Decoder0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq1\(17));

-- Location: FF_X15_Y18_N11
\inst_spi_slave_interface|register_freq1[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(16),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|Decoder0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq1\(16));

-- Location: FF_X14_Y20_N1
\inst_spi_slave_interface|register_freq1[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(15),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|Decoder0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq1\(15));

-- Location: FF_X15_Y21_N17
\inst_spi_slave_interface|register_freq1[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(14),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|Decoder0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq1\(14));

-- Location: LCCOMB_X15_Y22_N6
\inst_spi_slave_interface|register_freq1[13]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|register_freq1[13]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(13)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(13),
	combout => \inst_spi_slave_interface|register_freq1[13]~feeder_combout\);

-- Location: FF_X15_Y22_N7
\inst_spi_slave_interface|register_freq1[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|register_freq1[13]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|Decoder0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq1\(13));

-- Location: LCCOMB_X15_Y18_N8
\inst_spi_slave_interface|register_freq1[12]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|register_freq1[12]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(12)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(12),
	combout => \inst_spi_slave_interface|register_freq1[12]~feeder_combout\);

-- Location: FF_X15_Y18_N9
\inst_spi_slave_interface|register_freq1[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|register_freq1[12]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|Decoder0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq1\(12));

-- Location: FF_X15_Y22_N25
\inst_spi_slave_interface|register_freq1[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(11),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|Decoder0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq1\(11));

-- Location: LCCOMB_X15_Y22_N10
\inst_spi_slave_interface|register_freq1[10]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|register_freq1[10]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(10)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(10),
	combout => \inst_spi_slave_interface|register_freq1[10]~feeder_combout\);

-- Location: FF_X15_Y22_N11
\inst_spi_slave_interface|register_freq1[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|register_freq1[10]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|Decoder0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq1\(10));

-- Location: LCCOMB_X15_Y22_N4
\inst_spi_slave_interface|register_freq1[9]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|register_freq1[9]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(9)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(9),
	combout => \inst_spi_slave_interface|register_freq1[9]~feeder_combout\);

-- Location: FF_X15_Y22_N5
\inst_spi_slave_interface|register_freq1[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|register_freq1[9]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|Decoder0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq1\(9));

-- Location: LCCOMB_X16_Y22_N0
\inst_spi_slave_interface|register_freq1[8]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|register_freq1[8]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(8)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(8),
	combout => \inst_spi_slave_interface|register_freq1[8]~feeder_combout\);

-- Location: FF_X16_Y22_N1
\inst_spi_slave_interface|register_freq1[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|register_freq1[8]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|Decoder0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq1\(8));

-- Location: LCCOMB_X16_Y21_N28
\inst_spi_slave_interface|register_freq1[7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|register_freq1[7]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst_spi_slave_interface|shift_register\(7),
	combout => \inst_spi_slave_interface|register_freq1[7]~feeder_combout\);

-- Location: FF_X16_Y21_N29
\inst_spi_slave_interface|register_freq1[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|register_freq1[7]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|Decoder0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq1\(7));

-- Location: FF_X15_Y22_N15
\inst_spi_slave_interface|register_freq1[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(6),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|Decoder0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq1\(6));

-- Location: LCCOMB_X16_Y21_N30
\inst_spi_slave_interface|register_freq1[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|register_freq1[5]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(5),
	combout => \inst_spi_slave_interface|register_freq1[5]~feeder_combout\);

-- Location: FF_X16_Y21_N31
\inst_spi_slave_interface|register_freq1[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|register_freq1[5]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|Decoder0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq1\(5));

-- Location: LCCOMB_X15_Y22_N20
\inst_spi_slave_interface|register_freq1[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|register_freq1[4]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(4),
	combout => \inst_spi_slave_interface|register_freq1[4]~feeder_combout\);

-- Location: FF_X15_Y22_N21
\inst_spi_slave_interface|register_freq1[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|register_freq1[4]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|Decoder0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq1\(4));

-- Location: LCCOMB_X14_Y20_N6
\inst_spi_slave_interface|register_freq1[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|register_freq1[3]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(3),
	combout => \inst_spi_slave_interface|register_freq1[3]~feeder_combout\);

-- Location: FF_X14_Y20_N7
\inst_spi_slave_interface|register_freq1[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|register_freq1[3]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|Decoder0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq1\(3));

-- Location: LCCOMB_X16_Y22_N2
\inst_spi_slave_interface|register_freq1[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|register_freq1[2]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(2),
	combout => \inst_spi_slave_interface|register_freq1[2]~feeder_combout\);

-- Location: FF_X16_Y22_N3
\inst_spi_slave_interface|register_freq1[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|register_freq1[2]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|Decoder0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq1\(2));

-- Location: FF_X15_Y22_N19
\inst_spi_slave_interface|register_freq1[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(1),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|Decoder0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq1\(1));

-- Location: LCCOMB_X15_Y18_N26
\inst_spi_slave_interface|register_freq1[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|register_freq1[0]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(0),
	combout => \inst_spi_slave_interface|register_freq1[0]~feeder_combout\);

-- Location: FF_X15_Y18_N27
\inst_spi_slave_interface|register_freq1[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|register_freq1[0]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|Decoder0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq1\(0));

-- Location: LCCOMB_X16_Y22_N4
\inst_dds|phase_accumulator1[0]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator1[0]~28_combout\ = (\inst_spi_slave_interface|register_freq1\(0) & (\inst_dds|phase_accumulator1\(0) $ (VCC))) # (!\inst_spi_slave_interface|register_freq1\(0) & (\inst_dds|phase_accumulator1\(0) & VCC))
-- \inst_dds|phase_accumulator1[0]~29\ = CARRY((\inst_spi_slave_interface|register_freq1\(0) & \inst_dds|phase_accumulator1\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_spi_slave_interface|register_freq1\(0),
	datab => \inst_dds|phase_accumulator1\(0),
	datad => VCC,
	combout => \inst_dds|phase_accumulator1[0]~28_combout\,
	cout => \inst_dds|phase_accumulator1[0]~29\);

-- Location: FF_X16_Y22_N5
\inst_dds|phase_accumulator1[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator1[0]~28_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator1\(0));

-- Location: LCCOMB_X16_Y22_N6
\inst_dds|phase_accumulator1[1]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator1[1]~30_combout\ = (\inst_dds|phase_accumulator1\(1) & ((\inst_spi_slave_interface|register_freq1\(1) & (\inst_dds|phase_accumulator1[0]~29\ & VCC)) # (!\inst_spi_slave_interface|register_freq1\(1) & 
-- (!\inst_dds|phase_accumulator1[0]~29\)))) # (!\inst_dds|phase_accumulator1\(1) & ((\inst_spi_slave_interface|register_freq1\(1) & (!\inst_dds|phase_accumulator1[0]~29\)) # (!\inst_spi_slave_interface|register_freq1\(1) & 
-- ((\inst_dds|phase_accumulator1[0]~29\) # (GND)))))
-- \inst_dds|phase_accumulator1[1]~31\ = CARRY((\inst_dds|phase_accumulator1\(1) & (!\inst_spi_slave_interface|register_freq1\(1) & !\inst_dds|phase_accumulator1[0]~29\)) # (!\inst_dds|phase_accumulator1\(1) & ((!\inst_dds|phase_accumulator1[0]~29\) # 
-- (!\inst_spi_slave_interface|register_freq1\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|phase_accumulator1\(1),
	datab => \inst_spi_slave_interface|register_freq1\(1),
	datad => VCC,
	cin => \inst_dds|phase_accumulator1[0]~29\,
	combout => \inst_dds|phase_accumulator1[1]~30_combout\,
	cout => \inst_dds|phase_accumulator1[1]~31\);

-- Location: FF_X16_Y22_N7
\inst_dds|phase_accumulator1[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator1[1]~30_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator1\(1));

-- Location: LCCOMB_X16_Y22_N8
\inst_dds|phase_accumulator1[2]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator1[2]~32_combout\ = ((\inst_spi_slave_interface|register_freq1\(2) $ (\inst_dds|phase_accumulator1\(2) $ (!\inst_dds|phase_accumulator1[1]~31\)))) # (GND)
-- \inst_dds|phase_accumulator1[2]~33\ = CARRY((\inst_spi_slave_interface|register_freq1\(2) & ((\inst_dds|phase_accumulator1\(2)) # (!\inst_dds|phase_accumulator1[1]~31\))) # (!\inst_spi_slave_interface|register_freq1\(2) & (\inst_dds|phase_accumulator1\(2) 
-- & !\inst_dds|phase_accumulator1[1]~31\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_spi_slave_interface|register_freq1\(2),
	datab => \inst_dds|phase_accumulator1\(2),
	datad => VCC,
	cin => \inst_dds|phase_accumulator1[1]~31\,
	combout => \inst_dds|phase_accumulator1[2]~32_combout\,
	cout => \inst_dds|phase_accumulator1[2]~33\);

-- Location: FF_X16_Y22_N9
\inst_dds|phase_accumulator1[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator1[2]~32_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator1\(2));

-- Location: LCCOMB_X16_Y22_N10
\inst_dds|phase_accumulator1[3]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator1[3]~34_combout\ = (\inst_dds|phase_accumulator1\(3) & ((\inst_spi_slave_interface|register_freq1\(3) & (\inst_dds|phase_accumulator1[2]~33\ & VCC)) # (!\inst_spi_slave_interface|register_freq1\(3) & 
-- (!\inst_dds|phase_accumulator1[2]~33\)))) # (!\inst_dds|phase_accumulator1\(3) & ((\inst_spi_slave_interface|register_freq1\(3) & (!\inst_dds|phase_accumulator1[2]~33\)) # (!\inst_spi_slave_interface|register_freq1\(3) & 
-- ((\inst_dds|phase_accumulator1[2]~33\) # (GND)))))
-- \inst_dds|phase_accumulator1[3]~35\ = CARRY((\inst_dds|phase_accumulator1\(3) & (!\inst_spi_slave_interface|register_freq1\(3) & !\inst_dds|phase_accumulator1[2]~33\)) # (!\inst_dds|phase_accumulator1\(3) & ((!\inst_dds|phase_accumulator1[2]~33\) # 
-- (!\inst_spi_slave_interface|register_freq1\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|phase_accumulator1\(3),
	datab => \inst_spi_slave_interface|register_freq1\(3),
	datad => VCC,
	cin => \inst_dds|phase_accumulator1[2]~33\,
	combout => \inst_dds|phase_accumulator1[3]~34_combout\,
	cout => \inst_dds|phase_accumulator1[3]~35\);

-- Location: FF_X16_Y22_N11
\inst_dds|phase_accumulator1[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator1[3]~34_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator1\(3));

-- Location: LCCOMB_X16_Y22_N12
\inst_dds|phase_accumulator1[4]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator1[4]~36_combout\ = ((\inst_dds|phase_accumulator1\(4) $ (\inst_spi_slave_interface|register_freq1\(4) $ (!\inst_dds|phase_accumulator1[3]~35\)))) # (GND)
-- \inst_dds|phase_accumulator1[4]~37\ = CARRY((\inst_dds|phase_accumulator1\(4) & ((\inst_spi_slave_interface|register_freq1\(4)) # (!\inst_dds|phase_accumulator1[3]~35\))) # (!\inst_dds|phase_accumulator1\(4) & (\inst_spi_slave_interface|register_freq1\(4) 
-- & !\inst_dds|phase_accumulator1[3]~35\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|phase_accumulator1\(4),
	datab => \inst_spi_slave_interface|register_freq1\(4),
	datad => VCC,
	cin => \inst_dds|phase_accumulator1[3]~35\,
	combout => \inst_dds|phase_accumulator1[4]~36_combout\,
	cout => \inst_dds|phase_accumulator1[4]~37\);

-- Location: FF_X16_Y22_N13
\inst_dds|phase_accumulator1[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator1[4]~36_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator1\(4));

-- Location: LCCOMB_X16_Y22_N14
\inst_dds|phase_accumulator1[5]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator1[5]~38_combout\ = (\inst_spi_slave_interface|register_freq1\(5) & ((\inst_dds|phase_accumulator1\(5) & (\inst_dds|phase_accumulator1[4]~37\ & VCC)) # (!\inst_dds|phase_accumulator1\(5) & 
-- (!\inst_dds|phase_accumulator1[4]~37\)))) # (!\inst_spi_slave_interface|register_freq1\(5) & ((\inst_dds|phase_accumulator1\(5) & (!\inst_dds|phase_accumulator1[4]~37\)) # (!\inst_dds|phase_accumulator1\(5) & ((\inst_dds|phase_accumulator1[4]~37\) # 
-- (GND)))))
-- \inst_dds|phase_accumulator1[5]~39\ = CARRY((\inst_spi_slave_interface|register_freq1\(5) & (!\inst_dds|phase_accumulator1\(5) & !\inst_dds|phase_accumulator1[4]~37\)) # (!\inst_spi_slave_interface|register_freq1\(5) & 
-- ((!\inst_dds|phase_accumulator1[4]~37\) # (!\inst_dds|phase_accumulator1\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_spi_slave_interface|register_freq1\(5),
	datab => \inst_dds|phase_accumulator1\(5),
	datad => VCC,
	cin => \inst_dds|phase_accumulator1[4]~37\,
	combout => \inst_dds|phase_accumulator1[5]~38_combout\,
	cout => \inst_dds|phase_accumulator1[5]~39\);

-- Location: FF_X16_Y22_N15
\inst_dds|phase_accumulator1[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator1[5]~38_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator1\(5));

-- Location: LCCOMB_X16_Y22_N16
\inst_dds|phase_accumulator1[6]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator1[6]~40_combout\ = ((\inst_spi_slave_interface|register_freq1\(6) $ (\inst_dds|phase_accumulator1\(6) $ (!\inst_dds|phase_accumulator1[5]~39\)))) # (GND)
-- \inst_dds|phase_accumulator1[6]~41\ = CARRY((\inst_spi_slave_interface|register_freq1\(6) & ((\inst_dds|phase_accumulator1\(6)) # (!\inst_dds|phase_accumulator1[5]~39\))) # (!\inst_spi_slave_interface|register_freq1\(6) & (\inst_dds|phase_accumulator1\(6) 
-- & !\inst_dds|phase_accumulator1[5]~39\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_spi_slave_interface|register_freq1\(6),
	datab => \inst_dds|phase_accumulator1\(6),
	datad => VCC,
	cin => \inst_dds|phase_accumulator1[5]~39\,
	combout => \inst_dds|phase_accumulator1[6]~40_combout\,
	cout => \inst_dds|phase_accumulator1[6]~41\);

-- Location: FF_X16_Y22_N17
\inst_dds|phase_accumulator1[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator1[6]~40_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator1\(6));

-- Location: LCCOMB_X16_Y22_N18
\inst_dds|phase_accumulator1[7]~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator1[7]~42_combout\ = (\inst_spi_slave_interface|register_freq1\(7) & ((\inst_dds|phase_accumulator1\(7) & (\inst_dds|phase_accumulator1[6]~41\ & VCC)) # (!\inst_dds|phase_accumulator1\(7) & 
-- (!\inst_dds|phase_accumulator1[6]~41\)))) # (!\inst_spi_slave_interface|register_freq1\(7) & ((\inst_dds|phase_accumulator1\(7) & (!\inst_dds|phase_accumulator1[6]~41\)) # (!\inst_dds|phase_accumulator1\(7) & ((\inst_dds|phase_accumulator1[6]~41\) # 
-- (GND)))))
-- \inst_dds|phase_accumulator1[7]~43\ = CARRY((\inst_spi_slave_interface|register_freq1\(7) & (!\inst_dds|phase_accumulator1\(7) & !\inst_dds|phase_accumulator1[6]~41\)) # (!\inst_spi_slave_interface|register_freq1\(7) & 
-- ((!\inst_dds|phase_accumulator1[6]~41\) # (!\inst_dds|phase_accumulator1\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_spi_slave_interface|register_freq1\(7),
	datab => \inst_dds|phase_accumulator1\(7),
	datad => VCC,
	cin => \inst_dds|phase_accumulator1[6]~41\,
	combout => \inst_dds|phase_accumulator1[7]~42_combout\,
	cout => \inst_dds|phase_accumulator1[7]~43\);

-- Location: FF_X16_Y22_N19
\inst_dds|phase_accumulator1[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator1[7]~42_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator1\(7));

-- Location: LCCOMB_X16_Y22_N20
\inst_dds|phase_accumulator1[8]~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator1[8]~44_combout\ = ((\inst_dds|phase_accumulator1\(8) $ (\inst_spi_slave_interface|register_freq1\(8) $ (!\inst_dds|phase_accumulator1[7]~43\)))) # (GND)
-- \inst_dds|phase_accumulator1[8]~45\ = CARRY((\inst_dds|phase_accumulator1\(8) & ((\inst_spi_slave_interface|register_freq1\(8)) # (!\inst_dds|phase_accumulator1[7]~43\))) # (!\inst_dds|phase_accumulator1\(8) & (\inst_spi_slave_interface|register_freq1\(8) 
-- & !\inst_dds|phase_accumulator1[7]~43\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|phase_accumulator1\(8),
	datab => \inst_spi_slave_interface|register_freq1\(8),
	datad => VCC,
	cin => \inst_dds|phase_accumulator1[7]~43\,
	combout => \inst_dds|phase_accumulator1[8]~44_combout\,
	cout => \inst_dds|phase_accumulator1[8]~45\);

-- Location: FF_X16_Y22_N21
\inst_dds|phase_accumulator1[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator1[8]~44_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator1\(8));

-- Location: LCCOMB_X16_Y22_N22
\inst_dds|phase_accumulator1[9]~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator1[9]~46_combout\ = (\inst_dds|phase_accumulator1\(9) & ((\inst_spi_slave_interface|register_freq1\(9) & (\inst_dds|phase_accumulator1[8]~45\ & VCC)) # (!\inst_spi_slave_interface|register_freq1\(9) & 
-- (!\inst_dds|phase_accumulator1[8]~45\)))) # (!\inst_dds|phase_accumulator1\(9) & ((\inst_spi_slave_interface|register_freq1\(9) & (!\inst_dds|phase_accumulator1[8]~45\)) # (!\inst_spi_slave_interface|register_freq1\(9) & 
-- ((\inst_dds|phase_accumulator1[8]~45\) # (GND)))))
-- \inst_dds|phase_accumulator1[9]~47\ = CARRY((\inst_dds|phase_accumulator1\(9) & (!\inst_spi_slave_interface|register_freq1\(9) & !\inst_dds|phase_accumulator1[8]~45\)) # (!\inst_dds|phase_accumulator1\(9) & ((!\inst_dds|phase_accumulator1[8]~45\) # 
-- (!\inst_spi_slave_interface|register_freq1\(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|phase_accumulator1\(9),
	datab => \inst_spi_slave_interface|register_freq1\(9),
	datad => VCC,
	cin => \inst_dds|phase_accumulator1[8]~45\,
	combout => \inst_dds|phase_accumulator1[9]~46_combout\,
	cout => \inst_dds|phase_accumulator1[9]~47\);

-- Location: FF_X16_Y22_N23
\inst_dds|phase_accumulator1[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator1[9]~46_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator1\(9));

-- Location: LCCOMB_X16_Y22_N24
\inst_dds|phase_accumulator1[10]~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator1[10]~48_combout\ = ((\inst_spi_slave_interface|register_freq1\(10) $ (\inst_dds|phase_accumulator1\(10) $ (!\inst_dds|phase_accumulator1[9]~47\)))) # (GND)
-- \inst_dds|phase_accumulator1[10]~49\ = CARRY((\inst_spi_slave_interface|register_freq1\(10) & ((\inst_dds|phase_accumulator1\(10)) # (!\inst_dds|phase_accumulator1[9]~47\))) # (!\inst_spi_slave_interface|register_freq1\(10) & 
-- (\inst_dds|phase_accumulator1\(10) & !\inst_dds|phase_accumulator1[9]~47\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_spi_slave_interface|register_freq1\(10),
	datab => \inst_dds|phase_accumulator1\(10),
	datad => VCC,
	cin => \inst_dds|phase_accumulator1[9]~47\,
	combout => \inst_dds|phase_accumulator1[10]~48_combout\,
	cout => \inst_dds|phase_accumulator1[10]~49\);

-- Location: FF_X16_Y22_N25
\inst_dds|phase_accumulator1[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator1[10]~48_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator1\(10));

-- Location: LCCOMB_X16_Y22_N26
\inst_dds|phase_accumulator1[11]~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator1[11]~50_combout\ = (\inst_dds|phase_accumulator1\(11) & ((\inst_spi_slave_interface|register_freq1\(11) & (\inst_dds|phase_accumulator1[10]~49\ & VCC)) # (!\inst_spi_slave_interface|register_freq1\(11) & 
-- (!\inst_dds|phase_accumulator1[10]~49\)))) # (!\inst_dds|phase_accumulator1\(11) & ((\inst_spi_slave_interface|register_freq1\(11) & (!\inst_dds|phase_accumulator1[10]~49\)) # (!\inst_spi_slave_interface|register_freq1\(11) & 
-- ((\inst_dds|phase_accumulator1[10]~49\) # (GND)))))
-- \inst_dds|phase_accumulator1[11]~51\ = CARRY((\inst_dds|phase_accumulator1\(11) & (!\inst_spi_slave_interface|register_freq1\(11) & !\inst_dds|phase_accumulator1[10]~49\)) # (!\inst_dds|phase_accumulator1\(11) & ((!\inst_dds|phase_accumulator1[10]~49\) # 
-- (!\inst_spi_slave_interface|register_freq1\(11)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|phase_accumulator1\(11),
	datab => \inst_spi_slave_interface|register_freq1\(11),
	datad => VCC,
	cin => \inst_dds|phase_accumulator1[10]~49\,
	combout => \inst_dds|phase_accumulator1[11]~50_combout\,
	cout => \inst_dds|phase_accumulator1[11]~51\);

-- Location: FF_X16_Y22_N27
\inst_dds|phase_accumulator1[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator1[11]~50_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator1\(11));

-- Location: LCCOMB_X16_Y22_N28
\inst_dds|phase_accumulator1[12]~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator1[12]~52_combout\ = ((\inst_spi_slave_interface|register_freq1\(12) $ (\inst_dds|phase_accumulator1\(12) $ (!\inst_dds|phase_accumulator1[11]~51\)))) # (GND)
-- \inst_dds|phase_accumulator1[12]~53\ = CARRY((\inst_spi_slave_interface|register_freq1\(12) & ((\inst_dds|phase_accumulator1\(12)) # (!\inst_dds|phase_accumulator1[11]~51\))) # (!\inst_spi_slave_interface|register_freq1\(12) & 
-- (\inst_dds|phase_accumulator1\(12) & !\inst_dds|phase_accumulator1[11]~51\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_spi_slave_interface|register_freq1\(12),
	datab => \inst_dds|phase_accumulator1\(12),
	datad => VCC,
	cin => \inst_dds|phase_accumulator1[11]~51\,
	combout => \inst_dds|phase_accumulator1[12]~52_combout\,
	cout => \inst_dds|phase_accumulator1[12]~53\);

-- Location: FF_X16_Y22_N29
\inst_dds|phase_accumulator1[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator1[12]~52_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator1\(12));

-- Location: LCCOMB_X16_Y22_N30
\inst_dds|phase_accumulator1[13]~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator1[13]~54_combout\ = (\inst_dds|phase_accumulator1\(13) & ((\inst_spi_slave_interface|register_freq1\(13) & (\inst_dds|phase_accumulator1[12]~53\ & VCC)) # (!\inst_spi_slave_interface|register_freq1\(13) & 
-- (!\inst_dds|phase_accumulator1[12]~53\)))) # (!\inst_dds|phase_accumulator1\(13) & ((\inst_spi_slave_interface|register_freq1\(13) & (!\inst_dds|phase_accumulator1[12]~53\)) # (!\inst_spi_slave_interface|register_freq1\(13) & 
-- ((\inst_dds|phase_accumulator1[12]~53\) # (GND)))))
-- \inst_dds|phase_accumulator1[13]~55\ = CARRY((\inst_dds|phase_accumulator1\(13) & (!\inst_spi_slave_interface|register_freq1\(13) & !\inst_dds|phase_accumulator1[12]~53\)) # (!\inst_dds|phase_accumulator1\(13) & ((!\inst_dds|phase_accumulator1[12]~53\) # 
-- (!\inst_spi_slave_interface|register_freq1\(13)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|phase_accumulator1\(13),
	datab => \inst_spi_slave_interface|register_freq1\(13),
	datad => VCC,
	cin => \inst_dds|phase_accumulator1[12]~53\,
	combout => \inst_dds|phase_accumulator1[13]~54_combout\,
	cout => \inst_dds|phase_accumulator1[13]~55\);

-- Location: FF_X16_Y22_N31
\inst_dds|phase_accumulator1[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator1[13]~54_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator1\(13));

-- Location: LCCOMB_X16_Y21_N0
\inst_dds|phase_accumulator1[14]~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator1[14]~56_combout\ = ((\inst_spi_slave_interface|register_freq1\(14) $ (\inst_dds|phase_accumulator1\(14) $ (!\inst_dds|phase_accumulator1[13]~55\)))) # (GND)
-- \inst_dds|phase_accumulator1[14]~57\ = CARRY((\inst_spi_slave_interface|register_freq1\(14) & ((\inst_dds|phase_accumulator1\(14)) # (!\inst_dds|phase_accumulator1[13]~55\))) # (!\inst_spi_slave_interface|register_freq1\(14) & 
-- (\inst_dds|phase_accumulator1\(14) & !\inst_dds|phase_accumulator1[13]~55\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_spi_slave_interface|register_freq1\(14),
	datab => \inst_dds|phase_accumulator1\(14),
	datad => VCC,
	cin => \inst_dds|phase_accumulator1[13]~55\,
	combout => \inst_dds|phase_accumulator1[14]~56_combout\,
	cout => \inst_dds|phase_accumulator1[14]~57\);

-- Location: FF_X16_Y21_N1
\inst_dds|phase_accumulator1[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator1[14]~56_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator1\(14));

-- Location: LCCOMB_X16_Y21_N2
\inst_dds|phase_accumulator1[15]~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator1[15]~58_combout\ = (\inst_spi_slave_interface|register_freq1\(15) & ((\inst_dds|phase_accumulator1\(15) & (\inst_dds|phase_accumulator1[14]~57\ & VCC)) # (!\inst_dds|phase_accumulator1\(15) & 
-- (!\inst_dds|phase_accumulator1[14]~57\)))) # (!\inst_spi_slave_interface|register_freq1\(15) & ((\inst_dds|phase_accumulator1\(15) & (!\inst_dds|phase_accumulator1[14]~57\)) # (!\inst_dds|phase_accumulator1\(15) & ((\inst_dds|phase_accumulator1[14]~57\) # 
-- (GND)))))
-- \inst_dds|phase_accumulator1[15]~59\ = CARRY((\inst_spi_slave_interface|register_freq1\(15) & (!\inst_dds|phase_accumulator1\(15) & !\inst_dds|phase_accumulator1[14]~57\)) # (!\inst_spi_slave_interface|register_freq1\(15) & 
-- ((!\inst_dds|phase_accumulator1[14]~57\) # (!\inst_dds|phase_accumulator1\(15)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_spi_slave_interface|register_freq1\(15),
	datab => \inst_dds|phase_accumulator1\(15),
	datad => VCC,
	cin => \inst_dds|phase_accumulator1[14]~57\,
	combout => \inst_dds|phase_accumulator1[15]~58_combout\,
	cout => \inst_dds|phase_accumulator1[15]~59\);

-- Location: FF_X16_Y21_N3
\inst_dds|phase_accumulator1[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator1[15]~58_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator1\(15));

-- Location: LCCOMB_X16_Y21_N4
\inst_dds|phase_accumulator1[16]~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator1[16]~60_combout\ = ((\inst_spi_slave_interface|register_freq1\(16) $ (\inst_dds|phase_accumulator1\(16) $ (!\inst_dds|phase_accumulator1[15]~59\)))) # (GND)
-- \inst_dds|phase_accumulator1[16]~61\ = CARRY((\inst_spi_slave_interface|register_freq1\(16) & ((\inst_dds|phase_accumulator1\(16)) # (!\inst_dds|phase_accumulator1[15]~59\))) # (!\inst_spi_slave_interface|register_freq1\(16) & 
-- (\inst_dds|phase_accumulator1\(16) & !\inst_dds|phase_accumulator1[15]~59\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_spi_slave_interface|register_freq1\(16),
	datab => \inst_dds|phase_accumulator1\(16),
	datad => VCC,
	cin => \inst_dds|phase_accumulator1[15]~59\,
	combout => \inst_dds|phase_accumulator1[16]~60_combout\,
	cout => \inst_dds|phase_accumulator1[16]~61\);

-- Location: FF_X16_Y21_N5
\inst_dds|phase_accumulator1[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator1[16]~60_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator1\(16));

-- Location: LCCOMB_X16_Y21_N6
\inst_dds|phase_accumulator1[17]~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator1[17]~62_combout\ = (\inst_dds|phase_accumulator1\(17) & ((\inst_spi_slave_interface|register_freq1\(17) & (\inst_dds|phase_accumulator1[16]~61\ & VCC)) # (!\inst_spi_slave_interface|register_freq1\(17) & 
-- (!\inst_dds|phase_accumulator1[16]~61\)))) # (!\inst_dds|phase_accumulator1\(17) & ((\inst_spi_slave_interface|register_freq1\(17) & (!\inst_dds|phase_accumulator1[16]~61\)) # (!\inst_spi_slave_interface|register_freq1\(17) & 
-- ((\inst_dds|phase_accumulator1[16]~61\) # (GND)))))
-- \inst_dds|phase_accumulator1[17]~63\ = CARRY((\inst_dds|phase_accumulator1\(17) & (!\inst_spi_slave_interface|register_freq1\(17) & !\inst_dds|phase_accumulator1[16]~61\)) # (!\inst_dds|phase_accumulator1\(17) & ((!\inst_dds|phase_accumulator1[16]~61\) # 
-- (!\inst_spi_slave_interface|register_freq1\(17)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|phase_accumulator1\(17),
	datab => \inst_spi_slave_interface|register_freq1\(17),
	datad => VCC,
	cin => \inst_dds|phase_accumulator1[16]~61\,
	combout => \inst_dds|phase_accumulator1[17]~62_combout\,
	cout => \inst_dds|phase_accumulator1[17]~63\);

-- Location: FF_X16_Y21_N7
\inst_dds|phase_accumulator1[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator1[17]~62_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator1\(17));

-- Location: LCCOMB_X16_Y21_N8
\inst_dds|phase_accumulator1[18]~64\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator1[18]~64_combout\ = ((\inst_dds|phase_accumulator1\(18) $ (\inst_spi_slave_interface|register_freq1\(18) $ (!\inst_dds|phase_accumulator1[17]~63\)))) # (GND)
-- \inst_dds|phase_accumulator1[18]~65\ = CARRY((\inst_dds|phase_accumulator1\(18) & ((\inst_spi_slave_interface|register_freq1\(18)) # (!\inst_dds|phase_accumulator1[17]~63\))) # (!\inst_dds|phase_accumulator1\(18) & 
-- (\inst_spi_slave_interface|register_freq1\(18) & !\inst_dds|phase_accumulator1[17]~63\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|phase_accumulator1\(18),
	datab => \inst_spi_slave_interface|register_freq1\(18),
	datad => VCC,
	cin => \inst_dds|phase_accumulator1[17]~63\,
	combout => \inst_dds|phase_accumulator1[18]~64_combout\,
	cout => \inst_dds|phase_accumulator1[18]~65\);

-- Location: FF_X16_Y21_N9
\inst_dds|phase_accumulator1[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator1[18]~64_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator1\(18));

-- Location: LCCOMB_X16_Y21_N10
\inst_dds|phase_accumulator1[19]~66\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator1[19]~66_combout\ = (\inst_dds|phase_accumulator1\(19) & ((\inst_spi_slave_interface|register_freq1\(19) & (\inst_dds|phase_accumulator1[18]~65\ & VCC)) # (!\inst_spi_slave_interface|register_freq1\(19) & 
-- (!\inst_dds|phase_accumulator1[18]~65\)))) # (!\inst_dds|phase_accumulator1\(19) & ((\inst_spi_slave_interface|register_freq1\(19) & (!\inst_dds|phase_accumulator1[18]~65\)) # (!\inst_spi_slave_interface|register_freq1\(19) & 
-- ((\inst_dds|phase_accumulator1[18]~65\) # (GND)))))
-- \inst_dds|phase_accumulator1[19]~67\ = CARRY((\inst_dds|phase_accumulator1\(19) & (!\inst_spi_slave_interface|register_freq1\(19) & !\inst_dds|phase_accumulator1[18]~65\)) # (!\inst_dds|phase_accumulator1\(19) & ((!\inst_dds|phase_accumulator1[18]~65\) # 
-- (!\inst_spi_slave_interface|register_freq1\(19)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|phase_accumulator1\(19),
	datab => \inst_spi_slave_interface|register_freq1\(19),
	datad => VCC,
	cin => \inst_dds|phase_accumulator1[18]~65\,
	combout => \inst_dds|phase_accumulator1[19]~66_combout\,
	cout => \inst_dds|phase_accumulator1[19]~67\);

-- Location: FF_X16_Y21_N11
\inst_dds|phase_accumulator1[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator1[19]~66_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator1\(19));

-- Location: LCCOMB_X16_Y21_N12
\inst_dds|phase_accumulator1[20]~68\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator1[20]~68_combout\ = ((\inst_dds|phase_accumulator1\(20) $ (\inst_spi_slave_interface|register_freq1\(20) $ (!\inst_dds|phase_accumulator1[19]~67\)))) # (GND)
-- \inst_dds|phase_accumulator1[20]~69\ = CARRY((\inst_dds|phase_accumulator1\(20) & ((\inst_spi_slave_interface|register_freq1\(20)) # (!\inst_dds|phase_accumulator1[19]~67\))) # (!\inst_dds|phase_accumulator1\(20) & 
-- (\inst_spi_slave_interface|register_freq1\(20) & !\inst_dds|phase_accumulator1[19]~67\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|phase_accumulator1\(20),
	datab => \inst_spi_slave_interface|register_freq1\(20),
	datad => VCC,
	cin => \inst_dds|phase_accumulator1[19]~67\,
	combout => \inst_dds|phase_accumulator1[20]~68_combout\,
	cout => \inst_dds|phase_accumulator1[20]~69\);

-- Location: FF_X16_Y21_N13
\inst_dds|phase_accumulator1[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator1[20]~68_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator1\(20));

-- Location: LCCOMB_X17_Y20_N0
\inst_spi_slave_interface|register_phase1[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|register_phase1[4]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(4),
	combout => \inst_spi_slave_interface|register_phase1[4]~feeder_combout\);

-- Location: LCCOMB_X14_Y21_N16
\inst_spi_slave_interface|Decoder0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|Decoder0~4_combout\ = (!\inst_spi_slave_interface|shift_register\(29) & (!\inst_spi_slave_interface|shift_register\(28) & (\inst_spi_slave_interface|shift_register\(30) & \inst_spi_slave_interface|Decoder0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_spi_slave_interface|shift_register\(29),
	datab => \inst_spi_slave_interface|shift_register\(28),
	datac => \inst_spi_slave_interface|shift_register\(30),
	datad => \inst_spi_slave_interface|Decoder0~0_combout\,
	combout => \inst_spi_slave_interface|Decoder0~4_combout\);

-- Location: FF_X17_Y20_N1
\inst_spi_slave_interface|register_phase1[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|register_phase1[4]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|Decoder0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_phase1\(4));

-- Location: FF_X17_Y20_N23
\inst_spi_slave_interface|register_phase1[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(3),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|Decoder0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_phase1\(3));

-- Location: FF_X17_Y21_N15
\inst_spi_slave_interface|register_phase1[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(2),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|Decoder0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_phase1\(2));

-- Location: FF_X17_Y21_N11
\inst_spi_slave_interface|register_phase1[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(1),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|Decoder0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_phase1\(1));

-- Location: FF_X17_Y21_N9
\inst_spi_slave_interface|register_phase1[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(0),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|Decoder0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_phase1\(0));

-- Location: LCCOMB_X17_Y21_N8
\inst_dds|phase_post_offset1[4]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_post_offset1[4]~9_cout\ = CARRY((\inst_dds|phase_accumulator1\(16) & \inst_spi_slave_interface|register_phase1\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|phase_accumulator1\(16),
	datab => \inst_spi_slave_interface|register_phase1\(0),
	datad => VCC,
	cout => \inst_dds|phase_post_offset1[4]~9_cout\);

-- Location: LCCOMB_X17_Y21_N10
\inst_dds|phase_post_offset1[4]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_post_offset1[4]~11_cout\ = CARRY((\inst_spi_slave_interface|register_phase1\(1) & (!\inst_dds|phase_accumulator1\(17) & !\inst_dds|phase_post_offset1[4]~9_cout\)) # (!\inst_spi_slave_interface|register_phase1\(1) & 
-- ((!\inst_dds|phase_post_offset1[4]~9_cout\) # (!\inst_dds|phase_accumulator1\(17)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_spi_slave_interface|register_phase1\(1),
	datab => \inst_dds|phase_accumulator1\(17),
	datad => VCC,
	cin => \inst_dds|phase_post_offset1[4]~9_cout\,
	cout => \inst_dds|phase_post_offset1[4]~11_cout\);

-- Location: LCCOMB_X17_Y21_N12
\inst_dds|phase_post_offset1[4]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_post_offset1[4]~13_cout\ = CARRY((\inst_dds|phase_accumulator1\(18) & ((\inst_spi_slave_interface|register_phase1\(2)) # (!\inst_dds|phase_post_offset1[4]~11_cout\))) # (!\inst_dds|phase_accumulator1\(18) & 
-- (\inst_spi_slave_interface|register_phase1\(2) & !\inst_dds|phase_post_offset1[4]~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|phase_accumulator1\(18),
	datab => \inst_spi_slave_interface|register_phase1\(2),
	datad => VCC,
	cin => \inst_dds|phase_post_offset1[4]~11_cout\,
	cout => \inst_dds|phase_post_offset1[4]~13_cout\);

-- Location: LCCOMB_X17_Y21_N14
\inst_dds|phase_post_offset1[4]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_post_offset1[4]~15_cout\ = CARRY((\inst_dds|phase_accumulator1\(19) & (!\inst_spi_slave_interface|register_phase1\(3) & !\inst_dds|phase_post_offset1[4]~13_cout\)) # (!\inst_dds|phase_accumulator1\(19) & 
-- ((!\inst_dds|phase_post_offset1[4]~13_cout\) # (!\inst_spi_slave_interface|register_phase1\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|phase_accumulator1\(19),
	datab => \inst_spi_slave_interface|register_phase1\(3),
	datad => VCC,
	cin => \inst_dds|phase_post_offset1[4]~13_cout\,
	cout => \inst_dds|phase_post_offset1[4]~15_cout\);

-- Location: LCCOMB_X17_Y21_N16
\inst_dds|phase_post_offset1[4]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_post_offset1[4]~16_combout\ = ((\inst_dds|phase_accumulator1\(20) $ (\inst_spi_slave_interface|register_phase1\(4) $ (!\inst_dds|phase_post_offset1[4]~15_cout\)))) # (GND)
-- \inst_dds|phase_post_offset1[4]~17\ = CARRY((\inst_dds|phase_accumulator1\(20) & ((\inst_spi_slave_interface|register_phase1\(4)) # (!\inst_dds|phase_post_offset1[4]~15_cout\))) # (!\inst_dds|phase_accumulator1\(20) & 
-- (\inst_spi_slave_interface|register_phase1\(4) & !\inst_dds|phase_post_offset1[4]~15_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|phase_accumulator1\(20),
	datab => \inst_spi_slave_interface|register_phase1\(4),
	datad => VCC,
	cin => \inst_dds|phase_post_offset1[4]~15_cout\,
	combout => \inst_dds|phase_post_offset1[4]~16_combout\,
	cout => \inst_dds|phase_post_offset1[4]~17\);

-- Location: FF_X17_Y21_N17
\inst_dds|phase_post_offset1[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_post_offset1[4]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_post_offset1\(4));

-- Location: LCCOMB_X15_Y21_N26
\inst_spi_slave_interface|register_freq1[21]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|register_freq1[21]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(21)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(21),
	combout => \inst_spi_slave_interface|register_freq1[21]~feeder_combout\);

-- Location: FF_X15_Y21_N27
\inst_spi_slave_interface|register_freq1[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|register_freq1[21]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|Decoder0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq1\(21));

-- Location: LCCOMB_X16_Y21_N14
\inst_dds|phase_accumulator1[21]~70\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator1[21]~70_combout\ = (\inst_spi_slave_interface|register_freq1\(21) & ((\inst_dds|phase_accumulator1\(21) & (\inst_dds|phase_accumulator1[20]~69\ & VCC)) # (!\inst_dds|phase_accumulator1\(21) & 
-- (!\inst_dds|phase_accumulator1[20]~69\)))) # (!\inst_spi_slave_interface|register_freq1\(21) & ((\inst_dds|phase_accumulator1\(21) & (!\inst_dds|phase_accumulator1[20]~69\)) # (!\inst_dds|phase_accumulator1\(21) & ((\inst_dds|phase_accumulator1[20]~69\) # 
-- (GND)))))
-- \inst_dds|phase_accumulator1[21]~71\ = CARRY((\inst_spi_slave_interface|register_freq1\(21) & (!\inst_dds|phase_accumulator1\(21) & !\inst_dds|phase_accumulator1[20]~69\)) # (!\inst_spi_slave_interface|register_freq1\(21) & 
-- ((!\inst_dds|phase_accumulator1[20]~69\) # (!\inst_dds|phase_accumulator1\(21)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_spi_slave_interface|register_freq1\(21),
	datab => \inst_dds|phase_accumulator1\(21),
	datad => VCC,
	cin => \inst_dds|phase_accumulator1[20]~69\,
	combout => \inst_dds|phase_accumulator1[21]~70_combout\,
	cout => \inst_dds|phase_accumulator1[21]~71\);

-- Location: FF_X16_Y21_N15
\inst_dds|phase_accumulator1[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator1[21]~70_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator1\(21));

-- Location: FF_X17_Y21_N1
\inst_spi_slave_interface|register_phase1[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(5),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|Decoder0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_phase1\(5));

-- Location: LCCOMB_X17_Y21_N18
\inst_dds|phase_post_offset1[5]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_post_offset1[5]~18_combout\ = (\inst_dds|phase_accumulator1\(21) & ((\inst_spi_slave_interface|register_phase1\(5) & (\inst_dds|phase_post_offset1[4]~17\ & VCC)) # (!\inst_spi_slave_interface|register_phase1\(5) & 
-- (!\inst_dds|phase_post_offset1[4]~17\)))) # (!\inst_dds|phase_accumulator1\(21) & ((\inst_spi_slave_interface|register_phase1\(5) & (!\inst_dds|phase_post_offset1[4]~17\)) # (!\inst_spi_slave_interface|register_phase1\(5) & 
-- ((\inst_dds|phase_post_offset1[4]~17\) # (GND)))))
-- \inst_dds|phase_post_offset1[5]~19\ = CARRY((\inst_dds|phase_accumulator1\(21) & (!\inst_spi_slave_interface|register_phase1\(5) & !\inst_dds|phase_post_offset1[4]~17\)) # (!\inst_dds|phase_accumulator1\(21) & ((!\inst_dds|phase_post_offset1[4]~17\) # 
-- (!\inst_spi_slave_interface|register_phase1\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|phase_accumulator1\(21),
	datab => \inst_spi_slave_interface|register_phase1\(5),
	datad => VCC,
	cin => \inst_dds|phase_post_offset1[4]~17\,
	combout => \inst_dds|phase_post_offset1[5]~18_combout\,
	cout => \inst_dds|phase_post_offset1[5]~19\);

-- Location: FF_X17_Y21_N19
\inst_dds|phase_post_offset1[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_post_offset1[5]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_post_offset1\(5));

-- Location: LCCOMB_X15_Y21_N8
\inst_spi_slave_interface|register_freq1[22]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|register_freq1[22]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(22)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(22),
	combout => \inst_spi_slave_interface|register_freq1[22]~feeder_combout\);

-- Location: FF_X15_Y21_N9
\inst_spi_slave_interface|register_freq1[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|register_freq1[22]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|Decoder0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq1\(22));

-- Location: LCCOMB_X16_Y21_N16
\inst_dds|phase_accumulator1[22]~72\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator1[22]~72_combout\ = ((\inst_spi_slave_interface|register_freq1\(22) $ (\inst_dds|phase_accumulator1\(22) $ (!\inst_dds|phase_accumulator1[21]~71\)))) # (GND)
-- \inst_dds|phase_accumulator1[22]~73\ = CARRY((\inst_spi_slave_interface|register_freq1\(22) & ((\inst_dds|phase_accumulator1\(22)) # (!\inst_dds|phase_accumulator1[21]~71\))) # (!\inst_spi_slave_interface|register_freq1\(22) & 
-- (\inst_dds|phase_accumulator1\(22) & !\inst_dds|phase_accumulator1[21]~71\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_spi_slave_interface|register_freq1\(22),
	datab => \inst_dds|phase_accumulator1\(22),
	datad => VCC,
	cin => \inst_dds|phase_accumulator1[21]~71\,
	combout => \inst_dds|phase_accumulator1[22]~72_combout\,
	cout => \inst_dds|phase_accumulator1[22]~73\);

-- Location: FF_X16_Y21_N17
\inst_dds|phase_accumulator1[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator1[22]~72_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator1\(22));

-- Location: FF_X17_Y21_N13
\inst_spi_slave_interface|register_phase1[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(6),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|Decoder0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_phase1\(6));

-- Location: LCCOMB_X17_Y21_N20
\inst_dds|phase_post_offset1[6]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_post_offset1[6]~20_combout\ = ((\inst_dds|phase_accumulator1\(22) $ (\inst_spi_slave_interface|register_phase1\(6) $ (!\inst_dds|phase_post_offset1[5]~19\)))) # (GND)
-- \inst_dds|phase_post_offset1[6]~21\ = CARRY((\inst_dds|phase_accumulator1\(22) & ((\inst_spi_slave_interface|register_phase1\(6)) # (!\inst_dds|phase_post_offset1[5]~19\))) # (!\inst_dds|phase_accumulator1\(22) & 
-- (\inst_spi_slave_interface|register_phase1\(6) & !\inst_dds|phase_post_offset1[5]~19\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|phase_accumulator1\(22),
	datab => \inst_spi_slave_interface|register_phase1\(6),
	datad => VCC,
	cin => \inst_dds|phase_post_offset1[5]~19\,
	combout => \inst_dds|phase_post_offset1[6]~20_combout\,
	cout => \inst_dds|phase_post_offset1[6]~21\);

-- Location: FF_X17_Y21_N21
\inst_dds|phase_post_offset1[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_post_offset1[6]~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_post_offset1\(6));

-- Location: LCCOMB_X15_Y21_N2
\inst_spi_slave_interface|register_freq1[23]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|register_freq1[23]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(23)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(23),
	combout => \inst_spi_slave_interface|register_freq1[23]~feeder_combout\);

-- Location: FF_X15_Y21_N3
\inst_spi_slave_interface|register_freq1[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|register_freq1[23]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|Decoder0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq1\(23));

-- Location: LCCOMB_X16_Y21_N18
\inst_dds|phase_accumulator1[23]~74\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator1[23]~74_combout\ = (\inst_spi_slave_interface|register_freq1\(23) & ((\inst_dds|phase_accumulator1\(23) & (\inst_dds|phase_accumulator1[22]~73\ & VCC)) # (!\inst_dds|phase_accumulator1\(23) & 
-- (!\inst_dds|phase_accumulator1[22]~73\)))) # (!\inst_spi_slave_interface|register_freq1\(23) & ((\inst_dds|phase_accumulator1\(23) & (!\inst_dds|phase_accumulator1[22]~73\)) # (!\inst_dds|phase_accumulator1\(23) & ((\inst_dds|phase_accumulator1[22]~73\) # 
-- (GND)))))
-- \inst_dds|phase_accumulator1[23]~75\ = CARRY((\inst_spi_slave_interface|register_freq1\(23) & (!\inst_dds|phase_accumulator1\(23) & !\inst_dds|phase_accumulator1[22]~73\)) # (!\inst_spi_slave_interface|register_freq1\(23) & 
-- ((!\inst_dds|phase_accumulator1[22]~73\) # (!\inst_dds|phase_accumulator1\(23)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_spi_slave_interface|register_freq1\(23),
	datab => \inst_dds|phase_accumulator1\(23),
	datad => VCC,
	cin => \inst_dds|phase_accumulator1[22]~73\,
	combout => \inst_dds|phase_accumulator1[23]~74_combout\,
	cout => \inst_dds|phase_accumulator1[23]~75\);

-- Location: FF_X16_Y21_N19
\inst_dds|phase_accumulator1[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator1[23]~74_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator1\(23));

-- Location: LCCOMB_X17_Y21_N2
\inst_spi_slave_interface|register_phase1[7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|register_phase1[7]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(7),
	combout => \inst_spi_slave_interface|register_phase1[7]~feeder_combout\);

-- Location: FF_X17_Y21_N3
\inst_spi_slave_interface|register_phase1[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|register_phase1[7]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|Decoder0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_phase1\(7));

-- Location: LCCOMB_X17_Y21_N22
\inst_dds|phase_post_offset1[7]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_post_offset1[7]~22_combout\ = (\inst_dds|phase_accumulator1\(23) & ((\inst_spi_slave_interface|register_phase1\(7) & (\inst_dds|phase_post_offset1[6]~21\ & VCC)) # (!\inst_spi_slave_interface|register_phase1\(7) & 
-- (!\inst_dds|phase_post_offset1[6]~21\)))) # (!\inst_dds|phase_accumulator1\(23) & ((\inst_spi_slave_interface|register_phase1\(7) & (!\inst_dds|phase_post_offset1[6]~21\)) # (!\inst_spi_slave_interface|register_phase1\(7) & 
-- ((\inst_dds|phase_post_offset1[6]~21\) # (GND)))))
-- \inst_dds|phase_post_offset1[7]~23\ = CARRY((\inst_dds|phase_accumulator1\(23) & (!\inst_spi_slave_interface|register_phase1\(7) & !\inst_dds|phase_post_offset1[6]~21\)) # (!\inst_dds|phase_accumulator1\(23) & ((!\inst_dds|phase_post_offset1[6]~21\) # 
-- (!\inst_spi_slave_interface|register_phase1\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|phase_accumulator1\(23),
	datab => \inst_spi_slave_interface|register_phase1\(7),
	datad => VCC,
	cin => \inst_dds|phase_post_offset1[6]~21\,
	combout => \inst_dds|phase_post_offset1[7]~22_combout\,
	cout => \inst_dds|phase_post_offset1[7]~23\);

-- Location: FF_X17_Y21_N23
\inst_dds|phase_post_offset1[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_post_offset1[7]~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_post_offset1\(7));

-- Location: LCCOMB_X15_Y21_N12
\inst_spi_slave_interface|register_freq1[24]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|register_freq1[24]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(24)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(24),
	combout => \inst_spi_slave_interface|register_freq1[24]~feeder_combout\);

-- Location: FF_X15_Y21_N13
\inst_spi_slave_interface|register_freq1[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|register_freq1[24]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|Decoder0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq1\(24));

-- Location: LCCOMB_X16_Y21_N20
\inst_dds|phase_accumulator1[24]~76\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator1[24]~76_combout\ = ((\inst_spi_slave_interface|register_freq1\(24) $ (\inst_dds|phase_accumulator1\(24) $ (!\inst_dds|phase_accumulator1[23]~75\)))) # (GND)
-- \inst_dds|phase_accumulator1[24]~77\ = CARRY((\inst_spi_slave_interface|register_freq1\(24) & ((\inst_dds|phase_accumulator1\(24)) # (!\inst_dds|phase_accumulator1[23]~75\))) # (!\inst_spi_slave_interface|register_freq1\(24) & 
-- (\inst_dds|phase_accumulator1\(24) & !\inst_dds|phase_accumulator1[23]~75\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_spi_slave_interface|register_freq1\(24),
	datab => \inst_dds|phase_accumulator1\(24),
	datad => VCC,
	cin => \inst_dds|phase_accumulator1[23]~75\,
	combout => \inst_dds|phase_accumulator1[24]~76_combout\,
	cout => \inst_dds|phase_accumulator1[24]~77\);

-- Location: FF_X16_Y21_N21
\inst_dds|phase_accumulator1[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator1[24]~76_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator1\(24));

-- Location: LCCOMB_X17_Y21_N4
\inst_spi_slave_interface|register_phase1[8]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|register_phase1[8]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(8)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(8),
	combout => \inst_spi_slave_interface|register_phase1[8]~feeder_combout\);

-- Location: FF_X17_Y21_N5
\inst_spi_slave_interface|register_phase1[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|register_phase1[8]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|Decoder0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_phase1\(8));

-- Location: LCCOMB_X17_Y21_N24
\inst_dds|phase_post_offset1[8]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_post_offset1[8]~24_combout\ = ((\inst_dds|phase_accumulator1\(24) $ (\inst_spi_slave_interface|register_phase1\(8) $ (!\inst_dds|phase_post_offset1[7]~23\)))) # (GND)
-- \inst_dds|phase_post_offset1[8]~25\ = CARRY((\inst_dds|phase_accumulator1\(24) & ((\inst_spi_slave_interface|register_phase1\(8)) # (!\inst_dds|phase_post_offset1[7]~23\))) # (!\inst_dds|phase_accumulator1\(24) & 
-- (\inst_spi_slave_interface|register_phase1\(8) & !\inst_dds|phase_post_offset1[7]~23\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|phase_accumulator1\(24),
	datab => \inst_spi_slave_interface|register_phase1\(8),
	datad => VCC,
	cin => \inst_dds|phase_post_offset1[7]~23\,
	combout => \inst_dds|phase_post_offset1[8]~24_combout\,
	cout => \inst_dds|phase_post_offset1[8]~25\);

-- Location: FF_X17_Y21_N25
\inst_dds|phase_post_offset1[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_post_offset1[8]~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_post_offset1\(8));

-- Location: LCCOMB_X17_Y21_N6
\inst_spi_slave_interface|register_phase1[9]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|register_phase1[9]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(9)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(9),
	combout => \inst_spi_slave_interface|register_phase1[9]~feeder_combout\);

-- Location: FF_X17_Y21_N7
\inst_spi_slave_interface|register_phase1[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|register_phase1[9]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|Decoder0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_phase1\(9));

-- Location: LCCOMB_X15_Y21_N22
\inst_spi_slave_interface|register_freq1[25]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|register_freq1[25]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(25)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(25),
	combout => \inst_spi_slave_interface|register_freq1[25]~feeder_combout\);

-- Location: FF_X15_Y21_N23
\inst_spi_slave_interface|register_freq1[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|register_freq1[25]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|Decoder0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq1\(25));

-- Location: LCCOMB_X16_Y21_N22
\inst_dds|phase_accumulator1[25]~78\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator1[25]~78_combout\ = (\inst_dds|phase_accumulator1\(25) & ((\inst_spi_slave_interface|register_freq1\(25) & (\inst_dds|phase_accumulator1[24]~77\ & VCC)) # (!\inst_spi_slave_interface|register_freq1\(25) & 
-- (!\inst_dds|phase_accumulator1[24]~77\)))) # (!\inst_dds|phase_accumulator1\(25) & ((\inst_spi_slave_interface|register_freq1\(25) & (!\inst_dds|phase_accumulator1[24]~77\)) # (!\inst_spi_slave_interface|register_freq1\(25) & 
-- ((\inst_dds|phase_accumulator1[24]~77\) # (GND)))))
-- \inst_dds|phase_accumulator1[25]~79\ = CARRY((\inst_dds|phase_accumulator1\(25) & (!\inst_spi_slave_interface|register_freq1\(25) & !\inst_dds|phase_accumulator1[24]~77\)) # (!\inst_dds|phase_accumulator1\(25) & ((!\inst_dds|phase_accumulator1[24]~77\) # 
-- (!\inst_spi_slave_interface|register_freq1\(25)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|phase_accumulator1\(25),
	datab => \inst_spi_slave_interface|register_freq1\(25),
	datad => VCC,
	cin => \inst_dds|phase_accumulator1[24]~77\,
	combout => \inst_dds|phase_accumulator1[25]~78_combout\,
	cout => \inst_dds|phase_accumulator1[25]~79\);

-- Location: FF_X16_Y21_N23
\inst_dds|phase_accumulator1[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator1[25]~78_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator1\(25));

-- Location: LCCOMB_X17_Y21_N26
\inst_dds|phase_post_offset1[9]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_post_offset1[9]~26_combout\ = (\inst_spi_slave_interface|register_phase1\(9) & ((\inst_dds|phase_accumulator1\(25) & (\inst_dds|phase_post_offset1[8]~25\ & VCC)) # (!\inst_dds|phase_accumulator1\(25) & 
-- (!\inst_dds|phase_post_offset1[8]~25\)))) # (!\inst_spi_slave_interface|register_phase1\(9) & ((\inst_dds|phase_accumulator1\(25) & (!\inst_dds|phase_post_offset1[8]~25\)) # (!\inst_dds|phase_accumulator1\(25) & ((\inst_dds|phase_post_offset1[8]~25\) # 
-- (GND)))))
-- \inst_dds|phase_post_offset1[9]~27\ = CARRY((\inst_spi_slave_interface|register_phase1\(9) & (!\inst_dds|phase_accumulator1\(25) & !\inst_dds|phase_post_offset1[8]~25\)) # (!\inst_spi_slave_interface|register_phase1\(9) & 
-- ((!\inst_dds|phase_post_offset1[8]~25\) # (!\inst_dds|phase_accumulator1\(25)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_spi_slave_interface|register_phase1\(9),
	datab => \inst_dds|phase_accumulator1\(25),
	datad => VCC,
	cin => \inst_dds|phase_post_offset1[8]~25\,
	combout => \inst_dds|phase_post_offset1[9]~26_combout\,
	cout => \inst_dds|phase_post_offset1[9]~27\);

-- Location: FF_X17_Y21_N27
\inst_dds|phase_post_offset1[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_post_offset1[9]~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_post_offset1\(9));

-- Location: FF_X17_Y20_N13
\inst_spi_slave_interface|register_phase1[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(10),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|Decoder0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_phase1\(10));

-- Location: FF_X15_Y21_N1
\inst_spi_slave_interface|register_freq1[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(26),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|Decoder0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq1\(26));

-- Location: LCCOMB_X16_Y21_N24
\inst_dds|phase_accumulator1[26]~80\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator1[26]~80_combout\ = ((\inst_spi_slave_interface|register_freq1\(26) $ (\inst_dds|phase_accumulator1\(26) $ (!\inst_dds|phase_accumulator1[25]~79\)))) # (GND)
-- \inst_dds|phase_accumulator1[26]~81\ = CARRY((\inst_spi_slave_interface|register_freq1\(26) & ((\inst_dds|phase_accumulator1\(26)) # (!\inst_dds|phase_accumulator1[25]~79\))) # (!\inst_spi_slave_interface|register_freq1\(26) & 
-- (\inst_dds|phase_accumulator1\(26) & !\inst_dds|phase_accumulator1[25]~79\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_spi_slave_interface|register_freq1\(26),
	datab => \inst_dds|phase_accumulator1\(26),
	datad => VCC,
	cin => \inst_dds|phase_accumulator1[25]~79\,
	combout => \inst_dds|phase_accumulator1[26]~80_combout\,
	cout => \inst_dds|phase_accumulator1[26]~81\);

-- Location: FF_X16_Y21_N25
\inst_dds|phase_accumulator1[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator1[26]~80_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator1\(26));

-- Location: LCCOMB_X17_Y21_N28
\inst_dds|phase_post_offset1[10]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_post_offset1[10]~28_combout\ = ((\inst_spi_slave_interface|register_phase1\(10) $ (\inst_dds|phase_accumulator1\(26) $ (!\inst_dds|phase_post_offset1[9]~27\)))) # (GND)
-- \inst_dds|phase_post_offset1[10]~29\ = CARRY((\inst_spi_slave_interface|register_phase1\(10) & ((\inst_dds|phase_accumulator1\(26)) # (!\inst_dds|phase_post_offset1[9]~27\))) # (!\inst_spi_slave_interface|register_phase1\(10) & 
-- (\inst_dds|phase_accumulator1\(26) & !\inst_dds|phase_post_offset1[9]~27\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_spi_slave_interface|register_phase1\(10),
	datab => \inst_dds|phase_accumulator1\(26),
	datad => VCC,
	cin => \inst_dds|phase_post_offset1[9]~27\,
	combout => \inst_dds|phase_post_offset1[10]~28_combout\,
	cout => \inst_dds|phase_post_offset1[10]~29\);

-- Location: FF_X17_Y21_N29
\inst_dds|phase_post_offset1[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_post_offset1[10]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_post_offset1\(10));

-- Location: LCCOMB_X15_Y21_N6
\inst_spi_slave_interface|register_freq1[27]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|register_freq1[27]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(27)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(27),
	combout => \inst_spi_slave_interface|register_freq1[27]~feeder_combout\);

-- Location: FF_X15_Y21_N7
\inst_spi_slave_interface|register_freq1[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|register_freq1[27]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|Decoder0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_freq1\(27));

-- Location: LCCOMB_X16_Y21_N26
\inst_dds|phase_accumulator1[27]~82\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_accumulator1[27]~82_combout\ = \inst_spi_slave_interface|register_freq1\(27) $ (\inst_dds|phase_accumulator1[26]~81\ $ (\inst_dds|phase_accumulator1\(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_spi_slave_interface|register_freq1\(27),
	datad => \inst_dds|phase_accumulator1\(27),
	cin => \inst_dds|phase_accumulator1[26]~81\,
	combout => \inst_dds|phase_accumulator1[27]~82_combout\);

-- Location: FF_X16_Y21_N27
\inst_dds|phase_accumulator1[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_accumulator1[27]~82_combout\,
	sclr => \ALT_INV_rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_accumulator1\(27));

-- Location: LCCOMB_X17_Y20_N10
\inst_spi_slave_interface|register_phase1[11]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|register_phase1[11]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(11)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(11),
	combout => \inst_spi_slave_interface|register_phase1[11]~feeder_combout\);

-- Location: FF_X17_Y20_N11
\inst_spi_slave_interface|register_phase1[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|register_phase1[11]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|Decoder0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_phase1\(11));

-- Location: LCCOMB_X17_Y21_N30
\inst_dds|phase_post_offset1[11]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|phase_post_offset1[11]~30_combout\ = \inst_dds|phase_accumulator1\(27) $ (\inst_dds|phase_post_offset1[10]~29\ $ (\inst_spi_slave_interface|register_phase1\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|phase_accumulator1\(27),
	datad => \inst_spi_slave_interface|register_phase1\(11),
	cin => \inst_dds|phase_post_offset1[10]~29\,
	combout => \inst_dds|phase_post_offset1[11]~30_combout\);

-- Location: FF_X17_Y21_N31
\inst_dds|phase_post_offset1[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|phase_post_offset1[11]~30_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|phase_post_offset1\(11));

-- Location: M9K_X13_Y19_N0
\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a0\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init2 => X"003F400FA003DC00F4003C000ED003A800E70039000E10037800DB0036000D50034800CF0033400CA0031C00C40030400BF002F000B9002DC00B4002C800AF00",
	mem_init1 => X"2B400AB002A000A60029000A200280009E00270009A0026000960025400930024400900023C008D00230008B0022800880021C00860021800850021000830020C00820020800820020400810020400810020400810020400820020800820020C00830021000850021800860021C008800228008B00230008D0023C009000244009300254009600260009A00270009E0028000A20029000A6002A000AB002B400AF002C800B4002DC00B9002F000BF0030400C40031C00CA0033400CF0034800D50036000DB0037800E10039000E7003A800ED003C000F4003DC00FA003F400000000C000600024000C00040001300058001900070001F000880025000A0002B0",
	mem_init0 => X"00B80031000CC0036000E4003C000FC004100110004700124004C0013800510014C005500160005A00170005E001800062001900066001A0006A001AC006D001BC0070001C40073001D00075001D80078001E4007A001E8007B001F0007D001F4007E001F8007E001FC007F001FC007F001FC007F001FC007E001F8007E001F4007D001F0007B001E8007A001E40078001D80075001D00073001C40070001BC006D001AC006A001A0006600190006200180005E00170005A0016000550014C005100138004C001240047001100041000FC003C000E40036000CC0031000B8002B000A0002500088001F00070001900058001300040000C0002400060000C0000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/test.ram0_dds_19a20.hdl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "dds:inst_dds|altsyncram:sine_memory_rtl_0|altsyncram_jnn1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "dont_care",
	operation_mode => "bidir_dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 8,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 18,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 255,
	port_a_logical_ram_depth => 256,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 8,
	port_b_data_in_clock => "clock0",
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 18,
	port_b_first_address => 0,
	port_b_first_bit_number => 0,
	port_b_last_address => 255,
	port_b_logical_ram_depth => 256,
	port_b_logical_ram_width => 8,
	port_b_read_during_write_mode => "new_data_with_nbe_read",
	port_b_read_enable_clock => "clock0",
	port_b_write_enable_clock => "clock0",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portare => VCC,
	portbwe => GND,
	portbre => VCC,
	clk0 => \clk~inputclkctrl_outclk\,
	portadatain => \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\,
	portbdatain => \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a0_PORTBDATAIN_bus\,
	portaaddr => \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\,
	portbaddr => \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a0_PORTADATAOUT_bus\,
	portbdataout => \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\);

-- Location: LCCOMB_X14_Y19_N10
\inst_dds|Add4~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|Add4~1_cout\ = CARRY((\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a0~portadataout\ & \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a0~PORTBDATAOUT0\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a0~portadataout\,
	datab => \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a0~PORTBDATAOUT0\,
	datad => VCC,
	cout => \inst_dds|Add4~1_cout\);

-- Location: LCCOMB_X14_Y19_N12
\inst_dds|sine_sum[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|sine_sum[1]~0_combout\ = (\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a1\ & ((\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a1~PORTBDATAOUT0\ & (\inst_dds|Add4~1_cout\ & VCC)) # 
-- (!\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a1~PORTBDATAOUT0\ & (!\inst_dds|Add4~1_cout\)))) # (!\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a1\ & ((\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a1~PORTBDATAOUT0\ & 
-- (!\inst_dds|Add4~1_cout\)) # (!\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a1~PORTBDATAOUT0\ & ((\inst_dds|Add4~1_cout\) # (GND)))))
-- \inst_dds|sine_sum[1]~1\ = CARRY((\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a1\ & (!\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a1~PORTBDATAOUT0\ & !\inst_dds|Add4~1_cout\)) # (!\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a1\ 
-- & ((!\inst_dds|Add4~1_cout\) # (!\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a1~PORTBDATAOUT0\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a1\,
	datab => \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a1~PORTBDATAOUT0\,
	datad => VCC,
	cin => \inst_dds|Add4~1_cout\,
	combout => \inst_dds|sine_sum[1]~0_combout\,
	cout => \inst_dds|sine_sum[1]~1\);

-- Location: LCCOMB_X14_Y19_N14
\inst_dds|sine_sum[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|sine_sum[2]~2_combout\ = ((\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a2~PORTBDATAOUT0\ $ (\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a2\ $ (!\inst_dds|sine_sum[1]~1\)))) # (GND)
-- \inst_dds|sine_sum[2]~3\ = CARRY((\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a2~PORTBDATAOUT0\ & ((\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a2\) # (!\inst_dds|sine_sum[1]~1\))) # 
-- (!\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a2~PORTBDATAOUT0\ & (\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a2\ & !\inst_dds|sine_sum[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a2~PORTBDATAOUT0\,
	datab => \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a2\,
	datad => VCC,
	cin => \inst_dds|sine_sum[1]~1\,
	combout => \inst_dds|sine_sum[2]~2_combout\,
	cout => \inst_dds|sine_sum[2]~3\);

-- Location: LCCOMB_X14_Y19_N16
\inst_dds|sine_sum[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|sine_sum[3]~4_combout\ = (\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a3~PORTBDATAOUT0\ & ((\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a3\ & (\inst_dds|sine_sum[2]~3\ & VCC)) # 
-- (!\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a3\ & (!\inst_dds|sine_sum[2]~3\)))) # (!\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a3~PORTBDATAOUT0\ & ((\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a3\ & 
-- (!\inst_dds|sine_sum[2]~3\)) # (!\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a3\ & ((\inst_dds|sine_sum[2]~3\) # (GND)))))
-- \inst_dds|sine_sum[3]~5\ = CARRY((\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a3~PORTBDATAOUT0\ & (!\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a3\ & !\inst_dds|sine_sum[2]~3\)) # 
-- (!\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a3~PORTBDATAOUT0\ & ((!\inst_dds|sine_sum[2]~3\) # (!\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a3\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a3~PORTBDATAOUT0\,
	datab => \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a3\,
	datad => VCC,
	cin => \inst_dds|sine_sum[2]~3\,
	combout => \inst_dds|sine_sum[3]~4_combout\,
	cout => \inst_dds|sine_sum[3]~5\);

-- Location: LCCOMB_X14_Y19_N18
\inst_dds|sine_sum[4]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|sine_sum[4]~6_combout\ = ((\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a4\ $ (\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a4~PORTBDATAOUT0\ $ (!\inst_dds|sine_sum[3]~5\)))) # (GND)
-- \inst_dds|sine_sum[4]~7\ = CARRY((\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a4\ & ((\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a4~PORTBDATAOUT0\) # (!\inst_dds|sine_sum[3]~5\))) # 
-- (!\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a4\ & (\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a4~PORTBDATAOUT0\ & !\inst_dds|sine_sum[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a4\,
	datab => \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a4~PORTBDATAOUT0\,
	datad => VCC,
	cin => \inst_dds|sine_sum[3]~5\,
	combout => \inst_dds|sine_sum[4]~6_combout\,
	cout => \inst_dds|sine_sum[4]~7\);

-- Location: LCCOMB_X14_Y19_N20
\inst_dds|sine_sum[5]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|sine_sum[5]~8_combout\ = (\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a5~PORTBDATAOUT0\ & ((\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a5\ & (\inst_dds|sine_sum[4]~7\ & VCC)) # 
-- (!\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a5\ & (!\inst_dds|sine_sum[4]~7\)))) # (!\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a5~PORTBDATAOUT0\ & ((\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a5\ & 
-- (!\inst_dds|sine_sum[4]~7\)) # (!\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a5\ & ((\inst_dds|sine_sum[4]~7\) # (GND)))))
-- \inst_dds|sine_sum[5]~9\ = CARRY((\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a5~PORTBDATAOUT0\ & (!\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a5\ & !\inst_dds|sine_sum[4]~7\)) # 
-- (!\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a5~PORTBDATAOUT0\ & ((!\inst_dds|sine_sum[4]~7\) # (!\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a5\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a5~PORTBDATAOUT0\,
	datab => \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a5\,
	datad => VCC,
	cin => \inst_dds|sine_sum[4]~7\,
	combout => \inst_dds|sine_sum[5]~8_combout\,
	cout => \inst_dds|sine_sum[5]~9\);

-- Location: LCCOMB_X14_Y19_N22
\inst_dds|sine_sum[6]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|sine_sum[6]~10_combout\ = ((\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a6\ $ (\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a6~PORTBDATAOUT0\ $ (!\inst_dds|sine_sum[5]~9\)))) # (GND)
-- \inst_dds|sine_sum[6]~11\ = CARRY((\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a6\ & ((\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a6~PORTBDATAOUT0\) # (!\inst_dds|sine_sum[5]~9\))) # 
-- (!\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a6\ & (\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a6~PORTBDATAOUT0\ & !\inst_dds|sine_sum[5]~9\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a6\,
	datab => \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a6~PORTBDATAOUT0\,
	datad => VCC,
	cin => \inst_dds|sine_sum[5]~9\,
	combout => \inst_dds|sine_sum[6]~10_combout\,
	cout => \inst_dds|sine_sum[6]~11\);

-- Location: LCCOMB_X14_Y19_N24
\inst_dds|sine_sum[7]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|sine_sum[7]~12_combout\ = (\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a7\ & ((\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a7~PORTBDATAOUT0\ & (\inst_dds|sine_sum[6]~11\ & VCC)) # 
-- (!\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a7~PORTBDATAOUT0\ & (!\inst_dds|sine_sum[6]~11\)))) # (!\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a7\ & ((\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a7~PORTBDATAOUT0\ & 
-- (!\inst_dds|sine_sum[6]~11\)) # (!\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a7~PORTBDATAOUT0\ & ((\inst_dds|sine_sum[6]~11\) # (GND)))))
-- \inst_dds|sine_sum[7]~13\ = CARRY((\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a7\ & (!\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a7~PORTBDATAOUT0\ & !\inst_dds|sine_sum[6]~11\)) # 
-- (!\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a7\ & ((!\inst_dds|sine_sum[6]~11\) # (!\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a7~PORTBDATAOUT0\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a7\,
	datab => \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a7~PORTBDATAOUT0\,
	datad => VCC,
	cin => \inst_dds|sine_sum[6]~11\,
	combout => \inst_dds|sine_sum[7]~12_combout\,
	cout => \inst_dds|sine_sum[7]~13\);

-- Location: LCCOMB_X14_Y19_N26
\inst_dds|sine_sum[8]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|sine_sum[8]~14_combout\ = \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a7\ $ (\inst_dds|sine_sum[7]~13\ $ (!\inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a7~PORTBDATAOUT0\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a7\,
	datad => \inst_dds|sine_memory_rtl_0|auto_generated|ram_block1a7~PORTBDATAOUT0\,
	cin => \inst_dds|sine_sum[7]~13\,
	combout => \inst_dds|sine_sum[8]~14_combout\);

-- Location: DSPMULT_X18_Y19_N0
\inst_dds|Mult0|auto_generated|mac_mult1\ : cycloneive_mac_mult
-- pragma translate_off
GENERIC MAP (
	dataa_clock => "none",
	dataa_width => 9,
	datab_clock => "none",
	datab_width => 9,
	signa_clock => "none",
	signb_clock => "none")
-- pragma translate_on
PORT MAP (
	signa => GND,
	signb => GND,
	dataa => \inst_dds|Mult0|auto_generated|mac_mult1_DATAA_bus\,
	datab => \inst_dds|Mult0|auto_generated|mac_mult1_DATAB_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	dataout => \inst_dds|Mult0|auto_generated|mac_mult1_DATAOUT_bus\);

-- Location: DSPOUT_X18_Y19_N2
\inst_dds|Mult0|auto_generated|mac_out2\ : cycloneive_mac_out
-- pragma translate_off
GENERIC MAP (
	dataa_width => 18,
	output_clock => "0")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	aclr => GND,
	ena => VCC,
	dataa => \inst_dds|Mult0|auto_generated|mac_out2_DATAA_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	dataout => \inst_dds|Mult0|auto_generated|mac_out2_DATAOUT_bus\);

-- Location: LCCOMB_X14_Y21_N26
\inst_spi_slave_interface|Decoder0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|Decoder0~1_combout\ = (\inst_spi_slave_interface|shift_register\(29) & (!\inst_spi_slave_interface|shift_register\(28) & (\inst_spi_slave_interface|shift_register\(30) & \inst_spi_slave_interface|Decoder0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_spi_slave_interface|shift_register\(29),
	datab => \inst_spi_slave_interface|shift_register\(28),
	datac => \inst_spi_slave_interface|shift_register\(30),
	datad => \inst_spi_slave_interface|Decoder0~0_combout\,
	combout => \inst_spi_slave_interface|Decoder0~1_combout\);

-- Location: FF_X17_Y19_N13
\inst_spi_slave_interface|register_offset[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(7),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|Decoder0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_offset\(7));

-- Location: FF_X17_Y19_N11
\inst_spi_slave_interface|register_offset[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(6),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|Decoder0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_offset\(6));

-- Location: FF_X17_Y19_N25
\inst_spi_slave_interface|register_offset[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(5),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|Decoder0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_offset\(5));

-- Location: FF_X17_Y19_N31
\inst_spi_slave_interface|register_offset[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(4),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|Decoder0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_offset\(4));

-- Location: FF_X17_Y19_N17
\inst_spi_slave_interface|register_offset[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(3),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|Decoder0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_offset\(3));

-- Location: FF_X17_Y19_N19
\inst_spi_slave_interface|register_offset[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \inst_spi_slave_interface|shift_register\(2),
	clrn => \rst_n~input_o\,
	sload => VCC,
	ena => \inst_spi_slave_interface|Decoder0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_offset\(2));

-- Location: LCCOMB_X17_Y19_N20
\inst_spi_slave_interface|register_offset[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|register_offset[1]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(1),
	combout => \inst_spi_slave_interface|register_offset[1]~feeder_combout\);

-- Location: FF_X17_Y19_N21
\inst_spi_slave_interface|register_offset[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|register_offset[1]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|Decoder0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_offset\(1));

-- Location: LCCOMB_X17_Y19_N26
\inst_spi_slave_interface|register_offset[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_spi_slave_interface|register_offset[0]~feeder_combout\ = \inst_spi_slave_interface|shift_register\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_spi_slave_interface|shift_register\(0),
	combout => \inst_spi_slave_interface|register_offset[0]~feeder_combout\);

-- Location: FF_X17_Y19_N27
\inst_spi_slave_interface|register_offset[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_spi_slave_interface|register_offset[0]~feeder_combout\,
	clrn => \rst_n~input_o\,
	ena => \inst_spi_slave_interface|Decoder0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_spi_slave_interface|register_offset\(0));

-- Location: LCCOMB_X17_Y22_N4
\inst_dds|sine_data_post_offset[0]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|sine_data_post_offset[0]~9_combout\ = (\inst_spi_slave_interface|register_offset\(0) & (\inst_dds|sine_data_post_gain\(8) $ (VCC))) # (!\inst_spi_slave_interface|register_offset\(0) & (\inst_dds|sine_data_post_gain\(8) & VCC))
-- \inst_dds|sine_data_post_offset[0]~10\ = CARRY((\inst_spi_slave_interface|register_offset\(0) & \inst_dds|sine_data_post_gain\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_spi_slave_interface|register_offset\(0),
	datab => \inst_dds|sine_data_post_gain\(8),
	datad => VCC,
	combout => \inst_dds|sine_data_post_offset[0]~9_combout\,
	cout => \inst_dds|sine_data_post_offset[0]~10\);

-- Location: LCCOMB_X17_Y22_N6
\inst_dds|sine_data_post_offset[1]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|sine_data_post_offset[1]~11_combout\ = (\inst_dds|sine_data_post_gain\(9) & ((\inst_spi_slave_interface|register_offset\(1) & (\inst_dds|sine_data_post_offset[0]~10\ & VCC)) # (!\inst_spi_slave_interface|register_offset\(1) & 
-- (!\inst_dds|sine_data_post_offset[0]~10\)))) # (!\inst_dds|sine_data_post_gain\(9) & ((\inst_spi_slave_interface|register_offset\(1) & (!\inst_dds|sine_data_post_offset[0]~10\)) # (!\inst_spi_slave_interface|register_offset\(1) & 
-- ((\inst_dds|sine_data_post_offset[0]~10\) # (GND)))))
-- \inst_dds|sine_data_post_offset[1]~12\ = CARRY((\inst_dds|sine_data_post_gain\(9) & (!\inst_spi_slave_interface|register_offset\(1) & !\inst_dds|sine_data_post_offset[0]~10\)) # (!\inst_dds|sine_data_post_gain\(9) & 
-- ((!\inst_dds|sine_data_post_offset[0]~10\) # (!\inst_spi_slave_interface|register_offset\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|sine_data_post_gain\(9),
	datab => \inst_spi_slave_interface|register_offset\(1),
	datad => VCC,
	cin => \inst_dds|sine_data_post_offset[0]~10\,
	combout => \inst_dds|sine_data_post_offset[1]~11_combout\,
	cout => \inst_dds|sine_data_post_offset[1]~12\);

-- Location: LCCOMB_X17_Y22_N8
\inst_dds|sine_data_post_offset[2]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|sine_data_post_offset[2]~13_combout\ = ((\inst_spi_slave_interface|register_offset\(2) $ (\inst_dds|sine_data_post_gain\(10) $ (!\inst_dds|sine_data_post_offset[1]~12\)))) # (GND)
-- \inst_dds|sine_data_post_offset[2]~14\ = CARRY((\inst_spi_slave_interface|register_offset\(2) & ((\inst_dds|sine_data_post_gain\(10)) # (!\inst_dds|sine_data_post_offset[1]~12\))) # (!\inst_spi_slave_interface|register_offset\(2) & 
-- (\inst_dds|sine_data_post_gain\(10) & !\inst_dds|sine_data_post_offset[1]~12\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_spi_slave_interface|register_offset\(2),
	datab => \inst_dds|sine_data_post_gain\(10),
	datad => VCC,
	cin => \inst_dds|sine_data_post_offset[1]~12\,
	combout => \inst_dds|sine_data_post_offset[2]~13_combout\,
	cout => \inst_dds|sine_data_post_offset[2]~14\);

-- Location: LCCOMB_X17_Y22_N10
\inst_dds|sine_data_post_offset[3]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|sine_data_post_offset[3]~15_combout\ = (\inst_spi_slave_interface|register_offset\(3) & ((\inst_dds|sine_data_post_gain\(11) & (\inst_dds|sine_data_post_offset[2]~14\ & VCC)) # (!\inst_dds|sine_data_post_gain\(11) & 
-- (!\inst_dds|sine_data_post_offset[2]~14\)))) # (!\inst_spi_slave_interface|register_offset\(3) & ((\inst_dds|sine_data_post_gain\(11) & (!\inst_dds|sine_data_post_offset[2]~14\)) # (!\inst_dds|sine_data_post_gain\(11) & 
-- ((\inst_dds|sine_data_post_offset[2]~14\) # (GND)))))
-- \inst_dds|sine_data_post_offset[3]~16\ = CARRY((\inst_spi_slave_interface|register_offset\(3) & (!\inst_dds|sine_data_post_gain\(11) & !\inst_dds|sine_data_post_offset[2]~14\)) # (!\inst_spi_slave_interface|register_offset\(3) & 
-- ((!\inst_dds|sine_data_post_offset[2]~14\) # (!\inst_dds|sine_data_post_gain\(11)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_spi_slave_interface|register_offset\(3),
	datab => \inst_dds|sine_data_post_gain\(11),
	datad => VCC,
	cin => \inst_dds|sine_data_post_offset[2]~14\,
	combout => \inst_dds|sine_data_post_offset[3]~15_combout\,
	cout => \inst_dds|sine_data_post_offset[3]~16\);

-- Location: LCCOMB_X17_Y22_N12
\inst_dds|sine_data_post_offset[4]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|sine_data_post_offset[4]~17_combout\ = ((\inst_dds|sine_data_post_gain\(12) $ (\inst_spi_slave_interface|register_offset\(4) $ (!\inst_dds|sine_data_post_offset[3]~16\)))) # (GND)
-- \inst_dds|sine_data_post_offset[4]~18\ = CARRY((\inst_dds|sine_data_post_gain\(12) & ((\inst_spi_slave_interface|register_offset\(4)) # (!\inst_dds|sine_data_post_offset[3]~16\))) # (!\inst_dds|sine_data_post_gain\(12) & 
-- (\inst_spi_slave_interface|register_offset\(4) & !\inst_dds|sine_data_post_offset[3]~16\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|sine_data_post_gain\(12),
	datab => \inst_spi_slave_interface|register_offset\(4),
	datad => VCC,
	cin => \inst_dds|sine_data_post_offset[3]~16\,
	combout => \inst_dds|sine_data_post_offset[4]~17_combout\,
	cout => \inst_dds|sine_data_post_offset[4]~18\);

-- Location: LCCOMB_X17_Y22_N14
\inst_dds|sine_data_post_offset[5]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|sine_data_post_offset[5]~19_combout\ = (\inst_dds|sine_data_post_gain\(13) & ((\inst_spi_slave_interface|register_offset\(5) & (\inst_dds|sine_data_post_offset[4]~18\ & VCC)) # (!\inst_spi_slave_interface|register_offset\(5) & 
-- (!\inst_dds|sine_data_post_offset[4]~18\)))) # (!\inst_dds|sine_data_post_gain\(13) & ((\inst_spi_slave_interface|register_offset\(5) & (!\inst_dds|sine_data_post_offset[4]~18\)) # (!\inst_spi_slave_interface|register_offset\(5) & 
-- ((\inst_dds|sine_data_post_offset[4]~18\) # (GND)))))
-- \inst_dds|sine_data_post_offset[5]~20\ = CARRY((\inst_dds|sine_data_post_gain\(13) & (!\inst_spi_slave_interface|register_offset\(5) & !\inst_dds|sine_data_post_offset[4]~18\)) # (!\inst_dds|sine_data_post_gain\(13) & 
-- ((!\inst_dds|sine_data_post_offset[4]~18\) # (!\inst_spi_slave_interface|register_offset\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|sine_data_post_gain\(13),
	datab => \inst_spi_slave_interface|register_offset\(5),
	datad => VCC,
	cin => \inst_dds|sine_data_post_offset[4]~18\,
	combout => \inst_dds|sine_data_post_offset[5]~19_combout\,
	cout => \inst_dds|sine_data_post_offset[5]~20\);

-- Location: LCCOMB_X17_Y22_N16
\inst_dds|sine_data_post_offset[6]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|sine_data_post_offset[6]~21_combout\ = ((\inst_spi_slave_interface|register_offset\(6) $ (\inst_dds|sine_data_post_gain\(14) $ (!\inst_dds|sine_data_post_offset[5]~20\)))) # (GND)
-- \inst_dds|sine_data_post_offset[6]~22\ = CARRY((\inst_spi_slave_interface|register_offset\(6) & ((\inst_dds|sine_data_post_gain\(14)) # (!\inst_dds|sine_data_post_offset[5]~20\))) # (!\inst_spi_slave_interface|register_offset\(6) & 
-- (\inst_dds|sine_data_post_gain\(14) & !\inst_dds|sine_data_post_offset[5]~20\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_spi_slave_interface|register_offset\(6),
	datab => \inst_dds|sine_data_post_gain\(14),
	datad => VCC,
	cin => \inst_dds|sine_data_post_offset[5]~20\,
	combout => \inst_dds|sine_data_post_offset[6]~21_combout\,
	cout => \inst_dds|sine_data_post_offset[6]~22\);

-- Location: LCCOMB_X17_Y22_N18
\inst_dds|sine_data_post_offset[7]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|sine_data_post_offset[7]~23_combout\ = (\inst_dds|sine_data_post_gain\(15) & ((\inst_spi_slave_interface|register_offset\(7) & (\inst_dds|sine_data_post_offset[6]~22\ & VCC)) # (!\inst_spi_slave_interface|register_offset\(7) & 
-- (!\inst_dds|sine_data_post_offset[6]~22\)))) # (!\inst_dds|sine_data_post_gain\(15) & ((\inst_spi_slave_interface|register_offset\(7) & (!\inst_dds|sine_data_post_offset[6]~22\)) # (!\inst_spi_slave_interface|register_offset\(7) & 
-- ((\inst_dds|sine_data_post_offset[6]~22\) # (GND)))))
-- \inst_dds|sine_data_post_offset[7]~24\ = CARRY((\inst_dds|sine_data_post_gain\(15) & (!\inst_spi_slave_interface|register_offset\(7) & !\inst_dds|sine_data_post_offset[6]~22\)) # (!\inst_dds|sine_data_post_gain\(15) & 
-- ((!\inst_dds|sine_data_post_offset[6]~22\) # (!\inst_spi_slave_interface|register_offset\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|sine_data_post_gain\(15),
	datab => \inst_spi_slave_interface|register_offset\(7),
	datad => VCC,
	cin => \inst_dds|sine_data_post_offset[6]~22\,
	combout => \inst_dds|sine_data_post_offset[7]~23_combout\,
	cout => \inst_dds|sine_data_post_offset[7]~24\);

-- Location: FF_X17_Y22_N19
\inst_dds|sine_data_post_offset[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|sine_data_post_offset[7]~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|sine_data_post_offset\(7));

-- Location: LCCOMB_X17_Y22_N20
\inst_dds|sine_data_post_offset[8]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|sine_data_post_offset[8]~25_combout\ = \inst_spi_slave_interface|register_offset\(7) $ (\inst_dds|sine_data_post_offset[7]~24\ $ (!\inst_dds|sine_data_post_gain\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_spi_slave_interface|register_offset\(7),
	datad => \inst_dds|sine_data_post_gain\(15),
	cin => \inst_dds|sine_data_post_offset[7]~24\,
	combout => \inst_dds|sine_data_post_offset[8]~25_combout\);

-- Location: FF_X17_Y22_N21
\inst_dds|sine_data_post_offset[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|sine_data_post_offset[8]~25_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|sine_data_post_offset\(8));

-- Location: FF_X17_Y22_N5
\inst_dds|sine_data_post_offset[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|sine_data_post_offset[0]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|sine_data_post_offset\(0));

-- Location: LCCOMB_X14_Y22_N24
\inst_dds|sine_data_post_offset_satured~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|sine_data_post_offset_satured~0_combout\ = (\inst_dds|sine_data_post_offset\(7) & ((\inst_dds|sine_data_post_offset\(0)) # (!\inst_dds|sine_data_post_offset\(8)))) # (!\inst_dds|sine_data_post_offset\(7) & (!\inst_dds|sine_data_post_offset\(8) & 
-- \inst_dds|sine_data_post_offset\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|sine_data_post_offset\(7),
	datac => \inst_dds|sine_data_post_offset\(8),
	datad => \inst_dds|sine_data_post_offset\(0),
	combout => \inst_dds|sine_data_post_offset_satured~0_combout\);

-- Location: FF_X14_Y22_N25
\inst_dds|sine_data_post_offset_satured[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|sine_data_post_offset_satured~0_combout\,
	ena => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|sine_data_post_offset_satured\(0));

-- Location: FF_X17_Y22_N7
\inst_dds|sine_data_post_offset[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|sine_data_post_offset[1]~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|sine_data_post_offset\(1));

-- Location: LCCOMB_X14_Y22_N2
\inst_dds|sine_data_post_offset_satured~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|sine_data_post_offset_satured~1_combout\ = (\inst_dds|sine_data_post_offset\(7) & ((\inst_dds|sine_data_post_offset\(1)) # (!\inst_dds|sine_data_post_offset\(8)))) # (!\inst_dds|sine_data_post_offset\(7) & (!\inst_dds|sine_data_post_offset\(8) & 
-- \inst_dds|sine_data_post_offset\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|sine_data_post_offset\(7),
	datac => \inst_dds|sine_data_post_offset\(8),
	datad => \inst_dds|sine_data_post_offset\(1),
	combout => \inst_dds|sine_data_post_offset_satured~1_combout\);

-- Location: FF_X14_Y22_N3
\inst_dds|sine_data_post_offset_satured[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|sine_data_post_offset_satured~1_combout\,
	ena => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|sine_data_post_offset_satured\(1));

-- Location: FF_X17_Y22_N9
\inst_dds|sine_data_post_offset[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|sine_data_post_offset[2]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|sine_data_post_offset\(2));

-- Location: LCCOMB_X14_Y22_N0
\inst_dds|sine_data_post_offset_satured~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|sine_data_post_offset_satured~2_combout\ = (\inst_dds|sine_data_post_offset\(7) & ((\inst_dds|sine_data_post_offset\(2)) # (!\inst_dds|sine_data_post_offset\(8)))) # (!\inst_dds|sine_data_post_offset\(7) & (!\inst_dds|sine_data_post_offset\(8) & 
-- \inst_dds|sine_data_post_offset\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|sine_data_post_offset\(7),
	datac => \inst_dds|sine_data_post_offset\(8),
	datad => \inst_dds|sine_data_post_offset\(2),
	combout => \inst_dds|sine_data_post_offset_satured~2_combout\);

-- Location: FF_X14_Y22_N1
\inst_dds|sine_data_post_offset_satured[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|sine_data_post_offset_satured~2_combout\,
	ena => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|sine_data_post_offset_satured\(2));

-- Location: FF_X17_Y22_N11
\inst_dds|sine_data_post_offset[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|sine_data_post_offset[3]~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|sine_data_post_offset\(3));

-- Location: LCCOMB_X14_Y22_N26
\inst_dds|sine_data_post_offset_satured~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|sine_data_post_offset_satured~3_combout\ = (\inst_dds|sine_data_post_offset\(7) & ((\inst_dds|sine_data_post_offset\(3)) # (!\inst_dds|sine_data_post_offset\(8)))) # (!\inst_dds|sine_data_post_offset\(7) & (!\inst_dds|sine_data_post_offset\(8) & 
-- \inst_dds|sine_data_post_offset\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|sine_data_post_offset\(7),
	datac => \inst_dds|sine_data_post_offset\(8),
	datad => \inst_dds|sine_data_post_offset\(3),
	combout => \inst_dds|sine_data_post_offset_satured~3_combout\);

-- Location: FF_X14_Y22_N27
\inst_dds|sine_data_post_offset_satured[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|sine_data_post_offset_satured~3_combout\,
	ena => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|sine_data_post_offset_satured\(3));

-- Location: FF_X17_Y22_N13
\inst_dds|sine_data_post_offset[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|sine_data_post_offset[4]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|sine_data_post_offset\(4));

-- Location: LCCOMB_X14_Y22_N12
\inst_dds|sine_data_post_offset_satured~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|sine_data_post_offset_satured~4_combout\ = (\inst_dds|sine_data_post_offset\(7) & ((\inst_dds|sine_data_post_offset\(4)) # (!\inst_dds|sine_data_post_offset\(8)))) # (!\inst_dds|sine_data_post_offset\(7) & (!\inst_dds|sine_data_post_offset\(8) & 
-- \inst_dds|sine_data_post_offset\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|sine_data_post_offset\(7),
	datac => \inst_dds|sine_data_post_offset\(8),
	datad => \inst_dds|sine_data_post_offset\(4),
	combout => \inst_dds|sine_data_post_offset_satured~4_combout\);

-- Location: FF_X14_Y22_N13
\inst_dds|sine_data_post_offset_satured[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|sine_data_post_offset_satured~4_combout\,
	ena => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|sine_data_post_offset_satured\(4));

-- Location: FF_X17_Y22_N15
\inst_dds|sine_data_post_offset[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|sine_data_post_offset[5]~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|sine_data_post_offset\(5));

-- Location: LCCOMB_X14_Y22_N14
\inst_dds|sine_data_post_offset_satured~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|sine_data_post_offset_satured~5_combout\ = (\inst_dds|sine_data_post_offset\(7) & ((\inst_dds|sine_data_post_offset\(5)) # (!\inst_dds|sine_data_post_offset\(8)))) # (!\inst_dds|sine_data_post_offset\(7) & (!\inst_dds|sine_data_post_offset\(8) & 
-- \inst_dds|sine_data_post_offset\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|sine_data_post_offset\(7),
	datac => \inst_dds|sine_data_post_offset\(8),
	datad => \inst_dds|sine_data_post_offset\(5),
	combout => \inst_dds|sine_data_post_offset_satured~5_combout\);

-- Location: FF_X14_Y22_N15
\inst_dds|sine_data_post_offset_satured[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|sine_data_post_offset_satured~5_combout\,
	ena => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|sine_data_post_offset_satured\(5));

-- Location: FF_X17_Y22_N17
\inst_dds|sine_data_post_offset[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|sine_data_post_offset[6]~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|sine_data_post_offset\(6));

-- Location: LCCOMB_X14_Y22_N4
\inst_dds|sine_data_post_offset_satured~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|sine_data_post_offset_satured~6_combout\ = (\inst_dds|sine_data_post_offset\(7) & ((\inst_dds|sine_data_post_offset\(6)) # (!\inst_dds|sine_data_post_offset\(8)))) # (!\inst_dds|sine_data_post_offset\(7) & (!\inst_dds|sine_data_post_offset\(8) & 
-- \inst_dds|sine_data_post_offset\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_dds|sine_data_post_offset\(7),
	datac => \inst_dds|sine_data_post_offset\(8),
	datad => \inst_dds|sine_data_post_offset\(6),
	combout => \inst_dds|sine_data_post_offset_satured~6_combout\);

-- Location: FF_X14_Y22_N5
\inst_dds|sine_data_post_offset_satured[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|sine_data_post_offset_satured~6_combout\,
	ena => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|sine_data_post_offset_satured\(6));

-- Location: LCCOMB_X14_Y20_N12
\inst_dds|sine_data_post_offset_satured[7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_dds|sine_data_post_offset_satured[7]~feeder_combout\ = \inst_dds|sine_data_post_offset\(8)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst_dds|sine_data_post_offset\(8),
	combout => \inst_dds|sine_data_post_offset_satured[7]~feeder_combout\);

-- Location: FF_X14_Y20_N13
\inst_dds|sine_data_post_offset_satured[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \inst_dds|sine_data_post_offset_satured[7]~feeder_combout\,
	ena => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_dds|sine_data_post_offset_satured\(7));

-- Location: IOIBUF_X19_Y29_N15
\fselect~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_fselect,
	o => \fselect~input_o\);

-- Location: IOIBUF_X19_Y29_N22
\pselect~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pselect,
	o => \pselect~input_o\);

ww_dds_output(0) <= \dds_output[0]~output_o\;

ww_dds_output(1) <= \dds_output[1]~output_o\;

ww_dds_output(2) <= \dds_output[2]~output_o\;

ww_dds_output(3) <= \dds_output[3]~output_o\;

ww_dds_output(4) <= \dds_output[4]~output_o\;

ww_dds_output(5) <= \dds_output[5]~output_o\;

ww_dds_output(6) <= \dds_output[6]~output_o\;

ww_dds_output(7) <= \dds_output[7]~output_o\;
END structure;


