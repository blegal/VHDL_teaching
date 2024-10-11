library IEEE;
use IEEE.std_logic_1164.all;

ENTITY automate_2 IS 
	PORT ( 
		clock : IN  STD_LOGIC;
		reset : IN  STD_LOGIC;
		E     : IN  STD_LOGIC;
		O     : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END automate_2;

ARCHITECTURE arch OF automate_2 IS
    type t_State is (S1, S2, S3, S4);

    signal c_state : t_State;
    signal n_state : t_State;
BEGIN

	PROCESS( clock )
	BEGIN
	   IF rising_edge( clock ) THEN
	      IF reset = '1' THEN
              c_state <= S1;
          ELSE
              c_state <= n_state;
          END IF;
	   END IF;
	END PROCESS;

	PROCESS( E, c_state )
	BEGIN
	   CASE c_state IS
	       WHEN S1 => IF E = '1' THEN n_state <= S2; ELSE n_state <= S1; END IF;
	       WHEN S2 => IF E = '1' THEN n_state <= S2; ELSE n_state <= S3; END IF;
	       WHEN S3 => IF E = '0' THEN n_state <= S4; ELSE n_state <= S2; END IF;
	       WHEN S4 =>                                     n_state <= S1;
	   END CASE;
	END PROCESS;

	PROCESS( c_state )
	BEGIN
	   CASE c_state IS
	       WHEN S1 => O <= "001";
	       WHEN S2 => O <= "010";
	       WHEN S3 => O <= "010";
	       WHEN S4 => O <= "100";
	   END CASE;
	END PROCESS;

END arch;
