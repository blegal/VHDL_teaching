library IEEE;
use IEEE.std_logic_1164.all;

ENTITY testbench IS 
END testbench;

ARCHITECTURE comportement OF testbench IS

	COMPONENT reg_sync IS
	PORT ( 
		clock : IN  STD_LOGIC;
		reset : IN  STD_LOGIC;
		e     : IN  STD_LOGIC;
		s     : OUT STD_LOGIC
	);
	END COMPONENT;

	COMPONENT reg_async IS
	PORT ( 
		clock : IN  STD_LOGIC;
		reset : IN  STD_LOGIC;
		e     : IN  STD_LOGIC;
		s     : OUT STD_LOGIC
	);
	END COMPONENT;

 	SIGNAL clock  : STD_LOGIC;
 	SIGNAL reset  : STD_LOGIC;
 	SIGNAL e      : STD_LOGIC;
 	SIGNAL s1     : STD_LOGIC;
 	SIGNAL s2     : STD_LOGIC;
		
BEGIN

	sync :  reg_sync
	port map (
		clock => clock,
		reset => reset,
		e     => e,
		s     => s1
	);

	async :  reg_async
	port map (
		clock => clock,
		reset => reset,
		e     => e,
		s     => s2
	);

	PROCESS 
	BEGIN
	clock <= '0';
		for i in 0 to 40 loop
			clock <= '0'; wait for 5 ns;
			clock <= '1'; wait for 5 ns;
		end loop;
		wait; -- pour arreter le processus
	END PROCESS;
	
	entree: PROCESS
	begin

		reset <= '0';
	    e     <= '0';

		wait for 15 ns; 

		reset <= '1';

	    wait for 40 ns; 

		reset <= '0';

		wait for 15 ns; 

		e <= '1';

		wait for 30 ns; 

		e <= '0';

		wait for 30 ns; 

		e <= '1';
		
		wait;
	end process entree;
	
	
END comportement;