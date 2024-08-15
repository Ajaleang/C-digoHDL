library ieee;
use ieee.std_logic_1164.all;

entity LSFR is
    port (
        clk : in std_logic;
        rst : in std_logic;
        lfsr_o : out std_logic_vector(2 downto 0)
    );
end LSFR;

architecture Behavioral of LSFR is
    signal lfsr_int : std_logic_vector(2 downto 0);
begin
    process(clk, rst)
    begin
        if rst = '1' then
            lfsr_int <= "000";
        elsif rising_edge(clk) then
            lfsr_int(2 downto 1) <= lfsr_int(1 downto 0);
            lfsr_int(0) <= not(lfsr_int(2) xor lfsr_int(1));
        end if;
    end process;

    lfsr_o <= lfsr_int;
end Behavioral;