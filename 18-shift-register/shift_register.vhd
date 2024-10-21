library IEEE;
use IEEE.std_logic_1164.all;

ENTITY shift_register IS
	PORT ( 
		clock : IN  STD_LOGIC;
		reset : IN  STD_LOGIC;
		load  : IN  STD_LOGIC;
		e     : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		s     : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END shift_register;

ARCHITECTURE behavior OF shift_register IS
    SIGNAL mem : STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN

	PROCESS( clock )
	BEGIN
	   IF clock'event and clock = '1' THEN
	      IF reset = '1' THEN
		  	mem <= "0000";
		ELSIF load ='1' THEN
		  	mem <= e;
		ELSE
			mem <= mem(2 downto 0) & '0';
		END IF;
	   END IF;
	END PROCESS;

	s <= mem;

END;