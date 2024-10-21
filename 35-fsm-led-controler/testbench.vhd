library IEEE;
use IEEE.std_logic_1164.all;

ENTITY testbench IS 
END testbench;

ARCHITECTURE comportement OF testbench IS

	COMPONENT led_controler IS 
		PORT ( 
			clock  : IN  STD_LOGIC;
			reset  : IN  STD_LOGIC;
			button : IN  STD_LOGIC;
			red    : OUT STD_LOGIC;
			orange : OUT STD_LOGIC;
			green  : OUT STD_LOGIC
		);
	END COMPONENT;

 	SIGNAL clock  : STD_LOGIC;
 	SIGNAL reset  : STD_LOGIC;
 	SIGNAL button : STD_LOGIC;
 	SIGNAL red	  : STD_LOGIC;
 	SIGNAL orange : STD_LOGIC;
 	SIGNAL green  : STD_LOGIC;
		
BEGIN

	cnt : led_controler
	port map (
			clock  => clock,
			reset  => reset,
			button => button,
			red    => red,
			orange => orange,
			green  => green
		);

	PROCESS 
	BEGIN
		clock <= '0';
		for i in 0 to 400 loop
			clock <= '0'; wait for 5 ns;
			clock <= '1'; wait for 5 ns;
		end loop;
		wait; -- pour arreter le processus
	END PROCESS;
	
	
	
	entree: PROCESS
	begin
		button  <= '0';
		reset   <= '1';
	    wait for 20 ns; 

		reset <= '0';
	    wait for 20 ns; 
        
		button <= '1';
	    wait for 40 ns; 

		button <= '0';
	    wait for 40 ns; 

		button <= '1';
	    wait for 40 ns; 

		button <= '0';
	    wait for 40 ns; 

		button <= '1';
	    wait for 40 ns; 

		button <= '0';
	    wait for 40 ns; 


		wait;
	end process entree;
	
	
END comportement;
