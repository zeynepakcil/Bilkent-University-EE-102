library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity testBench is
-- Port ( );
end testBench;

architecture Behavioral of testBench is

component testBench PORT(
    i1 : in std_logic;
    i2 : in std_logic;
    i3 : in std_logic;
    i4 : in std_logic;
    i5 : in std_logic;
    i6 : in std_logic;

    s1 : in std_logic;
    s2 : in std_logic;
    s3 : in std_logic;
    
    out1 : out std_logic);
end component;

signal i1 : std_logic := '0';
signal i2 : std_logic := '0';
signal i3 : std_logic := '0';
signal i4 : std_logic := '0';
signal i5 : std_logic := '0';
signal i6 : std_logic := '0';
                      
signal s1 : std_logic := '0';
signal s2 : std_logic := '0';
signal s3 : std_logic := '0';


signal out1:  std_logic;

-- Constant Times of Inputs
constant i1_period : time := 100ns;
constant i2_period : time := 200ns;
constant i3_period : time := 100ns;
constant i4_period : time := 200ns;
constant i5_period : time := 100ns;
constant i6_period : time := 200ns;

constant s1_period : time := 100ns;
constant s2_period : time := 200ns;
constant s3_period : time := 300ns;

begin
-- UUT: Unit Under Test
UUT: testBench PORT MAP(
    i1 => i1,
    i2 => i2,
    i3 => i3,
    i4 => i4,
    i5 => i5,
    i6 => i6,
      
    s1 => s1,
    s2 => s2,
    s3 => s3,
    
    out1 => out1);

    P_i1: process begin
        i1 <= '0';
        wait for i1_period/2;
        i1 <= '1';
        wait for i1_period/2;
    end process;
    
    P_i2: process begin
        i2 <= '0';
        wait for i2_period/2;
        i2 <= '1';
        wait for i2_period/2;
    end process;
    
    P_i3: process begin
        i3 <= '0';
        wait for i3_period/2;
        i3 <= '1';
        wait for i3_period/2;
    end process;
    
    P_i4: process begin
        i4 <= '0';
        wait for i4_period/2;
        i4 <= '1';
        wait for i4_period/2;
    end process;
    
    P_i5: process begin
        i5 <= '0';
        wait for i5_period/2;
        i5 <= '1';
        wait for i5_period/2;
    end process;
    
    P_i6: process begin
        i6 <= '0';
        wait for i6_period/2;
        i6 <= '1';
        wait for i6_period/2;
    end process;
    
    
    P_s1: process begin
        s1 <= '0';
        wait for s1_period/2;
        s1 <= '1';
        wait for s1_period/2;
    end process;
    
    P_s2: process begin
        s2 <= '0';
        wait for s2_period/2;
        s2 <= '1';
        wait for s2_period/2;
    end process;
    
    P_s3: process begin
        s3 <= '0';
        wait for s3_period/2;
        s3 <= '1';
        wait for s3_period/2;
    end process;
    
    
    MUX8to1: process begin
        wait for 100 ms; -- wait 100 ms at first
        wait for i1_period*10; -- will give a break for 10 i1 periods long
        
        wait;
    end process;
end;