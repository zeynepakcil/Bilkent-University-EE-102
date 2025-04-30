library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testBench is
--  Port ( );
end testBench;

architecture Behavioral of testBench is
    type state_type is (maintain, shift, subtract);
    signal registerState, nextState : state_type;
    
    signal clk, reset, enable, ready: std_logic;
    signal a, b, result : std_logic_vector (7 downto 0);
    
    component GCD is
        Port (clk, reset, enable: in std_logic;
              a, b: in std_logic_vector(7 downto 0);
              result: out std_logic_vector(7 downto 0);
              ready: out std_logic);
    end component;
begin
    
    main: GCD port map(clk => clk,
                       reset => reset,
                       enable => enable,
                       ready => ready,    
                       a => a,
                       b => b,
                       result => result);
    
    clkP: process begin
             clk <= '0';
             wait for 10ns;
             clk <= '1';
             wait for 10ns;
         end process;
     stimP: process begin
             enable <= '1';
             a <= "10001100";
             b <= "00001100";
             reset <= '0';
             wait for 100ns;
             enable <= '0';
             wait;
         end process;
    
    
    
    
    
    
    
                     
    
end Behavioral;
