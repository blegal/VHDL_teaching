-- Testbench created online at:
--   https://www.doulos.com/knowhow/perl/vhdl-testbench-creation-using-perl/
-- Copyright Doulos Ltd
library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity testbench is
end;

architecture bench of testbench is

  component xor_portmap
  PORT (
    A : IN  std_logic;
    B : IN  std_logic;
    C : OUT std_logic
);
  end component;

  signal A : std_logic;
  signal B : std_logic;
  signal C : std_logic;

begin

  uut: xor_portmap port map ( A => A,
                              B => B,
                              C => C );

  stimulus: process
  begin
    REPORT "Simulation start...";
    A <= '0';
    B <= '0';
    wait for 10 ns;

    A <= '1';
    B <= '0';
    wait for 10 ns;

    A <= '0';
    B <= '1';
    wait for 10 ns;

    A <= '1';
    B <= '1';
    wait for 10 ns;

    A <= '0';
    B <= '0';
    REPORT "Simulation end...";
    wait;
  end process;

end;