library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity subFullAdder is
    Port ( 
        a, b, cin : in std_logic;
        s, cout   : out std_logic);
end subFullAdder;

architecture Behavioral of subFullAdder is


signal c0, c1, s0, s1 : std_logic;
    
    component subHalfAdder is 
        Port( 
            a, b : in std_logic;
            sum, carry   : out std_logic);
    end component;
    
    begin
    
    HA1: subHalfAdder port map(a, b, s0, c0);
    HA2: subHalfAdder port map(cin, s0, s1, c1);
    s <= s1;
    cout <= c0 or c1;
    
end Behavioral;
