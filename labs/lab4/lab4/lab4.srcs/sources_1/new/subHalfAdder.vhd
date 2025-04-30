library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity subHalfAdder is
       Port (
        a, b : in std_logic; 
        sum, carry   : out std_logic );
end subHalfAdder;

architecture Behavioral of subHalfAdder is

begin
        sum <= a xor b;
        carry <= a and b;

end Behavioral;
