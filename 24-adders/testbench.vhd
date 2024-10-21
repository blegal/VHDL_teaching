library IEEE;
use IEEE.std_logic_1164.all;

ENTITY testbench IS 
END testbench;

ARCHITECTURE comportement OF testbench IS

	COMPONENT add_8b_v1 IS
	PORT (
		A :  IN std_logic_vector(7 downto 0);
		B :  IN std_logic_vector(7 downto 0);
		C : OUT std_logic_vector(7 downto 0)
	);
	END COMPONENT;

	COMPONENT add_8b_v2 IS
	PORT (
		A :  IN std_logic_vector(7 downto 0);
		B :  IN std_logic_vector(7 downto 0);
		C : OUT std_logic_vector(7 downto 0)
	);
	END COMPONENT;

	COMPONENT add_9b_v1 IS
	PORT (
		A :  IN std_logic_vector(7 downto 0);
		B :  IN std_logic_vector(7 downto 0);
		C : OUT std_logic_vector(8 downto 0)
	);
	END COMPONENT;

	COMPONENT add_9b_v2 IS
	PORT (
		A :  IN std_logic_vector(7 downto 0);
		B :  IN std_logic_vector(7 downto 0);
		C : OUT std_logic_vector(8 downto 0)
	);
	END COMPONENT;

	COMPONENT add_9b_v3 IS
	PORT (
		A :  IN std_logic_vector(7 downto 0);
		B :  IN std_logic_vector(7 downto 0);
		C : OUT std_logic_vector(8 downto 0)
	);
	END COMPONENT;

	SIGNAL A : STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL B : STD_LOGIC_VECTOR(7 downto 0);

	SIGNAL S1 : STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL S2 : STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL S3 : STD_LOGIC_VECTOR(8 downto 0);
	SIGNAL S4 : STD_LOGIC_VECTOR(8 downto 0);
	SIGNAL S5 : STD_LOGIC_VECTOR(8 downto 0);
		
BEGIN

	dut1 :  add_8b_v1 port map ( A, B, S1 );
	dut2 :  add_8b_v2 port map ( A, B, S2 );
	dut3 :  add_9b_v1 port map ( A, B, S3 );
	dut4 :  add_9b_v2 port map ( A, B, S4 );
	dut5 :  add_9b_v3 port map ( A, B, S5 );
	
	entree: PROCESS
	begin
		A <= "00000000";
		B <= "00000000";
	    wait for 10 ns; 

		A <= "00000001";
		B <= "00000001";
	    wait for 10 ns; 

		A <= "00000010";
		B <= "00000010";
	    wait for 10 ns; 

		A <= "10000001";
		B <= "01000001";
	    wait for 10 ns; 

		A <= "11111111";
		B <= "00000001";
	    wait for 10 ns; 

		A <= "00001111";
		B <= "11110000";
	    wait for 10 ns; 

		A <= "10000000";
		B <= "10000000";
	    wait for 10 ns; 

		A <= "10000001";
		B <= "01111111";
	    wait for 10 ns; 

		wait;
	end process entree;
	
	
END comportement;