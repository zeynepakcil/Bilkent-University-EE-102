library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity testBench is
    -- Port ();
end testBench;

architecture Behavioral of testBench is
    
    component muxFile is 
    Port ( 
            selection : in std_logic_vector (2 downto 0);
            a, b       : in std_logic_vector(5 downto 0);
            o          : out std_logic_vector(5 downto 0));
    end component;
     
     
     signal selection :  std_logic_vector (2 downto 0);
     signal a, b       : std_logic_vector(5 downto 0);
     signal o          : std_logic_vector(5 downto 0);
     
     
    
    constant periodA : time := 100ns;
    constant periodB : time := 50ns;
    constant periodSelection : time := 25ns;
    
    begin
    UUT: muxFile port map(
        selection => selection,
        a => a,
        b => b, 
        o => o);
        
        processOfA : process begin
                a <= "000000";
                wait for periodA/2;
                a <= "000001";
                wait for periodA/2;
                a <= "000101";
                wait for periodA/2;
                a <= "000111";
                wait for periodA/2;
                a <= "001100";
                wait for periodA/2;
                a <= "001101";
                wait for periodA/2;
                a <= "011111";
                wait for periodA/2;
                a <= "110101";
                wait for periodA/2;
                a <= "110011";
                wait for periodA/2;
                a <= "111111";
                end process;
                
        processOfB : process begin
                b <= "000000";
                wait for periodB/2;
                b <= "000001";
                wait for periodB/2;
                b <= "000101";
                wait for periodB/2;
                b <= "000111";
                wait for periodB/2;
                b <= "001100";
                wait for periodB/2;
                b <= "001101";
                wait for periodB/2;
                b <= "011111";
                wait for periodB/2;
                b <= "110101";
                wait for periodB/2;
                b <= "110011";
                wait for periodB/2;
                b <= "111111";
                end process;
           
          processSelection: process begin
                selection <= "000";
                wait for periodSelection/2;
                selection <= "001";
                wait for periodSelection/2;
                selection <= "010";
                wait for periodSelection/2;
                selection <= "011";
                wait for periodSelection/2;
                selection <= "100";
                wait for periodSelection/2;
                selection <= "101";
                wait for periodSelection/2;
                selection <= "110";
                wait for periodSelection/2;
                selection <= "111";
                wait for periodSelection/2;
                end process;
                
            stim_proc: process begin
                -- ALU at reset 
                wait for 500 ns;
                wait for periodA*10;
                wait;
                end process;
                
end Behavioral;
