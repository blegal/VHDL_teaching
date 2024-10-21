LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY min4_v1 IS
    PORT (
        A : in  STD_LOGIC_VECTOR(7 DOWNTO 0);
        B : in  STD_LOGIC_VECTOR(7 DOWNTO 0);
        C : in  STD_LOGIC_VECTOR(7 DOWNTO 0);
        D : in  STD_LOGIC_VECTOR(7 DOWNTO 0);
        S : out STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
END min4_v1;

ARCHITECTURE Behavioral OF min4_v1 IS
BEGIN

    PROCESS(A, B, C, D)
        VARIABLE T1, T2, T3 : STD_LOGIC_VECTOR(7 DOWNTO 0);
    BEGIN
        IF UNSIGNED(A) < UNSIGNED(B) THEN
            T1 := A;
        ELSE
            T1 := B;
        END IF;
        IF UNSIGNED(C) < UNSIGNED(D) THEN
            T2 := C;
        ELSE
            T2 := D;
        END IF;
        IF UNSIGNED(T1) < UNSIGNED(T2) THEN
            S <= T1;
        ELSE
            S <= T2;
        END IF;
    END PROCESS;

END Behavioral;