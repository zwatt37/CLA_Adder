
library ieee;
use ieee.std_logic_1164.all;
 
entity carry_lookahead_adder_tb is
end carry_lookahead_adder_tb;
 
architecture behave of carry_lookahead_adder_tb is
 
  constant c_WIDTH : integer := 32;
   
  signal r_ADD_1  : std_logic_vector(c_WIDTH-1 downto 0) := (others => '0');
  signal r_ADD_2  : std_logic_vector(c_WIDTH-1 downto 0) := (others => '0');
  signal w_RESULT : std_logic_vector(c_WIDTH-1 downto 0);
  signal w_COUT   : std_logic;
 
 
  component carry_lookahead_adder is
    generic (
      g_WIDTH : natural
      );
    port (
      i_add1   : in  std_logic_vector(g_WIDTH-1 downto 0);
      i_add2   : in  std_logic_vector(g_WIDTH-1 downto 0);
      --
      o_result : out std_logic_vector(g_WIDTH downto 0);
      o_cout   : out std_logic
      );
  end component carry_lookahead_adder;
   
begin
 
  -- Instantiate the Unit Under Test (UUT)
  UUT : carry_lookahead_adder
    generic map (
      g_WIDTH     => c_WIDTH
      )
    port map (
      i_add1   => r_ADD_1,
      i_add2   => r_ADD_2,
      o_result => w_RESULT,
      o_cout => w_COUT
      );
 
   
  -- Test bench is non-synthesizable
  process is
  begin
    r_ADD_1 <= "11111111111111111111111111111111";
    r_ADD_2 <= "00000000000000000000000000000000";
    wait for 500 ns;
    r_ADD_1 <= "00000000000000000000000000001000";
    r_ADD_2 <= "00000000000000000000000000000010";
    wait for 50 ns;
    r_ADD_1 <= "00000000000000000001000000000001";
    r_ADD_2 <= "00000000000000000000010000000000";
    wait for 50 ns;
    r_ADD_1 <= "00000000000000000011000000000010";
    r_ADD_2 <= "00000000000000001000010000000010";
    wait for 50 ns;
  end process;
   
end behave;