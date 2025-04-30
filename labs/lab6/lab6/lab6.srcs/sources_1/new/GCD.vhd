library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity GCD is
    Port (clk, reset, enable: in std_logic;
          a, b: in std_logic_vector(7 downto 0);
          result: out std_logic_vector(7 downto 0);
          ready: out std_logic);
end GCD;

architecture Behavioral of GCD is

    type state_type is (maintain, shift, substract);
    signal registerState, nextState : state_type;

    signal registerA, registerB, nextA, nextB: unsigned(7 downto 0);
    
    signal comparatorA, comparatorB : unsigned(7 downto 0);
    signal comparatorOut: std_logic_vector(2 downto 0);

    signal substractionA, substractionB, substractionRes: std_logic_vector(7 downto 0);
    
    component comparator is
        Port (a, b: in unsigned(7 downto 0);
              result: out std_logic_vector(2 downto 0));
    end component;
    
    component subtractor is
        Port (a, b: in std_logic_vector(7 downto 0);
              result: out std_logic_vector(7 downto 0));
    end component;
begin
    comp: comparator port map(a => comparatorA,
                              b => comparatorB,
                              result => comparatorOut);
    subt: subtractor port map(a => substractionA,
                              b => substractionB,
                              result => substractionRes);
    process1: process(clk, reset) begin
                   if reset='1' then
                       registerState <= maintain;
                       registerA <= (others=>'0');
                       registerB <= (others=>'0');
                   elsif rising_edge(clk) then
                       registerState <= nextState;
                       registerA <= nextA;
                       registerB <= nextB;
                  end if;
              end process;
    process2: process(registerState, registerA, registerB, enable, a, b) begin
                  nextA <= registerA;
                  nextB <= registerB;
                  comparatorA <= registerA;
                  comparatorB <= registerB;
                  substractionA <= std_logic_vector(registerA);
                  substractionB <= std_logic_vector(registerB);
                  
                  case registerState is
                    when maintain =>
                        if enable = '1' then
                            nextA <= unsigned(a);
                            nextB <= unsigned(b);
                            nextState <= shift;
                        else
                            nextState <= maintain;
                        end if;

                     when shift =>
                        if (comparatorOut(1) = '1') then
                            nextState <= maintain;
                        else
                            if(comparatorOut(2) = '1') then
                                nextA <= registerB;
                                nextB <= registerA;
                            end if;
                            nextState <= substract;
                        end if;
                        
                     when substract =>
                         nextA <= unsigned(substractionRes);
                         nextState <= shift;
                  end case;
             end process;
    ready <= '1' when registerState = maintain else '0';
    result <= std_logic_vector(registerA);      
                 
end Behavioral;
