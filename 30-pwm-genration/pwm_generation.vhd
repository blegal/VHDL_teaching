library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

ENTITY pwm_generation IS
	PORT (
		CLK : in  STD_LOGIC;
		RST : in  STD_LOGIC;
		LMT : in  STD_LOGIC_VECTOR(2 DOWNTO 0);
		O   : out STD_LOGIC
	);
END pwm_generation;

ARCHITECTURE Behavioral OF pwm_generation IS
	SIGNAL COUNTER : UNSIGNED(2 DOWNTO 0);
BEGIN

	PROCESS(RST, CLK)
	BEGIN
		IF RST = '1' THEN
			COUNTER <= TO_UNSIGNED( 0, 3 );
		ELSIF CLK = '1' AND CLK'EVENT THEN
			COUNTER <= COUNTER + TO_UNSIGNED( 1, 3 );
		END IF;
	END PROCESS;

	O <= '1' WHEN COUNTER < UNSIGNED(LMT) ELSE '0';

END Behavioral;