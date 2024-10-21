library IEEE;
use IEEE.std_logic_1164.all;

ENTITY reg_sync_load_8b IS
	PORT ( 
		clock : IN  STD_LOGIC;
		reset : IN  STD_LOGIC;
		load  : IN  STD_LOGIC;
		e     : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		s     : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END reg_sync_load_8b;

ARCHITECTURE behavior OF reg_sync_load_8b IS
    
    SIGNAL mem : STD_LOGIC_VECTOR(7 DOWNTO 0);

BEGIN

	PROCESS( clock )
	BEGIN
		IF rising_edge( clock ) THEN
			IF reset = '1' THEN
				mem <= (OTHERS => '0');
          	ELSIF load = '1' THEN
			  mem <= e;
          	END IF;
	   	END IF;
	END PROCESS;

	s <= mem;
END;