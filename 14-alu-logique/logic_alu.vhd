LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY logic_alu IS
PORT (
        A : IN  std_logic;
        B : IN  std_logic;
        C : IN  std_logic_vector(2 downto 0);
        D : OUT std_logic
	);
END logic_alu;

ARCHITECTURE arch OF logic_alu IS
BEGIN

    D <= 	NOT A    WHEN C = "000" ELSE
			NOT B    WHEN C = "001" ELSE
            A AND B  WHEN C = "010" ELSE
            A OR B   WHEN C = "011" ELSE
            A NAND B WHEN C = "100" ELSE
        	A NOR B  WHEN C = "101" ELSE
        	A XOR B;

END arch;
