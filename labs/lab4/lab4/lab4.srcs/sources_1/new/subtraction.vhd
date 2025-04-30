library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity subtraction is
    Port (a, b: in std_logic_vector (5 downto 0);
          difference : out std_logic_vector (5 downto 0));
end subtraction;

architecture Behavioral of subtraction is
    
    component subFullAdder is
         Port ( 
                a, b, cin : in std_logic;
                s, cout   : out std_logic);
    end component;
    
    signal c0, c1, c2, c3, c4, c5 : std_logic;
    signal s0, s1, s2, s3, s4, s5 : std_logic;
    begin
    
    FA1: subFullAdder port map (a(0), not(b(0)), '1', s0, c0);   
    FA2: subFullAdder port map (a(1), not(b(1)), c0, s1, c1);    
    FA3: subFullAdder port map (a(2), not(b(2)), c1, s2, c2);    
    FA4: subFullAdder port map (a(3), not(b(3)), c2, s3, c3);    
    FA5: subFullAdder port map (a(4), not(b(4)), c3, s4, c4);    
    FA6: subFullAdder port map (a(5), not(b(5)), c4, s5, c5);     
     
    difference(0) <= s0;
    difference(1) <= s1;
    difference(2) <= s2;
    difference(3) <= s3;
    difference(4) <= s4;
    difference(5) <= s5;
    
end Behavioral;
