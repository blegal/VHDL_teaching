------------------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY xor_v2 IS
PORT (
        A : IN  std_logic_vector(3 downto 0);
        B : IN  std_logic_vector(3 downto 0);
        C : OUT std_logic_vector(3 downto 0)
	);
END xor_v2;

ARCHITECTURE arch OF xor_v2 IS
BEGIN

	C(1 DOWNTO 0) <= A(1 DOWNTO 0) XOR B(1 DOWNTO 0);
	C(3 DOWNTO 2) <= A(3 DOWNTO 2) XOR B(3 DOWNTO 2);

END arch;
------------------------------------------------------------------------------------------