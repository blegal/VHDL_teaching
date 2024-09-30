LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY mux_4_when_else IS
PORT (
        A : IN  std_logic_vector(3 downto 0);
        B : IN  std_logic_vector(3 downto 0);
        C : IN  std_logic_vector(3 downto 0);
        D : IN  std_logic_vector(3 downto 0);
        E : IN  std_logic_vector(1 downto 0);
        S : OUT std_logic_vector(3 downto 0)
	);
END mux_4_when_else;

ARCHITECTURE arch OF mux_4_when_else IS
BEGIN

	S <= A WHEN E = "00" ELSE
	     B WHEN E = "01" ELSE
	     C WHEN E = "10" ELSE
	     D;

END arch;
