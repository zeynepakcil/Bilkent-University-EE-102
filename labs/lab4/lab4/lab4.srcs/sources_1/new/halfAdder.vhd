library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity halfAdder is
    Port (
        a, b : in std_logic; 
        sum, carry   : out std_logic );
end halfAdder;

architecture Behavioral of halfAdder is

begin
    sum <= a xor b;
    carry <= a and b;

end Behavioral;
