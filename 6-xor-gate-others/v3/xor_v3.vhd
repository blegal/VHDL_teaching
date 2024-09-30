
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY xor_v3 IS
PORT (
        A : IN  std_logic_vector(3 downto 0);
        B : IN  std_logic_vector(3 downto 0);
        C : OUT std_logic_vector(3 downto 0)
	);
END xor_v3;

ARCHITECTURE arch OF xor_v3 IS
	SIGNAL D0, D1, D2, D3 : STD_LOGIC;
BEGIN

	D3 <= A(3) XOR B(3);
	D2 <= A(2) XOR B(2);
	D1 <= A(1) XOR B(1);
	D0 <= A(0) XOR B(0);
	C  <= (D3 & D2 & D1 & D0);

END arch;
