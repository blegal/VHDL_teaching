library IEEE;
use IEEE.std_logic_1164.all;

ENTITY automate_2_tb IS 
END automate_2_tb;

ARCHITECTURE comportement OF automate_2_tb IS

	COMPONENT automate_2 IS
	PORT ( 
		clock : IN  STD_LOGIC;
		reset : IN  STD_LOGIC;
		E     : IN  STD_LOGIC;
		O     : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
	END COMPONENT;

 	SIGNAL signal_clock : STD_LOGIC;
 	SIGNAL signal_reset : STD_LOGIC;
 	SIGNAL signal_e     : STD_LOGIC;
 	SIGNAL signal_o     : STD_LOGIC_VECTOR(2 DOWNTO 0);
		
BEGIN

	cnt : automate_2
	port map (
			clock => signal_clock,
			reset => signal_reset,
			e     => signal_e,
			o     => signal_o
		);

	horloge : PROCESS 
	BEGIN
		signal_clock <= '0';
		for i in 0 to 40 loop
			signal_clock <= '0'; wait for 5 ns;
			signal_clock <= '1'; wait for 5 ns;
		end loop;
		wait; -- pour arreter le processus
	END PROCESS horloge;
	
	entree: PROCESS
	begin
	    wait for 10 ns; 

		signal_reset <= '1';
		signal_e     <= '0';
	    wait for 40 ns; 

		signal_reset <= '0';
	    wait for 40 ns; 

		signal_e <= '1';  wait for 40 ns; 
		signal_e <= '0';  wait for 10 ns; 
		signal_e <= '1';  wait for 40 ns; 
		signal_e <= '1';  wait for 40 ns; 
		signal_e <= '0';  wait for 80 ns; 

		wait;
	end process entree;
	
	
END comportement;
