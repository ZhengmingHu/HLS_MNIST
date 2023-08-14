Library ieee;
use ieee.std_logic_1164.all;

entity lenet5_facc_32ns_32ns_1ns_32_5_no_dsp_1 is
   generic (
       DWIDTH : integer :=32
   );
   port (
       clk : in std_logic;
       reset : in std_logic;
       ce : in std_logic;
       in_data : in std_logic_vector(DWIDTH-1 downto 0);
       in_last : in std_logic_vector(0 downto 0);
       in_valid : in std_logic;
       out_data : out std_logic_vector(DWIDTH-1 downto 0)
   );
end entity;

architecture arch of lenet5_facc_32ns_32ns_1ns_32_5_no_dsp_1 is
   component FAcc is
       port (
           aclk : in std_logic;
           aclken : in std_logic;
           aresetn : in std_logic;
           s_axis_a_tvalid : in std_logic;
           s_axis_a_tlast : in std_logic;
           s_axis_a_tdata : in std_logic_vector(DWIDTH-1 downto 0);
           m_axis_result_tvalid : out std_logic;
           m_axis_result_tlast : out std_logic;
           m_axis_result_tdata : out std_logic_vector(DWIDTH-1 downto 0)
       );
   end component;
   signal in_data_tmp : std_logic_vector(DWIDTH-1 downto 0);
   signal in_last_tmp :  std_logic;
   signal dout_valid : std_logic;
   signal dout_last  : std_logic;
   signal reset_invert : std_logic;
begin
   FAcc_u : component FAcc
   port map (
       aclk => clk,
       aclken => ce,
       aresetn => reset_invert,
       s_axis_a_tvalid => in_valid,
       s_axis_a_tlast => in_last_tmp,
       s_axis_a_tdata => in_data_tmp,
       m_axis_result_tvalid => dout_valid,
       m_axis_result_tlast => dout_last,
       m_axis_result_tdata => out_data
   );
   reset_invert <= not reset;
   in_last_tmp <= in_last(0);
   in_data_tmp <= (others => '0') when (in_valid = '0') else in_data;
end architecture;
