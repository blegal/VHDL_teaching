LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY tzcnt IS
PORT (
        A : IN  std_logic_vector(7 downto 0);
        B : IN  std_logic;
        C : OUT std_logic_vector(3 downto 0)
	);
END tzcnt;

ARCHITECTURE arch OF tzcnt IS
    SIGNAL R : std_logic_vector(7 downto 0);
    SIGNAL T : std_logic_vector(7 downto 0);
BEGIN

    R <= A(0) & A(1) & A(2) & A(3) & A(4) & A(5) & A(6) & A(7);

    T <= A WHEN B = '0' ELSE R;

    C <= "0001" WHEN T(0) = '1' ELSE
         "0010" WHEN T(1) = '1' ELSE
         "0011" WHEN T(2) = '1' ELSE
         "0100" WHEN T(3) = '1' ELSE
         "0101" WHEN T(4) = '1' ELSE
         "0110" WHEN T(5) = '1' ELSE
         "0111" WHEN T(6) = '1' ELSE
         "1000" WHEN T(7) = '1' ELSE
         "1111";

END arch;
