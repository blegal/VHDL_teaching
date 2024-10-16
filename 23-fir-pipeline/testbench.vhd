-- Testbench created online at:
--   https://www.doulos.com/knowhow/perl/vhdl-testbench-creation-using-perl/
-- Copyright Doulos Ltd
library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity testbench is
end;

architecture bench of testbench is

  COMPONENT fir_pipeline IS
  PORT (
    clock : IN  std_logic;
    reset : IN  std_logic;
    Xn    : IN  std_logic_vector(7 downto 0);   -- ENTRE -128 et 127
    Yn    : OUT std_logic_vector(7 downto 0)    -- ENTRE -128 et 127
  );
  END COMPONENT;
  
  signal clock : std_logic;
  signal reset : std_logic;
  signal Xn    : std_logic_vector(7 downto 0);
  signal Yn    : std_logic_vector(7 downto 0);

  function to_bstring(sl : std_logic) return string is
    variable sl_str_v : string(1 to 3);  -- std_logic image with quotes around
  begin
    sl_str_v := std_logic'image(sl);
    return "" & sl_str_v(2);  -- "" & character to get string
  end function;
  
  function to_bstring(slv : std_logic_vector) return string is
    alias    slv_norm : std_logic_vector(1 to slv'length) is slv;
    variable sl_str_v : string(1 to 1);  -- String of std_logic
    variable res_v    : string(1 to slv'length);
  begin
    for idx in slv_norm'range loop
      sl_str_v := to_bstring(slv_norm(idx));
      res_v(idx) := sl_str_v(1);
    end loop;
    return res_v;
  end function;

begin

  uut: fir_pipeline port map (  clock => clock,
                                reset => reset,
                                Xn    => Xn,
                                Yn    => Yn
                              );

  PROCESS 
  BEGIN
    clock <= '0';
    while true loop
      clock <= '0'; wait for 5 ns;
      clock <= '1'; wait for 5 ns;
    end loop;
    wait;
  END PROCESS;
                                                
  stimulus: process
  begin
    REPORT "Simulation start...";
    reset <= '1';
    Xn    <= STD_LOGIC_VECTOR( TO_SIGNED(0, 8) );
    wait for 10 ns;

    reset <= '0';
    Xn    <= STD_LOGIC_VECTOR( TO_SIGNED(0, 8) );
    wait for 10 ns;

    --
    -- On teste la réponse du filtre à un echelon
    --

    Xn    <= STD_LOGIC_VECTOR( TO_SIGNED(100, 8) );
    wait for 10 ns;

    Xn    <= STD_LOGIC_VECTOR( TO_SIGNED(0, 8) );
    wait for 150 ns;

    --
    -- On teste la réponse du filtre à un créneau
    --

    Xn    <= STD_LOGIC_VECTOR( TO_SIGNED(100, 8) );
    wait for 200 ns;


    --
    -- On pourrait tester une vraie forme d'onde (sinus)...
    --

    Xn    <= STD_LOGIC_VECTOR( TO_SIGNED(0, 8) );
    wait for 10 ns;

    REPORT "Simulation end...";
    wait;
  end process;

end;