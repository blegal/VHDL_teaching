-- Testbench created online at:
--   https://www.doulos.com/knowhow/perl/vhdl-testbench-creation-using-perl/
-- Copyright Doulos Ltd
library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity testbench is
end;

architecture bench of testbench is

  component xor_v1
  PORT (
    A : IN  std_logic_vector(3 downto 0);
    B : IN  std_logic_vector(3 downto 0);
    C : OUT std_logic_vector(3 downto 0)
);
  end component;

  signal A : std_logic_vector(3 downto 0);
  signal B : std_logic_vector(3 downto 0);
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

  uut: xor_v1 port map ( A => A,
                         B => B,
                         C => C );

  stimulus: process
  begin
    REPORT "Simulation start...";
    A <= "0000";
    B <= "0000";
    wait for 10 ns;

    -- Output value validation & reporting
    ASSERT C = "0000" SEVERITY ERROR;
    REPORT to_bstring(A) & " XOR " & to_bstring(B) & " = " & to_bstring(C);

    A <= "1010";
    B <= "0101";
    wait for 10 ns;

    -- Output value validation & reporting
    ASSERT C = "1111" SEVERITY ERROR;
    REPORT to_bstring(A) & " XOR " & to_bstring(B) & " = " & to_bstring(C);

    A <= "0101";
    B <= "1010";
    wait for 10 ns;

    -- Output value validation & reporting
    ASSERT C = "1111" SEVERITY ERROR;
    REPORT to_bstring(A) & " XOR " & to_bstring(B) & " = " & to_bstring(C);

    A <= "1101";
    B <= "1110";
    wait for 10 ns;

    -- Output value validation & reporting
    ASSERT C = "0011" SEVERITY ERROR;
    REPORT to_bstring(A) & " XOR " & to_bstring(B) & " = " & to_bstring(C);

    A <= "0011";
    B <= "0101";
    wait for 10 ns;

    -- Output value validation & reporting
    ASSERT C = "0110" SEVERITY ERROR;
    REPORT to_bstring(A) & " XOR " & to_bstring(B) & " = " & to_bstring(C);
    
    REPORT "Simulation end...";
    wait;
  end process;

end;