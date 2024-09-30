LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY mux_4_if_else IS
PORT (
        A : IN  std_logic_vector(3 downto 0);
        B : IN  std_logic_vector(3 downto 0);
        C : IN  std_logic_vector(3 downto 0);
        D : IN  std_logic_vector(3 downto 0);
        E : IN  std_logic_vector(1 downto 0);
        S : OUT std_logic_vector(3 downto 0)
	);
END mux_4_if_else;

ARCHITECTURE arch OF mux_4_if_else IS
BEGIN

	PROCESS(A, B, C, D, E)
	BEGIN
		IF   ( E = "00" ) THEN S <= A;
		ELSIF( E = "01" ) THEN S <= B;
		ELSIF( E = "10" ) THEN S <= C;
		ELSE                   S <= D;
		END IF;
	END PROCESS;

END arch;
