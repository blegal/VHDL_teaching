-- Testbench created online at:
--   https://www.doulos.com/knowhow/perl/vhdl-testbench-creation-using-perl/
-- Copyright Doulos Ltd
library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity testbench is
end;

architecture bench of testbench is

  COMPONENT mux_4_when_else IS
  PORT (
    A : IN  std_logic_vector(3 downto 0);
    B : IN  std_logic_vector(3 downto 0);
    C : IN  std_logic_vector(3 downto 0);
    D : IN  std_logic_vector(3 downto 0);
    E : IN  std_logic_vector(1 downto 0);
    S : OUT std_logic_vector(3 downto 0)
    );
  END COMPONENT;
  
  signal A : std_logic_vector(3 downto 0);
  signal B : std_logic_vector(3 downto 0);
  signal C : std_logic_vector(3 downto 0);
  signal D : std_logic_vector(3 downto 0);
  signal E : std_logic_vector(1 downto 0);
  signal S : std_logic_vector(3 downto 0);

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

  uut: mux_4_when_else port map ( A => A,
                                  B => B,
                                  C => C,
                                  D => D,
                                  E => E,
                                  S => S );

  stimulus: process
  begin
    REPORT "Simulation start...";
    A <= "0000";
    B <= "0001";
    C <= "0010";
    D <= "0011";
    E <= "00";
    wait for 10 ns;

    -- Output value validation & reporting
    ASSERT S = "0000" SEVERITY ERROR;
    REPORT "SELECT(" & to_bstring(A) & ", " & to_bstring(B) & "," & to_bstring(C) & ", " & to_bstring(D) & "," & to_bstring(E) & ") = " & to_bstring(S);

    E <= "01";
    wait for 10 ns;

    -- Output value validation & reporting
    ASSERT S = "0001" SEVERITY ERROR;
    REPORT "SELECT(" & to_bstring(A) & ", " & to_bstring(B) & "," & to_bstring(C) & ", " & to_bstring(D) & "," & to_bstring(E) & ") = " & to_bstring(S);

    E <= "10";
    wait for 10 ns;

    -- Output value validation & reporting
    ASSERT S = "0010" SEVERITY ERROR;
    REPORT "SELECT(" & to_bstring(A) & ", " & to_bstring(B) & "," & to_bstring(C) & ", " & to_bstring(D) & "," & to_bstring(E) & ") = " & to_bstring(S);

    E <= "11";
    wait for 10 ns;

    -- Output value validation & reporting
    ASSERT S = "0011" SEVERITY ERROR;
    REPORT "SELECT(" & to_bstring(A) & ", " & to_bstring(B) & "," & to_bstring(C) & ", " & to_bstring(D) & "," & to_bstring(E) & ") = " & to_bstring(S);

    A <= "1000";
    B <= "0100";
    C <= "0010";
    D <= "0001";
    E <= "00";
    wait for 10 ns;

    -- Output value validation & reporting
    ASSERT S = "1000" SEVERITY ERROR;
    REPORT "SELECT(" & to_bstring(A) & ", " & to_bstring(B) & "," & to_bstring(C) & ", " & to_bstring(D) & "," & to_bstring(E) & ") = " & to_bstring(S);

    E <= "01";
    wait for 10 ns;

    -- Output value validation & reporting
    ASSERT S = "0100" SEVERITY ERROR;
    REPORT "SELECT(" & to_bstring(A) & ", " & to_bstring(B) & "," & to_bstring(C) & ", " & to_bstring(D) & "," & to_bstring(E) & ") = " & to_bstring(S);

    E <= "10";
    wait for 10 ns;

    -- Output value validation & reporting
    ASSERT S = "0010" SEVERITY ERROR;
    REPORT "SELECT(" & to_bstring(A) & ", " & to_bstring(B) & "," & to_bstring(C) & ", " & to_bstring(D) & "," & to_bstring(E) & ") = " & to_bstring(S);

    E <= "11";
    wait for 10 ns;

    -- Output value validation & reporting
    ASSERT S = "0001" SEVERITY ERROR;
    REPORT "SELECT(" & to_bstring(A) & ", " & to_bstring(B) & "," & to_bstring(C) & ", " & to_bstring(D) & "," & to_bstring(E) & ") = " & to_bstring(S);    

    REPORT "Simulation end...";
    wait;
  end process;

end;