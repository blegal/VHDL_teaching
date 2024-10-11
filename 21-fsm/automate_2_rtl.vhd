library IEEE;
use IEEE.std_logic_1164.all;

ENTITY automate_2_rtl IS 
	PORT ( 
		clock : IN  STD_LOGIC;
		reset : IN  STD_LOGIC;
		E     : IN  STD_LOGIC;
		O     : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END automate_2_rtl;

ARCHITECTURE arch OF automate_2_rtl IS
 	SIGNAL Q : STD_LOGIC_VECTOR(1 DOWNTO 0);
 	SIGNAL D : STD_LOGIC_VECTOR(1 DOWNTO 0);
BEGIN

	PROCESS( clock )
	BEGIN
	   IF rising_edge( clock ) THEN
	      IF reset = '1' THEN
              Q <= "00";
          ELSE
              Q <= D;
          END IF;
	   END IF;
	END PROCESS;

    D(0) <= (E AND (NOT Q(1))               ) OR (                 Q(1)  AND (NOT Q(0)));
    D(1) <= (NOT E) AND (Q(0) XOR Q(1));

    O(0) <= (NOT Q(0) AND NOT Q(1));
    O(1) <= (Q(0) XOR Q(1));
    O(2) <= (Q(0) AND Q(1));

END arch;
