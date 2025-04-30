LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Lab2_VHDL_tb IS
END Lab2_VHDL_tb;

ARCHITECTURE behavior OF Lab2_VHDL_tb IS 

  -- Component Declaration for the Unit Under Test (UUT)

  COMPONENT Lab2_VHDL
  PORT(
       i1 : IN  std_logic;
       i2 : IN  std_logic;
       i3 : IN  std_logic;
       i4 : IN  std_logic;
       i5 : IN  std_logic;
       i6 : IN  std_logic;
       s1 : IN  std_logic;
       s2 : IN  IN  std_logic;
       s3 : IN  IN  std_logic;
       out1 : OUT  std_logic
      );
  END COMPONENT;

  --Inputs
   signal i1 : std_logic := '0';
   signal i2 : std_logic := '0';
   signal i3 : std_logic := '0';
   signal i4 : std_logic := '0';
   signal i5 : std_logic := '0';
   signal i6 : std_logic := '0';
   signal s1 : std_logic := '0';
   signal s2 : std_logic := '0';
   signal s3 : std_logic := '0';

  --Outputs
   signal out1 : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;

BEGIN

  -- Instantiate the Unit Under Test (UUT)
   uut: Lab2_VHDL PORT MAP (
          i1 => i1,
          i2 => i2,
          i3 => i3,
          i4 => i4,
          i5 => i5,
          i6 => i6,
          s1 => s1,
          s2 => s2,
          s3 => s3,
          out1 => out1
        );

   -- Clock process definitions
   clk_process :process
   begin
        while now < 1000 ns loop         
            wait for clk_period/2;
        end loop;
        wait;
   end process;

   -- Stimulus process
   stim_proc: process
   begin        
        -- Test case 1
        s1 <= '0';
        s2 <= '0';
        s3 <= '0';
        i1 <= '0';
        i2 <= '1';
        i3 <= '0';
        i4 <= '1';
        i5 <= '0';
        i6 <= '1';
        wait for 10 ns;
        assert(out1 = '0') report "Test Case 1 Failed" severity error;

        -- Test case 2
        s1 <= '0';
        s2 <= '1';
        s3 <= '0';
        i1 <= '0';
        i2 <= '1';
        i3 <= '0';
        i4 <= '1';
        i5 <= '0';
        i6 <= '1';
        wait for 10 ns;
        assert(out1 = '1') report "Test Case 2 Failed" severity error;

        -- Test case 3
        s1 <= '1';
        s2 <= '0';
        s3 <= '0';
        i1 <= '0';
        i2 <= '1';
        i3 <= '0';
        i4 <= '1';
        i5 <= '0';
        i6 <= '1';
        wait for 10 ns;
        assert(out1 = '0') report "Test Case 3
