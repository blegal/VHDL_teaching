library IEEE;
use IEEE.std_logic_1164.all;

ENTITY testbench IS 
END testbench;

ARCHITECTURE comportement OF testbench IS

	COMPONENT pwm_generation IS
	PORT ( 
		CLK : IN  STD_LOGIC;
		RST : IN  STD_LOGIC;
		LMT : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
		o   : OUT STD_LOGIC
	);
	END COMPONENT;

 	SIGNAL clock  : STD_LOGIC;
 	SIGNAL reset  : STD_LOGIC;
 	SIGNAL lmt    : STD_LOGIC_VECTOR(2 DOWNTO 0);
 	SIGNAL o      : STD_LOGIC;
		
BEGIN

	dut : pwm_generation port map ( clock, reset, lmt, o );

	PROCESS 
	BEGIN
		clock <= '0';
		while TRUE loop
			clock <= '0'; wait for 5 ns;
			clock <= '1'; wait for 5 ns;
		end loop;
		wait;
	END PROCESS;
	
	entree: PROCESS
	begin
		reset <= '1';
	    wait for 10 ns; 

		reset <= '0';
		lmt   <= "100";
	    wait for 200 ns; 

		lmt   <= "010";
	    wait for 200 ns; 

		lmt   <= "101";
	    wait for 200 ns; 

		lmt   <= "011";
	    wait for 200 ns; 

		wait;
	end process entree;
	
	
END comportement;