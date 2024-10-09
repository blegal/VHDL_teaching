LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY full_adder IS
PORT (
        A   : IN  std_logic;
        B   : IN  std_logic;
        Cin : IN  std_logic;
        S   : OUT std_logic;
        Cou : OUT std_logic
        );
END full_adder;

ARCHITECTURE arch OF full_adder IS
BEGIN

        S   <= A XOR B XOR Cin;
	Cou <= (A AND B) OR ((A XOR B) AND Cin);

END arch;
