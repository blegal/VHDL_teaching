library IEEE;
use IEEE.std_logic_1164.all;

ENTITY reg_sync IS
	PORT ( 
		clock : IN  STD_LOGIC;
		reset : IN  STD_LOGIC;
		e     : IN  STD_LOGIC;
		s     : OUT STD_LOGIC
	);
END reg_sync;

ARCHITECTURE behavior OF reg_sync IS
    
    SIGNAL mem : STD_LOGIC;

BEGIN

	PROCESS( clock )
	BEGIN
	   IF clock'event and clock = '1' THEN
	      IF reset = '1' THEN
		  	mem <= '0';
          ELSE
		  	mem <= e;
          END IF;
	   END IF;
	END PROCESS;

	s <= mem;

END;