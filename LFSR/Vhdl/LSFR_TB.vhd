library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity LSFR_TB is
end LSFR_TB;

architecture Behavioral of LSFR_TB is
    signal clk : std_logic := '1';
    signal rst : std_logic := '1';
    signal lfsr_o : std_logic_vector(2 downto 0);

    component LSFR is
        port (
            clk : in std_logic;
            rst : in std_logic;
            lfsr_o : out std_logic_vector(2 downto 0)
        );
    end component;

begin
    lfsr_inst: LSFR port map (
        clk => clk,
        rst => rst,
        lfsr_o => lfsr_o
    );

    clk_process : process
    begin
        wait for 5 ns;
        clk <= not clk;
    end process;

    stimulus : process
    begin
        wait for 50 ns;
        rst <= '0';
        wait for 50 ns;
        rst <= '0';
        wait for 50 ns;
        rst <= '1';
        wait for 100 ns;
		report "LSFR_TB_VHD";
        wait;
		
    end process;
end Behavioral;