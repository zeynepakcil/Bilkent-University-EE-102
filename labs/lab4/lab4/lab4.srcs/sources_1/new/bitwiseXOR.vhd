library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bitwiseXOR is
    Port (a, b: in std_logic_vector (5 downto 0);
          bitwiseXORr: out std_logic_vector (5 downto 0));
end bitwiseXOR;

architecture Behavioral of bitwiseXOR is

begin
    bitwiseXORr <= (a xor b);
    
end Behavioral;
