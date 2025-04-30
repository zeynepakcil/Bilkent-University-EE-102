
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity arithmeticShiftRight is
    Port (a : in std_logic_vector (5 downto 0);
          shifted : out std_logic_vector(5 downto 0));
end arithmeticShiftRight;

architecture Behavioral of arithmeticShiftRight is
begin
    shifted <= a(5) & a(5 downto 1);
   
end Behavioral;
