TARGET = testbench

%GHDL_SIM_FLAGS= --stop-time=200ns
%GHDL_SIM_FLAGS=

VHDL_SRC      = tzcnt.vhd
TESTBENCH_SRC = $(TARGET).vhd
WAVEFORMS     = $(TARGET).ghw
GTKWAVE_CFG   = $(TARGET).gtkw

all: trace

.PHONY: analysis clean waves

default: notrace

analysis: $(VHDL_SRC) $(TESTBENCH_SRC)
	ghdl -a  --std=08 -fsynopsys -Wno-hide -Wno-shared -frelaxed $^

$(TARGET): analysis
	ghdl -e --std=08 -frelaxed $@

notrace: $(TARGET)
	ghdl -r --std=08 -frelaxed $^ $(GHDL_SIM_FLAGS) --ieee-asserts=disable --max-stack-alloc=0 --stop-time=200ns

trace: $(TARGET)
	ghdl -r --std=08 -frelaxed $^ $(GHDL_SIM_FLAGS) --ieee-asserts=disable --max-stack-alloc=0 --stop-time=200ns --vcd=$@.vcd

keynote:
	highlight -O rtf $(VHDL_SRC) --style=github | pbcopy

clean:
	rm -rf $(TARGET) $(WAVEFORMS) work-obj08.cf trace.vcd

