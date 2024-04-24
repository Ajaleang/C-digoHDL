library ieee;
use ieee.std_logic_1164.all;

entity sumador is
    port (
        a    : in  std_logic;
        b    : in  std_logic;
        cin  : in  std_logic;
        sum  : out std_logic;
        cout : out std_logic
    );
end entity sumador;

architecture behavioral of sumador is
begin
    sum <= a xor b xor cin;
    cout <= (a and b) or (cin and (a xor b));
end architecture behavioral;
