library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux6to1 is
    Port ( 
        sel : in STD_LOGIC_VECTOR(2 downto 0);
        d0, d1, d2, d3, d4, d5 : in STD_LOGIC;
        y : out STD_LOGIC
    );
end Mux6to1;

architecture Behavioral of Mux6to1 is
begin
    process(sel, d0, d1, d2, d3, d4, d5)
    begin
        case sel is
            when "000" => y <= d0;
            when "001" => y <= d1;
            when "010" => y <= d2;
            when "011" => y <= d3;
            when "100" => y <= d4;
            when "101" => y <= d5;
            when others => y <= '0'; -- Default case
        end case;
    end process;
end Behavioral;
