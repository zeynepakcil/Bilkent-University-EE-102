library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testBench is
 -- Port ( );
end testBench;

architecture Behavioral of testBench is
    signal reset   : std_logic := '0';
    signal clk     : std_logic := '0';
    signal anode   : std_logic_vector(3 downto 0);
    signal cathode : std_logic_vector(6 downto 0);
    
    component ssd is
        Port (clk     : in std_logic;
          reset   : in std_logic;
          anode   : out std_logic_vector(3 downto 0);
          cathode : out std_logic_vector(6 downto 0));
    end component;
begin
 
    uut: ssd port map(clk, reset, anode, cathode);
    
    clkProcess: process begin 
        clk <= '0';
        wait for 10ns;
        clk <= '1';
        wait for 10ns;
    end Process;
    
    simProcess: process begin
        reset <= '1';
        wait for 20ns;
        reset <= '0';
        wait;
    end Process;
    
end Behavioral;
