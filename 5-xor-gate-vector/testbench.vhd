-- Testbench created online at:
--   https://www.doulos.com/knowhow/perl/vhdl-testbench-creation-using-perl/
-- Copyright Doulos Ltd
library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity testbench is
end;

architecture bench of testbench is

  component xor_gate_vector
  PORT (
    A : IN  std_logic_vector(3 downto 0);
    B : IN  std_logic_vector(3 downto 0);
    C : OUT std_logic_vector(3 downto 0)
);
  end component;

  signal A : std_logic_vector(3 downto 0);
  signal B : std_logic_vector(3 downto 0);
  signal C : std_logic_vector(3 downto 0);

begin

  uut: xor_gate_vector port map ( A => A,
                         B => B,
                         C => C );

  stimulus: process
  begin
    REPORT "Simulation start...";
    A <= "0000";
    B <= "0000";
    wait for 10 ns;

    A <= "1010";
    B <= "0101";
    wait for 10 ns;

    A <= "0101";
    B <= "1010";
    wait for 10 ns;

    A <= "1101";
    B <= "1110";
    wait for 10 ns;

    A <= "0011";
    B <= "0101";
    REPORT "Simulation end...";
    wait;
  end process;

end;