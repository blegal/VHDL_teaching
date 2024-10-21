LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL ;

ENTITY add_9b_v1 IS
    PORT (
        A :  IN std_logic_vector(7 downto 0);
        B :  IN std_logic_vector(7 downto 0);
        C : OUT std_logic_vector(8 downto 0)
    );
    END add_9b_v1;
ARCHITECTURE arch OF add_9b_v1 IS
BEGIN

    PROCESS (A, B)
        VARIABLE D : UNSIGNED(8 downto 0);
        VARIABLE E : UNSIGNED(8 downto 0);
    BEGIN
        D := '0' & UNSIGNED(A);
        E := '0' & UNSIGNED(B);
        C <= STD_LOGIC_VECTOR( D + E );
    END PROCESS;

END arch;