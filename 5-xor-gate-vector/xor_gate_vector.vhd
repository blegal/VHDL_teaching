LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY xor_gate_vector IS
PORT (
        A : IN  std_logic_vector(3 downto 0);
        B : IN  std_logic_vector(3 downto 0);
        C : OUT std_logic_vector(3 downto 0)
	);
END xor_gate_vector;

ARCHITECTURE arch OF xor_gate_vector IS
BEGIN

        C <= A XOR B;

END arch;


