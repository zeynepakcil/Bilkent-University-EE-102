library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity addition is
    Port ( 
        a: in std_logic_vector (5 downto 0);
        b: in std_logic_vector (5 downto 0);
        result   : out std_logic_vector (5 downto 0));
end addition;

architecture Behavioral of addition is
    
    component fullAdder is
        Port ( 
            a, b, cin : in std_logic;
            s, cout   : out std_logic);
    end component;
    
    signal cin: std_logic := '0';
    signal c0, c1, c2, c3, c4, c5 : std_logic;
    signal s0, s1, s2, s3, s4, s5 : std_logic;
    
    begin
    
    FA0: fullAdder port map (a(0), b(0), cin, s0, c0);
    FA1: fullAdder port map (a(1), b(1), c0, s1, c1);
    FA2: fullAdder port map (a(2), b(2), c1, s2, c2);
    FA3: fullAdder port map (a(3), b(3), c2, s3, c3);
    FA4: fullAdder port map (a(4), b(4), c3, s4, c4);
    FA5: fullAdder port map (a(5), b(5), c4, s5, c5);
   
    result(0) <= s0;
    result(1) <= s1;
    result(2) <= s2;
    result(3) <= s3;
    result(4) <= s4;
    result(5) <= s5;
    
end Behavioral;
