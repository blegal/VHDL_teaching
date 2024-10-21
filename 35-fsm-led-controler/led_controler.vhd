library IEEE;
use IEEE.std_logic_1164.all;

ENTITY led_controler IS 
	PORT ( 
		clock  : IN  STD_LOGIC;
		reset  : IN  STD_LOGIC;
		button : IN  STD_LOGIC;
		red    : OUT STD_LOGIC;
		orange : OUT STD_LOGIC;
		green  : OUT STD_LOGIC
	);
END led_controler;

ARCHITECTURE arch OF led_controler IS
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

	PROCESS( button, c_state )
	BEGIN
	   CASE c_state IS
	    	WHEN S0 =>
				IF button = '1' THEN n_state <= S1;
				ELSE                 n_state <= S0;
				END IF;
	    	WHEN S1 =>
				IF button = '0' THEN n_state <= S2;
				ELSE                 n_state <= S1;
				END IF;
			WHEN S2 =>
				IF button = '1' THEN n_state <= S3;
				ELSE                 n_state <= S2;
				END IF;
			WHEN S3 =>
				IF button = '0' THEN n_state <= S0;
				ELSE                 n_state <= S3;
				END IF;
	   END CASE;
	END PROCESS;

	PROCESS( c_state )
	BEGIN
	   CASE c_state IS
	       WHEN S0 =>  	red    <= '1';
						orange <= '0';
						green  <= '0';
	       WHEN S1 =>   red    <= '0';
		   				orange <= '1';
		   				green  <= '0';
	       WHEN S2 =>  	red    <= '0';
		   				orange <= '0';
		   				green  <= '1';
	       WHEN S3 =>   red    <= '0';
		   				orange <= '1';
		   				green  <= '0';
	   END CASE;
	END PROCESS;

END arch;
