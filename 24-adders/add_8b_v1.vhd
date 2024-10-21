LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL ;

ENTITY add_8b_v1 IS
    PORT (
        A :  IN std_logic_vector(7 downto 0);
        B :  IN std_logic_vector(7 downto 0);
        C : OUT std_logic_vector(7 downto 0)
    );
END add_8b_v1;

ARCHITECTURE arch OF add_8b_v1 IS
BEGIN

    PROCESS (A, B)
    BEGIN
        C <= STD_LOGIC_VECTOR( UNSIGNED(A) + UNSIGNED(B) );
    END PROCESS;

END arch;