library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity comparator is
    Port (a, b: in unsigned(7 downto 0);
          result: out std_logic_vector(2 downto 0));
end comparator;

architecture Behavioral of comparator is

signal eq, lt, gt: std_logic;
signal situation: std_logic_vector(2 downto 0);
signal equality: std_logic_vector(7 downto 0);

begin
     -- Checking if equal
     equality(0) <= (not a(0)) xnor (not b(0));
     equality(1) <= (not a(1)) xnor (not b(1));
     equality(2) <= (not a(2)) xnor (not b(2));
     equality(3) <= (not a(3)) xnor (not b(3));
     equality(4) <= (not a(4)) xnor (not b(4));
     equality(5) <= (not a(5)) xnor (not b(5));
     equality(6) <= (not a(6)) xnor (not b(6));
     equality(7) <= (not a(7)) xnor (not b(7));

     eq <= '1' when equality = "11111111" else '0';

     --Checking if greater
     gt <= (a(7) and not(b(7))) or 
           (a(6) and not(b(6)) and equality(7)) or
           (a(5) and not(b(5)) and equality(7) and equality(6)) or
           (a(4) and not(b(4)) and equality(7) and equality(6) and equality(5)) or
           (a(3) and not(b(3)) and equality(7) and equality(6) and equality(5) and equality(4) )or
           (a(2) and not(b(2)) and equality(7) and equality(6) and equality(5) and equality(4) and equality(3)) or
           (a(1) and not(b(1)) and equality(7) and equality(6) and equality(5) and equality(4) and equality(3) and equality(2)) or
           (a(0) and not(b(0)) and equality(7) and equality(6) and equality(5) and equality(4) and equality(3) and equality(2) and equality(1));
          
     --Checking if less
      lt <= (b(7) and not(a(7))) or
            (b(6) and not(a(6)) and equality(7)) or 
            (b(5) and not(a(5)) and equality(7) and equality(6) )or 
            (b(4) and not(a(4)) and equality(7) and equality(6) and equality(5)) or 
            (b(3) and not(a(3)) and equality(7) and equality(6) and equality(5) and equality(4)) or 
            (b(2) and not(a(2)) and equality(7) and equality(6) and equality(5) and equality(4) and equality(3)) or 
            (b(1) and not(a(1)) and equality(7) and equality(6) and equality(5) and equality(4) and equality(3) and equality(2)) or 
            (b(0) and not(a(0)) and equality(7) and equality(6) and equality(5) and equality(4) and equality(3) and equality(2) and equality(1)); 
     
     situation(0) <= gt;
     situation(1) <= eq;
     situation(2) <= lt;
     result <= situation;
end Behavioral;
