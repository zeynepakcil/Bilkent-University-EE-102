library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity muxFile is
    Port ( 
        selection : in std_logic_vector (2 downto 0);
        a, b       : in std_logic_vector(5 downto 0);
        o          : out std_logic_vector(5 downto 0));
end muxFile;

architecture Behavioral of muxFile is
     
    -- OUTPUTS
        Signal raddition             : std_logic_vector(5 downto 0);
        Signal rsubtraction          : std_logic_vector(5 downto 0);
        Signal rarithmeticShiftRight : std_logic_vector(5 downto 0);
        Signal rlogicalShiftLeft     : std_logic_vector(5 downto 0);
        Signal rlogicalShiftRight    : std_logic_vector(5 downto 0);
        Signal rcomparator           : std_logic_vector(5 downto 0);
        Signal rrotateRight          : std_logic_vector(5 downto 0);
        Signal rbitwiseXOR           : std_logic_vector(5 downto 0);

    component addition is
        Port ( 
            a, b: in std_logic_vector (5 downto 0);
            result   : out std_logic_vector (5 downto 0));
    end component;
    
    component subtraction is
            Port (a, b: in std_logic_vector (5 downto 0);
                  difference : out std_logic_vector (5 downto 0));
    end component;
    
    component logicalShiftLeft is
        Port (
            a : in std_logic_vector (5 downto 0);
            shifted : out std_logic_vector(5 downto 0));
    end component;
    
    component logicalShiftRight is
        Port (
            a : in std_logic_vector (5 downto 0);
            shifted : out std_logic_vector(5 downto 0));
    end component;
    
    component arithmeticShiftRight is
         Port (
            a : in std_logic_vector (5 downto 0);
            shifted : out std_logic_vector(5 downto 0));
    end component;
    
    component comparator is
        Port (
            a, b : in std_logic_vector (5 downto 0);
            s : out std_logic_vector (5 downto 0));
    end component;
    
    component rotateRight is
        Port (
            a : in std_logic_vector (5 downto 0);
            rotated : out std_logic_vector (5 downto 0));
    end component;
    
    component bitwiseXOR is
        Port (
            a, b : in std_logic_vector(5 downto 0);
            bitwiseXORr : out std_logic_vector (5 downto 0));
    end component;
    begin

    F1: addition port map(a, b, raddition);
    F2: subtraction port map(a, b, rsubtraction);
    F3: logicalShiftLeft port map(a, rlogicalShiftLeft);
    F4: logicalShiftRight port map(a, rlogicalShiftRight);
    F5: arithmeticShiftRight port map(a, rarithmeticShiftRight);
    F6: comparator port map(a, b, rcomparator);
    F7: rotateRight port map(a,rrotateRight);
    F8: bitwiseXOR port map(a, b,rbitwiseXOR);
    process(raddition, rsubtraction, rarithmeticShiftRight, rlogicalShiftLeft, rlogicalShiftRight, rcomparator, rrotateRight,rbitwiseXOR) begin
   
        if selection = "000" then
            o <= raddition;
        elsif selection = "001" then
            o <= rsubtraction;
        elsif selection = "010" then
            o <= rlogicalShiftLeft;
        elsif selection = "011" then
            o <= rlogicalShiftRight;
        elsif selection = "100" then
            o <= rarithmeticShiftRight;
        elsif selection = "101" then
            o <= rcomparator;
        elsif selection = "110" then
            o <= rrotateRight;
        else 
            o <= rbitwiseXOR;
        end if;   
        
     end process;
            
end Behavioral;
