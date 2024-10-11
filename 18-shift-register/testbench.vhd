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

 	SIGNAL clock  : STD_LOGIC;
 	SIGNAL reset  : STD_LOGIC;
 	SIGNAL e      : STD_LOGIC;
 	SIGNAL t1     : STD_LOGIC;
 	SIGNAL t2     : STD_LOGIC;
 	SIGNAL t3     : STD_LOGIC;
 	SIGNAL t4     : STD_LOGIC;
 	SIGNAL s      : STD_LOGIC;
		
BEGIN

	r0 :  reg_sync port map ( clock => clock, reset => reset, e =>  e, s => t1 );
	r1 :  reg_sync port map ( clock => clock, reset => reset, e => t1, s => t2 );
	r2 :  reg_sync port map ( clock => clock, reset => reset, e => t2, s => t3 );
	r3 :  reg_sync port map ( clock => clock, reset => reset, e => t3, s => t4 );
	r4 :  reg_sync port map ( clock => clock, reset => reset, e => t4, s => s  );

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
	    e     <= '0';  wait for 10 ns; 
		reset <= '0';  wait for 10 ns; 
		e     <= '1';  wait for 10 ns; 
		e     <= '0';  wait for 10 ns; 
		e     <= '1';  wait for 10 ns; 
		e     <= '1';  wait for 10 ns; 
		e     <= '0';  wait for 10 ns; 
		e     <= '0';  wait for 10 ns; 
		e     <= '1';  wait for 10 ns; 
		e     <= '0';  wait for 10 ns; 
		e     <= '0';  wait for 10 ns; 
		e     <= '1';  wait for 10 ns; 
		e     <= '1';  wait for 10 ns; 
		e     <= '1';  wait for 10 ns; 
		e     <= '1';  wait for 10 ns; 
		e     <= '1';  wait for 10 ns; 
		e     <= '0';  wait for 10 ns; 
		wait;
	end process entree;
	
	
END comportement;