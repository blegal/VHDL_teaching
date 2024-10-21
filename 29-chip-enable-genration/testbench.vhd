library IEEE;
use IEEE.std_logic_1164.all;

ENTITY testbench IS 
END testbench;

ARCHITECTURE comportement OF testbench IS

	COMPONENT chip_enable IS
	PORT ( 
		CLK : IN  STD_LOGIC;
		RST : IN  STD_LOGIC;
		o   : OUT STD_LOGIC
	);
	END COMPONENT;

 	SIGNAL clock  : STD_LOGIC;
 	SIGNAL reset  : STD_LOGIC;
 	SIGNAL o      : STD_LOGIC;
		
BEGIN

	dut : chip_enable port map ( CLK => clock, RST => reset, o => o );

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
		wait;
	end process entree;
	
	
END comportement;