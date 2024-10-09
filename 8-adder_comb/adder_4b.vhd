LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY adder_4b IS
PORT (
        A : IN  std_logic_vector(3 downto 0);
        B : IN  std_logic_vector(3 downto 0);
        S : OUT std_logic_vector(4 downto 0)
	);
END adder_4b;

ARCHITECTURE arch OF adder_4b IS
	SIGNAL c0 : std_logic;
	SIGNAL c1 : std_logic;
	SIGNAL c2 : std_logic;
    SIGNAL c3 : std_logic;
BEGIN

	S(0) <= A(0) XOR B(0);
	S(1) <= A(1) XOR B(1) XOR C0;
	S(2) <= A(2) XOR B(2) XOR C1;
	S(3) <= A(3) XOR B(3) XOR C2;
	
	C0   <= (A(0) AND B(0));
	C1   <= (A(1) AND B(1)) OR ((A(1) XOR B(1)) AND C0);
	C2   <= (A(2) AND B(2)) OR ((A(2) XOR B(2)) AND C1);
	S(4) <= (A(3) AND B(3)) OR ((A(3) XOR B(3)) AND C2);

END arch;
