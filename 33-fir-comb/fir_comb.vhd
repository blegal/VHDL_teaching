LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY fir_comb IS
PORT (
        clock : IN  std_logic;
        reset : IN  std_logic;
        Xn    : IN  std_logic_vector(7 downto 0);   -- ENTRE -128 et 127
        Yn    : OUT std_logic_vector(7 downto 0)    -- ENTRE -128 et 127
	);
END fir_comb;

ARCHITECTURE arch OF fir_comb IS

    --
    -- LISTE DES COEFFICIENTS (TRONCATURE A L'INFERIEUR)
    --

    CONSTANT COEFF_01 : SIGNED(7 downto 0) := TO_SIGNED(-3, 8); ---0.028094547010435022
    CONSTANT COEFF_02 : SIGNED(7 downto 0) := TO_SIGNED( 0, 8); --+0.000000000000000007
    CONSTANT COEFF_03 : SIGNED(7 downto 0) := TO_SIGNED( 5, 8); --+0.042141820515652538
    CONSTANT COEFF_04 : SIGNED(7 downto 0) := TO_SIGNED(11, 8); --+0.090915863922831200
    CONSTANT COEFF_05 : SIGNED(7 downto 0) := TO_SIGNED(17, 8); --+0.136373795884246835
    CONSTANT COEFF_06 : SIGNED(7 downto 0) := TO_SIGNED(21, 8); --+0.168567282062610097
    CONSTANT COEFF_07 : SIGNED(7 downto 0) := TO_SIGNED(22, 8); --+0.180191569250188838
    CONSTANT COEFF_08 : SIGNED(7 downto 0) := TO_SIGNED(21, 8); --+0.168567282062610097
    CONSTANT COEFF_09 : SIGNED(7 downto 0) := TO_SIGNED(17, 8); --+0.136373795884246835
    CONSTANT COEFF_10 : SIGNED(7 downto 0) := TO_SIGNED(11, 8); --+0.090915863922831200
    CONSTANT COEFF_11 : SIGNED(7 downto 0) := TO_SIGNED( 5, 8); --+0.042141820515652538
    CONSTANT COEFF_12 : SIGNED(7 downto 0) := TO_SIGNED( 0, 8); --+0.000000000000000007
    CONSTANT COEFF_13 : SIGNED(7 downto 0) := TO_SIGNED(-3, 8); ---0.028094547010435022

    SIGNAL T01 : SIGNED(15 downto 0);
    SIGNAL T02 : SIGNED(15 downto 0);
    SIGNAL T03 : SIGNED(15 downto 0);
    SIGNAL T04 : SIGNED(15 downto 0);
    SIGNAL T05 : SIGNED(15 downto 0);
    SIGNAL T06 : SIGNED(15 downto 0);
    SIGNAL T07 : SIGNED(15 downto 0);
    SIGNAL T08 : SIGNED(15 downto 0);
    SIGNAL T09 : SIGNED(15 downto 0);
    SIGNAL T10 : SIGNED(15 downto 0);
    SIGNAL T11 : SIGNED(15 downto 0);
    SIGNAL T12 : SIGNED(15 downto 0);
    SIGNAL T13 : SIGNED(15 downto 0);

    SIGNAL SUM : SIGNED(15 downto 0);

    SIGNAL mem : SIGNED(13 * 8 - 1 downto 0);

BEGIN

    --
    -- INPUT REGISTER
    --
    PROCESS( clock )
    BEGIN
    IF clock'event and clock = '1' THEN
        IF reset = '1' THEN
            mem <= (OTHERS => '0');
        ELSE
            mem <= mem(12 * 8 - 1 downto 0) & SIGNED(Xn);
        END IF;
    END IF;
    END PROCESS;

    T01 <= COEFF_01 * mem(  7 downto  0);
    T02 <= COEFF_02 * mem( 15 downto  8);
    T03 <= COEFF_03 * mem( 23 downto 16);
    T04 <= COEFF_04 * mem( 31 downto 24);
    T05 <= COEFF_05 * mem( 39 downto 32);
    T06 <= COEFF_06 * mem( 47 downto 40);
    T07 <= COEFF_07 * mem( 55 downto 48);
    T08 <= COEFF_08 * mem( 63 downto 56);
    T09 <= COEFF_09 * mem( 71 downto 64);
    T10 <= COEFF_10 * mem( 79 downto 72);
    T11 <= COEFF_11 * mem( 87 downto 80);
    T12 <= COEFF_12 * mem( 95 downto 88);
    T13 <= COEFF_13 * mem(103 downto 96);

    SUM <= T01 + T02 + T03 + T04 + T05 + T06 + T07 + T08 + T09 + T10 + T11 + T12 + T13;

    PROCESS( clock )
	BEGIN
	    IF clock'event and clock = '1' THEN
	        IF reset = '1' THEN
                Yn <= (OTHERS => '0');
            ELSE
                Yn <= STD_LOGIC_VECTOR( SUM(14 downto 7) ); -- bit de signe
            END IF;
	    END IF;
	END PROCESS;

END arch;
