LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY adder_4b IS
	PORT (
		A : IN  std_logic_vector(3 downto 0);
		B : IN  std_logic_vector(3 downto 0);
		S : OUT std_logic_vector(4 downto 0)
	);
END adder_4b;

ARCHITECTURE arch OF adder_4b IS

	COMPONENT full_adder IS
	PORT (
		A   : IN  std_logic;
		B   : IN  std_logic;
		Cin : IN  std_logic;
		S   : OUT std_logic;
		Cou : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT half_adder IS
	PORT (
        A   : IN  std_logic;
        B   : IN  std_logic;
        S   : OUT std_logic;
        Cou : OUT std_logic
		);
	END COMPONENT;
	
	SIGNAL C0, C1, C2 : STD_LOGIC;

BEGIN

	i1 : half_adder port map(A(0), B(0), S(0),       C0  );
	i2 : full_adder port map(A(1), B(1), C0,   S(1), C1  );
	i3 : full_adder port map(A(2), B(2), C1,   S(2), C2  );
	i4 : full_adder port map(A(3), B(3), C2,   S(3), S(4));

END arch;
