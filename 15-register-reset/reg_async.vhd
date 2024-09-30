library IEEE;
use IEEE.std_logic_1164.all;

ENTITY reg_async IS
	PORT ( 
		clock : IN  STD_LOGIC;
		reset : IN  STD_LOGIC;
		e     : IN  STD_LOGIC;
		s     : OUT STD_LOGIC
	);
END reg_async;

ARCHITECTURE behavior OF reg_async IS
    
    SIGNAL mem : STD_LOGIC;

BEGIN

	PROCESS( reset, clock )
	BEGIN
		IF reset = '1' THEN
			mem <= '0';
		ELSIF clock'event and clock = '1' THEN
        	mem <= e;
        END IF;
    END PROCESS;

	s <= mem;

END;