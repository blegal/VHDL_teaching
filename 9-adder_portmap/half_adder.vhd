LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY half_adder IS
PORT (
        A   : IN  std_logic;
        B   : IN  std_logic;
        S   : OUT std_logic;
        Cou : OUT std_logic
	);
END half_adder;

ARCHITECTURE arch OF half_adder IS
BEGIN

        S   <= A XOR B;
	Cou <= A AND B;

END arch;
