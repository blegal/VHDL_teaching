library IEEE;
use IEEE.std_logic_1164.all;

ENTITY testbench IS 
END testbench;

ARCHITECTURE comportement OF testbench IS

	COMPONENT morse_encoder IS
	PORT (
		clock     : IN  STD_LOGIC;
		reset     : IN  STD_LOGIC;
		data_i    : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		data_i_en : IN  STD_LOGIC;
		data_o    : OUT STD_LOGIC;
		data_o_en : OUT STD_LOGIC
	);
	END COMPONENT;

	COMPONENT morse_decoder IS
	PORT (
		clock     : IN  STD_LOGIC;
		reset     : IN  STD_LOGIC;
		data_i    : IN  STD_LOGIC;
		data_i_en : IN  STD_LOGIC;
		data_o    : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		data_o_en : OUT STD_LOGIC
	);
	END COMPONENT;


 	SIGNAL clock    : STD_LOGIC;
 	SIGNAL reset    : STD_LOGIC;
 	SIGNAL idata    : STD_LOGIC_VECTOR(7 downto 0);
 	SIGNAL idata_en : STD_LOGIC;
 	SIGNAL tdata    : STD_LOGIC;
 	SIGNAL tdata_en : STD_LOGIC;
 	SIGNAL odata    : STD_LOGIC_VECTOR(7 downto 0);
 	SIGNAL odata_en : STD_LOGIC;
		
BEGIN

	enc :  morse_encoder port map ( clock, reset, idata, idata_en, tdata, tdata_en );

	dec :  morse_decoder port map ( clock, reset, tdata, tdata_en, odata, odata_en );

	PROCESS 
	BEGIN
		clock <= '0';
		while true loop
			clock <= '0'; wait for 5 ns;
			clock <= '1'; wait for 5 ns;
		end loop;
		wait;
	END PROCESS;
	
	entree: PROCESS
	begin
		reset    <= '1';
		idata    <= "00000001";
		idata_en <= '0';
	    wait for 20 ns;

		reset <= '0';
	    wait for 20 ns;

		--
		-- Nouveau transfert de donnée
		--

		idata    <= "00000001";
		idata_en <= '1';
	    wait for 10 ns;

		--
		-- On attend que la transmission soit terminée
		--
		idata_en <= '0';
	    wait for 10 ns; -- temps de start
		while tdata_en = '1' loop
			wait for 10 ns;
		end loop;
		wait for 10 ns;

		--
		-- Nouveau transfert de donnée
		--

		idata    <= "00000010";
		idata_en <= '1';
	    wait for 10 ns;

		--
		-- On attend que la transmission soit terminée
		--
		idata_en <= '0';
	    wait for 10 ns; -- temps de start
		while tdata_en = '1' loop
			wait for 10 ns;
		end loop;
		wait for 10 ns;

		--
		-- Nouveau transfert de donnée
		--

		idata    <= "00001000";
		idata_en <= '1';
	    wait for 10 ns;

		--
		-- On attend que la transmission soit terminée
		--
		idata_en <= '0';
	    wait for 10 ns; -- temps de start
		while tdata_en = '1' loop
			wait for 10 ns;
		end loop;
		wait for 10 ns;

		wait;
	end process entree;
	
	
END comportement;