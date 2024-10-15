LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY morse_encoder IS
	PORT (
		clock     : IN  STD_LOGIC;
		reset     : IN  STD_LOGIC;
		data_i    : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		data_i_en : IN  STD_LOGIC;
		data_o    : OUT STD_LOGIC;
		data_o_en : OUT STD_LOGIC
	);
END morse_encoder;

ARCHITECTURE behavior OF morse_encoder IS

	TYPE rom_type IS ARRAY (0 TO 25) OF STD_LOGIC_VECTOR(12 DOWNTO 0);
	
	CONSTANT memory : rom_type := (
		"1011100000000", -- A
		"1110101010000", -- B
		"1110101110100", -- C
		"1110101000000", -- D
		"1000000000000", -- E
		"1010111010000", -- F
		"1110111010000", -- G
		"1010101000000", -- H
		"1010000000000", -- I
		"1011101110111", -- J
		"1110101110000", -- K
		"1011101010000", -- L
		"1110111000000", -- M
		"1110100000000", -- N
		"1110111011100", -- O
		"1011101110100", -- P
		"1110111010111", -- Q
		"1011101000000", -- R
		"1010100000000", -- S
		"1110000000000", -- T
		"1010111000000", -- U
		"1010101110000", -- V
		"1011101110000", -- W
		"1110101011100", -- X
		"1110101110111", -- Y
		"1110111010100" -- Z
	);

	TYPE t_State IS (S0, S1, S2, S3);

	SIGNAL c_state : t_State;
	SIGNAL n_state : t_State;

	SIGNAL buff : STD_LOGIC_VECTOR(12 DOWNTO 0);
	SIGNAL sreg : STD_LOGIC_VECTOR(14 DOWNTO 0);

BEGIN

	--
	--
	--
	PROCESS (clock)
	BEGIN
		IF rising_edge(clock) THEN
			IF reset = '1' THEN
				c_state <= S0;
			ELSE
				c_state <= n_state;
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
				buff <= "0000000000000";
			ELSIF (data_i_en = '1') and (c_state = S0) THEN
				buff <= memory( TO_INTEGER( UNSIGNED(data_i) ) );
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
				sreg <= "000000000000000";
			ELSIF c_state = S1 THEN
				sreg <= "00" & buff;
			ELSIF c_state = S2 THEN
				sreg <= sreg(13 downto 0) & '0';
			END IF;
		END IF;
	END PROCESS;

	--
	--
	--
	PROCESS (c_state, data_i_en, sreg)
	BEGIN
		CASE c_state IS
			WHEN S0 =>
				IF data_i_en = '1' THEN
					n_state <= S1;
				ELSE
					n_state <= S0;
				END IF;

			WHEN S1 => n_state <= S2;

			WHEN S2 =>
				IF sreg(14 downto 12) /= "000" THEN
					n_state <= S2;
				ELSE
					n_state <= S0;
--					n_state <= S3;
				END IF;

			WHEN S3 => n_state <= S0;

		END CASE;
	END PROCESS;

	data_o_en <= '1' WHEN c_state = S2 ELSE '0';
	data_o    <= sreg(12);

END;