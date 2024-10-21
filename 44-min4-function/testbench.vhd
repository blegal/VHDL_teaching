-- Testbench created online at:
--   https://www.doulos.com/knowhow/perl/vhdl-testbench-creation-using-perl/
-- Copyright Doulos Ltd
library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity testbench is
end;

architecture bench of testbench is

  COMPONENT min4_v1 IS
    PORT (
        A : in  STD_LOGIC_VECTOR(7 DOWNTO 0);
        B : in  STD_LOGIC_VECTOR(7 DOWNTO 0);
        C : in  STD_LOGIC_VECTOR(7 DOWNTO 0);
        D : in  STD_LOGIC_VECTOR(7 DOWNTO 0);
        S : out STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
  END COMPONENT;

  COMPONENT min4_v2 IS
    PORT (
        A : in  STD_LOGIC_VECTOR(7 DOWNTO 0);
        B : in  STD_LOGIC_VECTOR(7 DOWNTO 0);
        C : in  STD_LOGIC_VECTOR(7 DOWNTO 0);
        D : in  STD_LOGIC_VECTOR(7 DOWNTO 0);
        S : out STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
  END COMPONENT;

  signal A    : std_logic_vector(7 downto 0);
  signal B    : std_logic_vector(7 downto 0);
  signal C    : std_logic_vector(7 downto 0);
  signal D    : std_logic_vector(7 downto 0);
  signal S1   : std_logic_vector(7 downto 0);
  signal S2   : std_logic_vector(7 downto 0);

begin

  uu1: min4_v1 port map ( A, B, C, D, S1 );
  uu2: min4_v2 port map ( A, B, C, D, S2 );
                                                
  stimulus: process
  begin
    REPORT "Simulation start...";
    A <= STD_LOGIC_VECTOR( TO_SIGNED(1, 8) );
    B <= STD_LOGIC_VECTOR( TO_SIGNED(2, 8) );
    C <= STD_LOGIC_VECTOR( TO_SIGNED(3, 8) );
    D <= STD_LOGIC_VECTOR( TO_SIGNED(4, 8) );
    wait for 10 ns;
    ASSERT( S1 = S2 );

    A <= STD_LOGIC_VECTOR( TO_SIGNED(4, 8) );
    B <= STD_LOGIC_VECTOR( TO_SIGNED(3, 8) );
    C <= STD_LOGIC_VECTOR( TO_SIGNED(2, 8) );
    D <= STD_LOGIC_VECTOR( TO_SIGNED(1, 8) );
    wait for 10 ns;
    ASSERT( S1 = S2 );

    A <= STD_LOGIC_VECTOR( TO_SIGNED(1, 8) );
    B <= STD_LOGIC_VECTOR( TO_SIGNED(2, 8) );
    C <= STD_LOGIC_VECTOR( TO_SIGNED(4, 8) );
    D <= STD_LOGIC_VECTOR( TO_SIGNED(3, 8) );
    wait for 10 ns;
    ASSERT( S1 = S2 );

    A <= STD_LOGIC_VECTOR( TO_SIGNED(1, 8) );
    B <= STD_LOGIC_VECTOR( TO_SIGNED(4, 8) );
    C <= STD_LOGIC_VECTOR( TO_SIGNED(3, 8) );
    D <= STD_LOGIC_VECTOR( TO_SIGNED(2, 8) );
    wait for 10 ns;
    ASSERT( S1 = S2 );

    REPORT "Simulation end...";
    wait;
  end process;

end;