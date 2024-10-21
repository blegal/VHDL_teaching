LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL ;

ENTITY add_9b_v3 IS
    PORT (
        A :  IN std_logic_vector(7 downto 0);
        B :  IN std_logic_vector(7 downto 0);
        C : OUT std_logic_vector(8 downto 0)
    );
END add_9b_v3;

ARCHITECTURE arch OF add_9b_v3 IS
BEGIN

    PROCESS (A, B)
        VARIABLE D : SIGNED(7 downto 0);
        VARIABLE E : SIGNED(7 downto 0);
    BEGIN
        D := SIGNED(A);
        E := SIGNED(B);
        C <= STD_LOGIC_VECTOR( RESIZE(D, 9) + RESIZE(E, 9) );
    END PROCESS;

END arch;