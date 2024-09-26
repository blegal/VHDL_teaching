LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY xor_portmap IS
PORT (
        A : IN  std_logic;
        B : IN  std_logic;
        C : OUT std_logic
	);
END xor_portmap;

ARCHITECTURE arch OF xor_portmap IS

	COMPONENT not_gate IS
	PORT (
		A : IN  std_logic;
		B : OUT std_logic
	);
	END COMPONENT;

	COMPONENT and_gate IS
	PORT (
        A : IN  std_logic;
        B : IN  std_logic;
        C : OUT std_logic
	);
	END COMPONENT;

	COMPONENT or_gate IS
	PORT (
        A : IN  std_logic;
        B : IN  std_logic;
        C : OUT std_logic
	);
	END COMPONENT;

	SIGNAL T1, T2, T3, T4 : STD_LOGIC;

BEGIN

	c1 : not_gate port map(A =>  A, B => T1         );
	c2 : not_gate port map(A =>  B, B => T2         );
	c3 : and_gate port map(A => T1, B => B,  C => T3);
	c4 : and_gate port map(A =>  A, B => T2, C => T4);
	c5 :  or_gate port map(A => T3, B => T4, C =>  C);

END arch;
