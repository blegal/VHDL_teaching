LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY xor_gate_comb IS
PORT (
        A : IN  std_logic;
        B : IN  std_logic;
        C : OUT std_logic
	);
END xor_gate_comb;

ARCHITECTURE arch OF xor_gate_comb IS
BEGIN

	C <= A XOR B;

END arch;


