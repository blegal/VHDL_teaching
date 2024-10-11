-- Testbench created online at:
--   https://www.doulos.com/knowhow/perl/vhdl-testbench-creation-using-perl/
-- Copyright Doulos Ltd
library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity testbench is
end;

architecture bench of testbench is

  COMPONENT tzcnt IS
  PORT (
    A : IN  std_logic_vector(7 downto 0);
    B : IN  std_logic;
    C : OUT std_logic_vector(3 downto 0)
  );
  END COMPONENT;
    
  signal A : std_logic_vector(7 downto 0);
  signal B : std_logic;
  signal C : std_logic_vector(3 downto 0);

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

  uut: tzcnt port map ( A => A,
                        B => B,
                        C => C
                      );

  stimulus: process
  begin
    REPORT "Simulation start...";
    A <= "00000000";
    B <= '0';
    wait for 10 ns;

    A <= "00000001"; wait for 10 ns;
    A <= "00000011"; wait for 10 ns;
    A <= "00000111"; wait for 10 ns;
    A <= "00001111"; wait for 10 ns;
    A <= "00011111"; wait for 10 ns;
    A <= "00111111"; wait for 10 ns;
    A <= "01111111"; wait for 10 ns;
    A <= "11111111"; wait for 10 ns;

    B <= '1'; wait for 10 ns;

    A <= "01111111"; wait for 10 ns;
    A <= "00111111"; wait for 10 ns;
    A <= "00011111"; wait for 10 ns;
    A <= "00001111"; wait for 10 ns;
    A <= "00000111"; wait for 10 ns;
    A <= "00000011"; wait for 10 ns;
    A <= "00000001"; wait for 10 ns;

    REPORT "Simulation end...";
    wait;
  end process;

end;