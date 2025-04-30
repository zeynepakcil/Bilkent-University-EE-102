
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity comparator is
       Port ( 
        a, b: in std_logic_vector (5 downto 0);
        s   : out std_logic_vector (5 downto 0));
end comparator;

architecture Behavioral of comparator is
    
    signal i0 : std_logic := a(0) xnor b(0);
    signal i1 : std_logic := a(1) xnor b(1);
    signal i2 : std_logic := a(2) xnor b(2);
    signal i3 : std_logic := a(3) xnor b(3);
    signal i4 : std_logic := a(4) xnor b(4);
    signal i5 : std_logic := a(5) xnor b(5);
    
    signal AeqB : std_logic;
    signal AgtB : std_logic;
    signal AltB : std_logic; 
    
    signal pos1 : std_logic;
    signal pos2 : std_logic;
    signal pos3 : std_logic; 
    signal pos4 : std_logic;
    signal pos5 : std_logic;
    signal pos6 : std_logic;

begin

    AeqB <= i5 and i4 and i3 and i2 and i1 and i0;
    
    pos1 <= a(5) and not b(5);
    pos2 <= i5 and a(4) and (not b(4));
    pos3 <= i5 and i4 and a(3) and (not b(3));
    pos4 <= i5 and i4 and i3 and a(2) and (not b(2));
    pos5 <= i5 and i4 and i3 and i2 and a(1) and (not b(1));
    pos6 <= i5 and i4 and i3 and i2 and i1 and a(0) and (not b(0));
    
   
    AgtB <= (pos1) or (pos2) or (pos3) or (pos4) or (pos5) or (pos6);
    AltB <= not (AeqB or AgtB);
    
    s(0) <= '0';
    s(1) <= '0';
    s(2) <= '0';
    s(3) <= AltB;
    s(4) <= AeqB;
    s(5) <= AgtB;
    
end Behavioral;
