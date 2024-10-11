library IEEE;
use IEEE.std_logic_1164.all;

ENTITY automate_1_rtl_tb IS 
END automate_1_rtl_tb;

ARCHITECTURE comportement OF automate_1_rtl_tb IS

	COMPONENT automate_1_rtl IS
        PORT ( 
            clock : IN  STD_LOGIC;
            reset : IN  STD_LOGIC;
            E     : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
            O     : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
        );
    END COMPONENT;

 	SIGNAL signal_clock : STD_LOGIC;
 	SIGNAL signal_reset : STD_LOGIC;
 	SIGNAL signal_e     : STD_LOGIC_VECTOR(1 DOWNTO 0);
 	SIGNAL signal_o     : STD_LOGIC_VECTOR(1 DOWNTO 0);
		
BEGIN

	cnt : automate_1_rtl
	port map (
			clock => signal_clock,
			reset => signal_reset,
			e     => signal_e,
			o     => signal_o
		);

	horloge : PROCESS 
	BEGIN
		signal_clock <= '0';
		for i in 0 to 400 loop
			signal_clock <= '0'; wait for 5 ns;
			signal_clock <= '1'; wait for 5 ns;
		end loop;
		wait; -- pour arreter le processus
	END PROCESS horloge;
	
	entree: PROCESS
	begin
		signal_e     <= "00";
		signal_reset <= '1';
	    wait for 60 ns; 

		signal_reset <= '0';
	    wait for 20 ns; 

        
		signal_e <= "01";
	    wait for 60 ns; 

		signal_e <= "11";
	    wait for 60 ns; 

		signal_e <= "10";
	    wait for 60 ns; 

		signal_e <= "00";
	    wait for 60 ns; 


		wait;
	end process entree;
	
	
END comportement;
