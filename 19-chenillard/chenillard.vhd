library IEEE;
use IEEE.std_logic_1164.all;

ENTITY chenillard IS
	PORT ( 
		clock : IN  STD_LOGIC;
		reset : IN  STD_LOGIC;
		s     : OUT STD_LOGIC_VECTOR(7 downto 0)
	);
END chenillard;

ARCHITECTURE behavior OF chenillard IS
    
    SIGNAL mem : STD_LOGIC_VECTOR(7 downto 0);

BEGIN

	PROCESS( clock )
	BEGIN
	   IF clock'event and clock = '1' THEN
	      IF reset = '1' THEN
		  	mem <= "00000001";
          ELSE
		  	mem <= mem(6 downto 0) & mem(7);
          END IF;
	   END IF;
	END PROCESS;

	s <= mem;

END;