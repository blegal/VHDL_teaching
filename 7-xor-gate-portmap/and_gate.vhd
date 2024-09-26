LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY and_gate IS
PORT (
        A : IN  std_logic;
        B : IN  std_logic;
        C : OUT std_logic
	);
END and_gate;

ARCHITECTURE arch OF and_gate IS
BEGIN

        C <= A AND B;

END arch;
