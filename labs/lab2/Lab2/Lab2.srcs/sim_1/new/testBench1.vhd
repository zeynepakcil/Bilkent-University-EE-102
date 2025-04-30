library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity testBench1 is
end testBench1;

architecture Behavioral of testBench1 is
    COMPONENT test1
    PORT( 
        in1 : IN STD_LOGIC;
        in2 : IN STD_LOGIC;
        out1 : OUT STD_LOGIC);
    END COMPONENT;
    
    SIGNAL in1 : STD_LOGIC;
    SIGNAL in2 : STD_LOGIC;
    SIGNAL out1 : STD_LOGIC;
    
    BEGIN
    
    UUT: test1 PORT MAP(
        in1 => in1,
        in2 => in2,
        out1 => out1);
   
    testBench1 : PROCESS BEGIN
        wait for 100 ns;
        
        in1<='0';
        in2<='0';
        
        wait for 100 ns;
        
        in1<='1';
        in2<='1';
        
    END PROCESS;
end Behavioral;