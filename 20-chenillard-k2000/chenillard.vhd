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
    
	SIGNAL mem  : STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL sens : STD_LOGIC;

BEGIN

	PROCESS( clock )
	BEGIN
	   IF clock'event and clock = '1' THEN
	      IF reset = '1' THEN
		  	mem  <= "00000010";
			sens <= '0';
          ELSE
		  	IF mem = "00000001" THEN
			  	mem  <= mem(6 downto 0) & mem(7);
				sens <= '0';

			ELSIF mem = "10000000" THEN
				mem  <= mem(0) & mem(7 downto 1);
				sens <= '1';

			ELSIF SENS = '0' THEN
				mem  <= mem(6 downto 0) & mem(7);

			ELSIF SENS = '1' THEN
				mem  <= mem(0) & mem(7 downto 1);

			END IF;
          END IF;
	   END IF;
	END PROCESS;

	s <= mem;

END;