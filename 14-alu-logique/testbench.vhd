-- Testbench created online at:
--   https://www.doulos.com/knowhow/perl/vhdl-testbench-creation-using-perl/
-- Copyright Doulos Ltd
library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity testbench is
end;

architecture bench of testbench is

  COMPONENT logic_alu IS
  PORT (
    A : IN  std_logic;
    B : IN  std_logic;
    C : IN  std_logic_vector(2 downto 0);
    D : OUT std_logic
  );
  END COMPONENT;
  
  signal A : std_logic;
  signal B : std_logic;
  signal C : std_logic_vector(2 downto 0);
  signal D : std_logic;

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

  uut: logic_alu   port map ( A => A,
                              B => B,
                              C => C,
                              D => D
                            );

  stimulus: process
  begin
    REPORT "Simulation start...";
    A <= '0';
    B <= '0';
    C <= "000";
    wait for 10 ns;

    -- Output value validation & reporting
    ASSERT D = '1' SEVERITY ERROR;
    REPORT "SELECT(" & to_bstring(A) & ", " & to_bstring(B) & "," & to_bstring(C) & ") = " & to_bstring(D);

    C <= "001";
    wait for 10 ns;

    -- Output value validation & reporting
    ASSERT D = '1' SEVERITY ERROR;
    REPORT "SELECT(" & to_bstring(A) & ", " & to_bstring(B) & "," & to_bstring(C) & ") = " & to_bstring(D);

    C <= "010";
    wait for 10 ns;

    -- Output value validation & reporting
    ASSERT D = '0' SEVERITY ERROR;
    REPORT "SELECT(" & to_bstring(A) & ", " & to_bstring(B) & "," & to_bstring(C) & ") = " & to_bstring(D);

    C <= "011";
    wait for 10 ns;

    -- Output value validation & reporting
    ASSERT D = '0' SEVERITY ERROR;
    REPORT "SELECT(" & to_bstring(A) & ", " & to_bstring(B) & "," & to_bstring(C) & ") = " & to_bstring(D);

    C <= "100";
    wait for 10 ns;

    -- Output value validation & reporting
    ASSERT D = '1' SEVERITY ERROR;
    REPORT "SELECT(" & to_bstring(A) & ", " & to_bstring(B) & "," & to_bstring(C) & ") = " & to_bstring(D);

    C <= "101";
    wait for 10 ns;

    -- Output value validation & reporting
    ASSERT D = '1' SEVERITY ERROR;
    REPORT "SELECT(" & to_bstring(A) & ", " & to_bstring(B) & "," & to_bstring(C) & ") = " & to_bstring(D);

    C <= "110";
    wait for 10 ns;

    -- Output value validation & reporting
    ASSERT D = '0' SEVERITY ERROR;
    REPORT "SELECT(" & to_bstring(A) & ", " & to_bstring(B) & "," & to_bstring(C) & ") = " & to_bstring(D);

    -- and so on...

    REPORT "Simulation end...";
    wait;
  end process;

end;