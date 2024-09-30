-- Testbench created online at:
--   https://www.doulos.com/knowhow/perl/vhdl-testbench-creation-using-perl/
-- Copyright Doulos Ltd
library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity testbench is
end;

architecture bench of testbench is

  component xor_gate_split
  PORT (
    A : IN  std_logic;
    B : IN  std_logic;
    C : OUT std_logic
);
  end component;

  signal A : std_logic;
  signal B : std_logic;
  signal C : std_logic;

  function to_bstring(sl : std_logic) return string is
    variable sl_str_v : string(1 to 3);  -- std_logic image with quotes around
  begin
    sl_str_v := std_logic'image(sl);
    return "" & sl_str_v(2);  -- "" & character to get string
  end function;

begin

  uut: xor_gate_split port map ( A => A,
                                 B => B,
                                 C => C );

  stimulus: process
  begin
    REPORT "Simulation start...";
    A <= '0';
    B <= '0';
    wait for 10 ns;

    ASSERT C = '0' SEVERITY ERROR;
    REPORT to_bstring(A) & " XOR " & to_bstring(B) & " = " & to_bstring(C);

    A <= '1';
    B <= '0';
    wait for 10 ns;

    ASSERT C = '1' SEVERITY ERROR;
    REPORT to_bstring(A) & " XOR " & to_bstring(B) & " = " & to_bstring(C);

    A <= '0';
    B <= '1';
    wait for 10 ns;

    ASSERT C = '1' SEVERITY ERROR;
    REPORT to_bstring(A) & " XOR " & to_bstring(B) & " = " & to_bstring(C);

    A <= '1';
    B <= '1';
    wait for 10 ns;

    A <= '0';
    B <= '0';
    wait for 10 ns;

    ASSERT C = '0' SEVERITY ERROR;
    REPORT to_bstring(A) & " XOR " & to_bstring(B) & " = " & to_bstring(C);

    REPORT "Simulation end...";
    wait;
  end process;

end;
