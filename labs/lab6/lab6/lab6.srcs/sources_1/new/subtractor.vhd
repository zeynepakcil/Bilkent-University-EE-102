library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity subtractor is
   Port (a, b: in std_logic_vector(7 downto 0);
         result: out std_logic_vector(7 downto 0));
end subtractor;

architecture Behavioral of subtractor is

signal i1, i2, i3, i4, i5, i6, i7: std_logic;

begin    
    i1 <= (not(a(0)) and '0') or (not(a(0)) and b(0)) or (b(0) and '0');
    i2 <= (not(a(1)) and  i1) or (not(a(1)) and b(1)) or (b(1) and  i1);
    i3 <= (not(a(2)) and  i2) or (not(a(2)) and b(2)) or (b(2) and  i2);
    i4 <= (not(a(3)) and  i3) or (not(a(3)) and b(3)) or (b(3) and  i3);
    i5 <= (not(a(4)) and  i4) or (not(a(4)) and b(4)) or (b(4) and  i4);
    i6 <= (not(a(5)) and  i5) or (not(a(5)) and b(5)) or (b(5) and  i5);
    i7 <= (not(a(6)) and  i6) or (not(a(6)) and b(6)) or (b(6) and  i6);

    result(0) <= a(0) xor b(0) xor '0';
    result(1) <= a(1) xor b(1) xor i1;
    result(2) <= a(2) xor b(2) xor i2;
    result(3) <= a(3) xor b(3) xor i3;
    result(4) <= a(4) xor b(4) xor i4;
    result(5) <= a(5) xor b(5) xor i5;
    result(6) <= a(6) xor b(6) xor i6;
    result(7) <= a(7) xor b(7) xor i7;
  
   
end Behavioral;
