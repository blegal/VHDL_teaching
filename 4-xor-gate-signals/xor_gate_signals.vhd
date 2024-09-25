LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY xor_gate_signals IS
PORT (
        A : IN  std_logic;
        B : IN  std_logic;
        C : OUT std_logic
	);
END xor_gate_signals;

ARCHITECTURE arch OF xor_gate_signals IS
    SIGNAL T1 : STD_LOGIC;
    SIGNAL T2 : STD_LOGIC;
    SIGNAL T3 : STD_LOGIC;
    SIGNAL T4 : STD_LOGIC;
BEGIN

    T1 <= NOT A;
    T2 <= NOT B;
    T3 <= T1 AND  B;
    T4 <=  A AND T2;
    C  <= T3  OR T4;
    
END arch;
