LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY fonc_logique IS
PORT (
        A : IN  std_logic_vector(3 downto 0);
        B : IN  std_logic_vector(3 downto 0);
        S : OUT std_logic
	);
END fonc_logique;

ARCHITECTURE arch OF fonc_logique IS
	SIGNAL rev_b : std_logic_vector(3 downto 0);
	SIGNAL aXorB : std_logic_vector(3 downto 0);
	SIGNAL reduc : std_logic_vector(1 downto 0);
BEGIN

	rev_b <= B(0) & B(1) & B(2) B(3);
	aXorB <= A xor rev_b;
	reduc <= aXorB(1 downto 0) AND aXorB(3 downto 2)
	S     <= reduc(0) AND reduc(1);

END arch;
