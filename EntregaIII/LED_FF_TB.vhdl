library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity LED_FF_tb is
end;

architecture bench of LED_FF_tb is
  -- Clock period
  constant clk_period : time := 1 ns;
  -- Generics
  -- Ports
  signal i_Clk : std_logic := '0'; -- Initialize clock signal
  signal i_Switch_1 : std_logic := '0'; -- Initialize switch signal
  signal o_LED_1 : std_logic;

  component LED_FF
    port (
      i_Clk : in std_logic;
      i_Switch_1 : in std_logic;
      o_LED_1 : out std_logic
    );
  end component;

begin

  LED_FF_inst : LED_FF
  port map (
    i_Clk => i_Clk,
    i_Switch_1 => i_Switch_1,
    o_LED_1 => o_LED_1
  );

  -- Clock process (generate clock signal)
  clk_process: process
  begin
    wait for clk_period / 2;
    i_Clk <= not i_Clk;
  end process clk_process;

  -- Test stimulus process
  stimulus_process: process
  begin
    wait for 2 ns; -- Initial delay to allow clock to start toggling
    i_Switch_1 <= '1'; -- Set switch to '1'
    wait for 2 ns; -- Wait for a period
    i_Switch_1 <= '0'; -- Set switch to '0'
    wait for 5 ns; -- Wait for a period
    i_Switch_1 <= '1'; -- Set switch to '1'
    wait for 2 ns; -- Wait for a period
    i_Switch_1 <= '0'; -- Set switch to '0'
    wait for 5 ns; -- Wait for a period
    i_Switch_1 <= '1'; -- Set switch to '1'
    wait for 2 ns; -- Wait for a period
    i_Switch_1 <= '0'; -- Set switch to '0'
    wait; -- Wait indefinitely
  end process stimulus_process;

end bench;
