library IEEE;
use IEEE.std_logic_1164.all;

ENTITY automate_1 IS 
	PORT ( 
		clock : IN  STD_LOGIC;
		reset : IN  STD_LOGIC;
		E     : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		O     : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END automate_1;

ARCHITECTURE arch OF automate_1 IS
    type t_State is (S0, S1, S2, S3);

    signal c_state : t_State;
    signal n_state : t_State;
BEGIN

	PROCESS( clock )
	BEGIN
	   IF rising_edge( clock ) THEN
	      IF reset = '1' THEN
              c_state <= S0;
          ELSE
              c_state <= n_state;
          END IF;
	   END IF;
	END PROCESS;

	PROCESS( E, c_state )
	BEGIN
	   CASE c_state IS
	    	WHEN S0 => IF E(0) = '1' THEN n_state <= S1;                                      ELSE n_state <= S0; END IF;
	    	WHEN S1 => IF E(1) = '1' THEN n_state <= S2; ELSIF E(0) = '0' THEN n_state <= S3; ELSE n_state <= S1; END IF;
			WHEN S2 => IF E(0) = '0' THEN n_state <= S3;                                      ELSE n_state <= S2; END IF;
			WHEN S3 => IF E(1) = '0' THEN n_state <= S0;                                      ELSE n_state <= S3; END IF;
	   END CASE;
	END PROCESS;

	PROCESS( c_state )
	BEGIN
	   CASE c_state IS
	       WHEN S0 => O <= "00";
	       WHEN S1 => O <= "01";
	       WHEN S2 => O <= "00";
	       WHEN S3 => O <= "10";
	   END CASE;
	END PROCESS;

END arch;
