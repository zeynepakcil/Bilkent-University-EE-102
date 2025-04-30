library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity LEDControl is
    Port (clk          : in std_logic;
          reset        : in std_logic;
          LEDactivator : in std_logic_vector(1 downto 0);
          number       : in std_logic_vector (15 downto 0);
          clkEnable    : in std_logic;
          anode        : out std_logic_vector(3 downto 0);
          cathode      : out std_logic_vector(6 downto 0));
end LEDControl;

architecture Behavioral of LEDControl is
    signal LEDcombination : std_logic_vector(3 downto 0);
    component LEDDrive is
        Port (LEDCombination: in std_logic_vector(3 downto 0);
              cathode : out std_logic_vector(6 downto 0));
    end component;
begin

    process(LEDactivator) begin
    case LEDactivator is
        when "00" => anode <= "0111"; -- first segment
            LEDcombination <= number(15 downto 12);
        when "01" => anode <= "1011"; -- second segment
            LEDcombination <= number(11 downto 8);
        when "10" => anode <= "1101"; -- third segment
            LEDcombination <= number(7 downto 4);
        when "11" => anode <= "1110"; -- fourth segment
            LEDcombination <= number(3 downto 0);
        when others => anode <= "1111";
    end case;
    end process;
    
    DriveofLED: LEDDrive port map(LEDCombination, cathode);
end Behavioral;
