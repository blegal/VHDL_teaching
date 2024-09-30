LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY mux_4_case_is IS
PORT (
        A : IN  std_logic_vector(3 downto 0);
        B : IN  std_logic_vector(3 downto 0);
        C : IN  std_logic_vector(3 downto 0);
        D : IN  std_logic_vector(3 downto 0);
        E : IN  std_logic_vector(1 downto 0);
        S : OUT std_logic_vector(3 downto 0)
	);
END mux_4_case_is;

ARCHITECTURE arch OF mux_4_case_is IS
BEGIN

	PROCESS(A, B, C, D, E)
	BEGIN
		CASE E IS
			WHEN "00"   => S <= A;
			WHEN "01"   => S <= B;
			WHEN "10"   => S <= C;
			WHEN OTHERS => S <= D;
		END CASE;
	END PROCESS;

END arch;
