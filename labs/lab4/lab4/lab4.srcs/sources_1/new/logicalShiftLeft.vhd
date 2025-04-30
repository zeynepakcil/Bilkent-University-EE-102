
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity logicalShiftLeft is
    Port (a : in std_logic_vector (5 downto 0);
          shifted : out std_logic_vector(5 downto 0));
end logicalShiftLeft;

architecture Behavioral of logicalShiftLeft is
begin
    shifted <= a(4 downto 0) & '0';

end Behavioral;
