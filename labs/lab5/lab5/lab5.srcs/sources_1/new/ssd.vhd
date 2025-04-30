library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity ssd is
    Port (clk     : in std_logic;
          reset   : in std_logic;
          anode   : out std_logic_vector(3 downto 0);
          cathode : out std_logic_vector(6 downto 0));
end ssd;

architecture Behavioral of ssd is
    -- Adding modules
    component displayControl is
        Port (binaryLED: in std_logic_vector(3 downto 0);
              cathode: out std_logic_vector(6 downto 0));
    end component;    
    
    component clkControl is
         Port (clk, reset: in std_logic;
               clkRefresh : out std_logic_vector(19 downto 0));
    end component;
    
    -- Signal definitions
    signal clkEnable    : std_logic;
    signal LEDactivator : std_logic_vector(1 downto 0);
    signal binaryLED    : std_logic_vector(3 downto 0);
    signal number       : std_logic_vector(15 downto 0);
    signal clkRefresh   : std_logic_vector(19 downto 0);
    signal clkCounter   : std_logic_vector(27 downto 0);
    
begin
     -- Processes
     clkAdjustment: process(clk, reset) begin
        if(reset='1') then
            clkRefresh <= (others => '0');
            
        elsif (rising_edge(clk)) then
            clkRefresh <= clkRefresh + 1;
       
       end if;
    end process;  
    LEDactivator <= clkRefresh(19 downto 18);
    
    activatingSegments: process(LEDactivator) begin
        case LEDactivator is
            when "00" =>
                anode <= "0111"; --first segment is active
                binaryLED <= number(15 downto 12);
            
            when "01" =>
                anode <= "1011"; --second segment is active
                binaryLED <= number(11 downto 8);
            
            when "10" =>
                anode <= "1101"; --third segment is active
                binaryLED <= number(7 downto 4);
            
            when "11" =>         
                anode <= "1110"; --fourth segment is active
                binaryLED <= number(3 downto 0);
                
            when others => 
                anode <= "1111";
        end case;
    end process;
    
    countNumber: process(clk, reset) begin
        if (reset='1') then
            clkCounter <= (others => '0');
        elsif (rising_edge(clk)) then   
            if (clkCounter >= x"5F5E0FF") then
                clkCounter <= (others => '0');
            else
                clkCounter <= clkCounter + "0000001";
            end if;
        end if;          
    end process;
    clkEnable <= '1' when clkCounter = x"5F5E0FF" else '0';
  
    reseting: process (clk, reset) begin
        if (reset = '1') then
                number <= (others => '0');
        elsif (rising_edge(clk)) then
             if (clkEnable = '1') then
                number <= number + x"0001";
             end if;
        end if;
    end process;
end Behavioral;

