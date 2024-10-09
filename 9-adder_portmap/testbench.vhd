-- Testbench created online at:
--   https://www.doulos.com/knowhow/perl/vhdl-testbench-creation-using-perl/
-- Copyright Doulos Ltd
library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity testbench is
end;

architecture bench of testbench is

  COMPONENT adder_4b IS
  PORT (
    A : IN  std_logic_vector(3 downto 0);
    B : IN  std_logic_vector(3 downto 0);
    S : OUT std_logic_vector(4 downto 0)
    );
  END COMPONENT;
  
  signal A : std_logic_vector(3 downto 0);
  signal B : std_logic_vector(3 downto 0);
  signal S : std_logic_vector(4 downto 0);

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

  uut: adder_4b port map (  A => A,
                            B => B,
                            S => S );

  stimulus: process
  begin
    REPORT "Simulation start...";
    A <= "0000";
    B <= "0001";
    wait for 10 ns;

    -- Output value validation & reporting
    ASSERT S = "00001" SEVERITY ERROR;
    REPORT "" & to_bstring(A) & " + " & to_bstring(B) & " = " & to_bstring(S);

    A <= "0001";
    B <= "0001";
    wait for 10 ns;

    -- Output value validation & reporting
    ASSERT S = "00010" SEVERITY ERROR;
    REPORT "" & to_bstring(A) & " + " & to_bstring(B) & " = " & to_bstring(S);

    A <= "1001";
    B <= "1001";
    wait for 10 ns;

    -- Output value validation & reporting
    ASSERT S = "10010" SEVERITY ERROR;
    REPORT "" & to_bstring(A) & " + " & to_bstring(B) & " = " & to_bstring(S);

    A <= "1001";
    B <= "0011";
    wait for 10 ns;

    -- Output value validation & reporting
    ASSERT S = "01100" SEVERITY ERROR;
    REPORT "" & to_bstring(A) & " + " & to_bstring(B) & " = " & to_bstring(S);

    REPORT "Simulation end...";
    wait;
  end process;

end;