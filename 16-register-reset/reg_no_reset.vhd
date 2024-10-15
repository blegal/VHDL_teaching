library IEEE;
use IEEE.std_logic_1164.all;

ENTITY reg_no_reset IS
	PORT ( 
		clock : IN  STD_LOGIC;
		e     : IN  STD_LOGIC;
		s     : OUT STD_LOGIC
	);
END reg_no_reset;

ARCHITECTURE behavior OF reg_no_reset IS
    SIGNAL mem : STD_LOGIC;
BEGIN

	PROCESS( clock )
	BEGIN
		IF clock'event and clock = '1' THEN
        	mem <= e;
        END IF;
    END PROCESS;

	PROCESS( clock )
	BEGIN
		IF rising_edge(clock) THEN
        	mem <= e;
        END IF;
    END PROCESS;

	s <= mem;

END;