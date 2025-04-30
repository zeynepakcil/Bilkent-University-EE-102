library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rotateRight is
    Port (a : in std_logic_vector (5 downto 0);
          rotated : out std_logic_vector (5 downto 0));
end rotateRight;

architecture Behavioral of rotateRight is
begin
     rotated <= a(0) & a(5 downto 1);
       
end Behavioral;
