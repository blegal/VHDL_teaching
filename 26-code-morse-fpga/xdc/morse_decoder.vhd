LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY morse_decoder IS
	PORT (
		clock     : IN  STD_LOGIC;
		reset     : IN  STD_LOGIC;
		data_i    : IN  STD_LOGIC;
		data_i_en : IN  STD_LOGIC;
		data_o    : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		data_o_en : OUT STD_LOGIC
	);
END morse_decoder;

ARCHITECTURE behavior OF morse_decoder IS

	SIGNAL decoded : STD_LOGIC_VECTOR( 7 DOWNTO 0);
	SIGNAL buff    : STD_LOGIC_VECTOR(15 DOWNTO 0);

BEGIN

	--
	--
	--
	PROCESS (clock)
	BEGIN
		IF rising_edge(clock) THEN
			IF reset = '1' THEN
				buff <= (OTHERS => '0');
			ELSIF data_i_en = '1' THEN
				buff <= buff(14 downto 0) & data_i;
			ELSIF (data_i_en = '0') AND buff(2 downto 0) = "000" THEN
				buff <= (OTHERS => '0');
			END IF;
		END IF;
	END PROCESS;

	--
	--
	--
	PROCESS (clock)
	BEGIN
		IF rising_edge(clock) THEN
			IF reset = '1' THEN
				data_o    <= (OTHERS => '0');
				data_o_en <= '0';
			ELSIF  buff(15 downto 3) /= "0000000000000" AND buff(2 downto 0) = "000" THEN
				data_o    <= decoded;
				data_o_en <= '1';
			ELSE
				data_o    <= (OTHERS => '0');
				data_o_en <= '0';
			END IF;
		END IF;
	END PROCESS;

	--
	--
	--
	PROCESS (buff)
	BEGIN
		CASE buff(15 downto 3) IS
			WHEN "0000000010111" => decoded <= "00000000"; -- A
			WHEN "0000111010101" => decoded <= "00000001"; -- B
			WHEN "0011101011101" => decoded <= "00000010"; -- C
			WHEN "0000001110101" => decoded <= "00000011"; -- D
			WHEN "0000000000001" => decoded <= "00000100"; -- E
			WHEN "0000101011101" => decoded <= "00000101"; -- F
			WHEN "0000111011101" => decoded <= "00000110"; -- G
			WHEN "0000001010101" => decoded <= "00000111"; -- H
			WHEN "0000000000101" => decoded <= "00001000"; -- I
			WHEN "1011101110111" => decoded <= "00001001"; -- J
			WHEN "0000111010111" => decoded <= "00001010"; -- K
			WHEN "0000101110101" => decoded <= "00001011"; -- L
			WHEN "0000001110111" => decoded <= "00001100"; -- M
			WHEN "0000000011101" => decoded <= "00001101"; -- N
			WHEN "0011101110111" => decoded <= "00001110"; -- O
			WHEN "0010111011101" => decoded <= "00001111"; -- P
			WHEN "1110111010111" => decoded <= "00010000"; -- Q
			WHEN "0000001011101" => decoded <= "00010001"; -- R
			WHEN "0000000010101" => decoded <= "00010010"; -- S
			WHEN "0000000000111" => decoded <= "00010011"; -- T
			WHEN "0000001010111" => decoded <= "00010100"; -- U
			WHEN "0000101010111" => decoded <= "00010101"; -- V
			WHEN "0000101110111" => decoded <= "00010110"; -- W
			WHEN "0011101010111" => decoded <= "00010111"; -- X
			WHEN "1110101110111" => decoded <= "00011000"; -- Y
			WHEN "0011101110101" => decoded <= "00011001"; -- Z
			WHEN OTHERS          => decoded <= "11111111"; -- Error
		END CASE;
	END PROCESS;

END;