library IEEE;
use IEEE.std_logic_1164.all;

ENTITY testbench IS 
END testbench;

ARCHITECTURE comportement OF testbench IS

	COMPONENT reg_sync_load_8b IS
	PORT ( 
		clock : IN  STD_LOGIC;
		reset : IN  STD_LOGIC;
		load  : IN  STD_LOGIC;
		e     : IN  STD_LOGIC_VECTOR(7 downto 0);
		s     : OUT STD_LOGIC_VECTOR(7 downto 0)
	);
	END COMPONENT;

 	SIGNAL clock  : STD_LOGIC;
 	SIGNAL reset  : STD_LOGIC;
 	SIGNAL load   : STD_LOGIC;
 	SIGNAL e      : STD_LOGIC_VECTOR(7 downto 0);
 	SIGNAL s      : STD_LOGIC_VECTOR(7 downto 0);
		
BEGIN

	sync :  reg_sync_load_8b
	port map (
		clock => clock,
		reset => reset,
		load  => load,
		e     => e,
		s     => s
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

		reset <= '1';
		load  <= '0';
	    e     <= "00000000";

		wait for 10 ns; 

		reset <= '0';

		wait for 10 ns; 

		e <= "01010101";
		wait for 10 ns; 

		load <= '1';
		wait for 10 ns; 

		load <= '0';
		wait for 10 ns; 

		e <= "10101010";
		load <= '1';
		wait for 10 ns; 

		load <= '0';
		wait for 10 ns; 
		
		wait;
	end process entree;
	
	
END comportement;