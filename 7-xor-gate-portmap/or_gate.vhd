LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY or_gate IS
PORT (
        A : IN  std_logic;
        B : IN  std_logic;
        C : OUT std_logic
	);
END or_gate;

ARCHITECTURE arch OF or_gate IS
BEGIN

        C <= A OR B;

END arch;
