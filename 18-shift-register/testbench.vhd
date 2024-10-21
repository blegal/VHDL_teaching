library IEEE;
use IEEE.std_logic_1164.all;

ENTITY testbench IS 
END testbench;

ARCHITECTURE comportement OF testbench IS

	COMPONENT shift_register IS
	PORT ( 
		clock : IN  STD_LOGIC;
		reset : IN  STD_LOGIC;
		load  : IN  STD_LOGIC;
		e     : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		s     : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
	END COMPONENT;

 	SIGNAL clock  : STD_LOGIC;
 	SIGNAL reset  : STD_LOGIC;
 	SIGNAL load   : STD_LOGIC;
 	SIGNAL e      : STD_LOGIC_VECTOR(3 DOWNTO 0);
 	SIGNAL s      : STD_LOGIC_VECTOR(3 DOWNTO 0);
		
BEGIN

	dut :  shift_register port map ( clock, reset, load, e, s );

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
		load  <= '0';
	    e     <= "0000"; wait for 10 ns; 
		reset <= '0';    wait for 10 ns; 

		load  <= '1';
		e     <= "0011"; wait for 10 ns; 
		load  <= '0';    wait for 60 ns; 

		load  <= '1';
		e     <= "1111"; wait for 10 ns; 
		load  <= '0';    wait for 60 ns; 

		load  <= '1';
		e     <= "0001"; wait for 10 ns; 
		load  <= '0';    wait for 60 ns; 

		wait;
	end process entree;
	
	
END comportement;