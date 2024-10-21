LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY min4_v2 IS
    PORT (
        A : in  STD_LOGIC_VECTOR(7 DOWNTO 0);
        B : in  STD_LOGIC_VECTOR(7 DOWNTO 0);
        C : in  STD_LOGIC_VECTOR(7 DOWNTO 0);
        D : in  STD_LOGIC_VECTOR(7 DOWNTO 0);
        S : out STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
END min4_v2;

ARCHITECTURE Behavioral OF min4_v2 IS

    FUNCTION mini(A, B: STD_LOGIC_VECTOR )
        return STD_LOGIC_VECTOR IS
    BEGIN
        IF UNSIGNED(A) < UNSIGNED(B) THEN
            RETURN A;
        ELSE
            RETURN B;
        END IF;
    END mini;

BEGIN

    PROCESS(A, B, C, D)
        VARIABLE T1, T2 : STD_LOGIC_VECTOR(7 DOWNTO 0);
    BEGIN
        T1 := mini( A,  B);
        T2 := mini( C,  D);
        S  <= mini(T1, T2);
    END PROCESS;

END Behavioral;