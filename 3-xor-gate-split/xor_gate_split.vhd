LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY xor_gate_split IS
PORT (
        A : IN  std_logic;
        B : IN  std_logic;
        C : OUT std_logic
	);
END xor_gate_split;

ARCHITECTURE arch OF xor_gate_split IS
BEGIN

    PROCESS(A, B)
	BEGIN
		C <= ((NOT A) AND B) OR (A AND (NOT B));
	END PROCESS;

END arch;
