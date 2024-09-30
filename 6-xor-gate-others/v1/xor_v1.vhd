LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY xor_v1 IS
PORT (
        A : IN  std_logic_vector(3 downto 0);
        B : IN  std_logic_vector(3 downto 0);
        C : OUT std_logic_vector(3 downto 0)
	);
END xor_v1;

ARCHITECTURE arch OF xor_v1 IS
BEGIN

	C(0) <= A(0) XOR B(0);
	C(1) <= A(1) XOR B(1);
	C(2) <= A(2) XOR B(2);
	C(3) <= A(3) XOR B(3);

END arch;
