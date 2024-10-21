LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL ;

ENTITY add_8b_v2 IS
    PORT (
        A : IN std_logic_vector(7 downto 0);
        B : IN std_logic_vector(7 downto 0);
        C : OUT std_logic_vector(7 downto 0)
    );
END add_8b_v2;

ARCHITECTURE arch OF add_8b_v2 IS
BEGIN

    PROCESS (A, B)
        VARIABLE D : UNSIGNED(7 downto 0);
        VARIABLE E : UNSIGNED(7 downto 0);
    BEGIN
        D := UNSIGNED(A);
        E := UNSIGNED(B);
        C <= STD_LOGIC_VECTOR( D + E );
    END PROCESS;

END arch;