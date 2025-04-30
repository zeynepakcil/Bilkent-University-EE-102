
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity logicalShiftRight is
    Port (a : in std_logic_vector (5 downto 0);
          shifted : out std_logic_vector(5 downto 0));
end logicalShiftRight;

architecture Behavioral of logicalShiftRight is
begin
    shifted <= '0' & a(5 downto 1);

end Behavioral;
