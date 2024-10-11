library IEEE;
use IEEE.std_logic_1164.all;

ENTITY automate_1_rtl IS 
	PORT ( 
		clock : IN  STD_LOGIC;
		reset : IN  STD_LOGIC;
		E     : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		O     : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END automate_1_rtl;

ARCHITECTURE arch OF automate_1_rtl IS
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

    -- OK
    
    D(0) <= (               (NOT E(1)) AND     Q(0) AND (NOT Q(1))) OR
            (     E(0)  AND (NOT E(1))                            ) OR
            ((NOT E(0)) AND      E(1)                             );

    D(1) <= (    E(1)                                             ) OR
            (NOT E(0)   AND                    Q(0) AND (NOT Q(1)));

    O(0) <= (Q(0) AND NOT Q(1));
    O(1) <= (Q(0) AND     Q(1));

END arch;
