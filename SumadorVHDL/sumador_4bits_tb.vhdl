
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sumador4bits_tb is end;

architecture bench of sumador4bits_tb is
  signal a : std_logic_vector(3 downto 0);
  signal b : std_logic_vector(3 downto 0);
  signal cin : std_logic;
  signal sum : std_logic_vector(3 downto 0);
  signal cout : std_logic;
begin

  sumador4bits_inst : entity work.sumador4bits
  port map (
    a => a,
    b => b,
    cin => cin,
    sum => sum,
    cout => cout
  );
-- clk <= not clk after clk_period/2;
process
begin
  -- Test case 1
  a    <= "0000";
  b    <= "0000";
  cin  <= '0';
  wait for 10 ns;
  -- Test case 2
  a    <= "1111";
  b    <= "0000";
  cin  <= '1';
  wait for 10 ns;
  -- Test case 3
  a    <= "0011";
  b    <= "1100";
  cin  <= '1';
  wait for 10 ns;
  -- Test case 4
  a    <= "0001";
  b    <= "0001";
  cin  <= '0';
  wait for 10 ns;
  -- Test case 5
  a    <= "0101";
  b    <= "1010";
  cin  <= '0';
  wait for 10 ns;
  -- Test case 6
  a    <= "1001";
  b    <= "0110";
  cin  <= '1';
  wait for 10 ns;
  -- Test case 7
  a    <= "1100";
  b    <= "0011";
  cin  <= '0';
  wait for 10 ns;
  -- Test case 8
  a    <= "1111";
  b    <= "1111";
  cin  <= '1';
  wait for 10 ns;
  -- Add more test cases as needed
  
  wait;
end process;

end;