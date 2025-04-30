library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity main is
    Port (clk     : in std_logic;
          reset   : in std_logic;
          anode   : out std_logic_vector(3 downto 0);
          cathode : out std_logic_vector(6 downto 0));
end main;

architecture Behavioral of main is
    
    signal clkEnable    : std_logic;
    signal LEDactivator : std_logic_vector(1 downto 0);
    signal number       : std_logic_vector(15 downto 0);
    
    component clkControl 
     Port (clk     : in std_logic;
           reset   : in std_logic;
           LEDactivator: out std_logic_vector(1 downto 0);
           clkEnable : out std_logic);
    end component;
    
    component LEDControl 
     Port (clk     : in std_logic;
           reset   : in std_logic;
           LEDactivator: out std_logic_vector(1 downto 0);
           number : out std_logic_vector (15 downto 0);
           clkEnable : out std_logic;
           anode   : out std_logic_vector(3 downto 0);
           cathode : out std_logic_vector(6 downto 0));
    end component;
    
    begin
    
        controlClock: clkControl port map(clk, reset, clkEnable, LEDactivator);
        controlLED: LEDControl port map(clk, reset, LEDactivator, number, clkEnable, anode, cathode);


end Behavioral;
