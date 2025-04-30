library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Lab2_VHDL is
  Port (i1  : in std_logic;
        i2  : in std_logic;
        i3  : in std_logic;
        i4  : in std_logic;
        i5  : in std_logic;
        i6  : in std_logic;
        s1  : in std_logic;
        s2  : in std_logic;
        s3  : in std_logic;
        out1: out std_logic);
end Lab2_VHDL;

architecture Behavioral of Lab2_VHDL is
signal sig1, sig2, sig3, sig4 : std_logic;
begin
    process(i1,i2,i3,i4,i5,i6,s1,s2)
    begin
        if s1 = '0' then
            sig1 <= i1;
            sig2 <= i3;
            sig3 <= i5;
            if s2 = '0' then
                sig4 <= sig1;
                if s3 = '0' then
                    out1 <= sig4;
                else
                    out1 <= sig3;
                end if;
            else 
                sig4 <= sig2;
                if s3 = '0' then
                    out1 <= sig4;
                else
                    out1 <= sig3;
                end if;
            end if;
        else
            sig1 <= i2;
            sig2 <= i4;
            sig3 <= i6;
            if s2 = '0' then
                sig4 <= sig1;
                if s3 = '0' then
                    out1 <= sig4;
                else
                    out1 <= sig3;
                end if;
            else 
                sig4 <= sig2;
                if s3 = '0' then
                    out1 <= sig4;
                else
                    out1 <= sig3;
                end if;
            end if;
        end if;
    end process;
end Behavioral;
