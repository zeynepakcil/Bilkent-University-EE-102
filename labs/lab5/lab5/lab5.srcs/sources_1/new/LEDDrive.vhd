library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity LEDDrive is
    Port (LEDCombination: in std_logic_vector(3 downto 0);
          cathode : out std_logic_vector(6 downto 0));
end LEDDrive;

architecture Behavioral of LEDDrive is
begin

    process(LEDCombination) begin
        case LEDCombination is
            when "0000" => cathode <= "0000001";
            when "0001" => cathode <= "1001111";
            when "0010" => cathode <= "0010010";
            when "0011" => cathode <= "0000110";
            when "0100" => cathode <= "1001100";
            when "0101" => cathode <= "0100100";
            when "0110" => cathode <= "0100000";
            when "0111" => cathode <= "0001111";
            when "1000" => cathode <= "0000000";
            when "1001" => cathode <= "0000100";
            when "1010" => cathode <= "0000010";
            when "1011" => cathode <= "1100000";
            when "1100" => cathode <= "0110001";
            when "1101" => cathode <= "1000010";
            when "1110" => cathode <= "0110000";
            when "1111" => cathode <= "0111000";
            when others => cathode <= "1111111";
        end case;
    end process;

end Behavioral;
