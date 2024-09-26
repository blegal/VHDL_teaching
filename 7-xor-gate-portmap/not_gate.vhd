LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY not_gate IS
PORT (
        A : IN  std_logic;
        B : OUT std_logic
        );
END not_gate;

ARCHITECTURE arch OF not_gate IS
BEGIN

        B <= NOT A;

END arch;
