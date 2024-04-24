library ieee;
use ieee.std_logic_1164.all;

entity sumador4bits is
    port (
        a     : in  std_logic_vector(3 downto 0);
        b     : in  std_logic_vector(3 downto 0);
        cin   : in  std_logic;
        sum   : out std_logic_vector(3 downto 0);
        cout  : out std_logic
    );
end entity sumador4bits;

architecture behavioral of sumador4bits is
    signal c   : std_logic_vector(3 downto 0);
    signal s   : std_logic_vector(3 downto 0);
begin
    -- Instancias de sumador de 1 bit
    sumador_bit0 : entity work.sumador port map(a(0), b(0), cin, s(0), c(0));
    sumador_bit1 : entity work.sumador port map(a(1), b(1), c(0), s(1), c(1));
    sumador_bit2 : entity work.sumador port map(a(2), b(2), c(1), s(2), c(2));
    sumador_bit3 : entity work.sumador port map(a(3), b(3), c(2), s(3), c(3));

    -- Salidas
    sum <= s;
    cout <= c(3);
end architecture behavioral;
