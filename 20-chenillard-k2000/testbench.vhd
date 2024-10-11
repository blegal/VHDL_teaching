library IEEE;
use IEEE.std_logic_1164.all;

ENTITY testbench IS 
END testbench;

ARCHITECTURE comportement OF testbench IS

	COMPONENT chenillard IS
	PORT ( 
		clock : IN  STD_LOGIC;
		reset : IN  STD_LOGIC;
		s     : OUT STD_LOGIC_VECTOR(7 downto 0)
	);
	END COMPONENT;

 	SIGNAL clock  : STD_LOGIC;
 	SIGNAL reset  : STD_LOGIC;
 	SIGNAL s      : STD_LOGIC_VECTOR(7 downto 0);
		
BEGIN

	chenille :  chenillard port map ( clock => clock, reset => reset, s => s );

	PROCESS 
	BEGIN
		clock <= '0';
		for i in 0 to 40 loop
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
		wait;
	end process entree;
	
	
END comportement;