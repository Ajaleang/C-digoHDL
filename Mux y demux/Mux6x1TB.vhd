library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Mux6to1_tb is
end entity;

architecture bench of Mux6to1_tb is
  -- Signal Declarations
  signal sel : STD_LOGIC_VECTOR(2 downto 0);
  signal d0, d1, d2, d3, d4, d5 : STD_LOGIC;
  signal y : STD_LOGIC;

begin

  -- Instantiate the Unit Under Test (UUT)
  Mux6to1_inst : entity work.Mux6to1
  port map (
    sel => sel,
    d0 => d0,
    d1 => d1,
    d2 => d2,
    d3 => d3,
    d4 => d4,
    d5 => d5,
    y => y
  );

  -- Test process
  stim_proc: process
  begin
    -- Initialize inputs
    d0 <= '0'; d1 <= '1'; d2 <= '0'; d3 <= '0'; d4 <= '1'; d5 <= '1';
    sel <= "000"; wait for 10 ns;
    
    -- Apply test vectors
    d0 <= '1'; wait for 10 ns;
sel <= "001"; wait for 10 ns;
sel <= "010"; wait for 10 ns;
sel <= "011"; wait for 10 ns;
sel <= "100"; wait for 10 ns;
sel <= "101"; wait for 10 ns;

    -- Add additional test cases as needed
    -- Continue simulation
    wait for 100 ns;
    
    -- Finish simulation
    wait;
  end process;

end architecture;
