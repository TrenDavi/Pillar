SRC = control.v     \
      counter.v     \
      fetch.v       \
      ram.v         \
      riscv_cpu.v   \
      clock.v       \
      decode.v 

TESTBENCH = top.v
TBOUTPUT = waves.lxt

COMPILER = iverilog
SIMULATOR = vvp
VIEWER = gtkwave

COFLAGS = -o
SFLAGS =
SOUTPUT =

COUTPUT = compiler.out

check : $(TESTBENCH) $(SRC)
	$(COMPILER) $(SRC)

simulate: $(COUTPUT)
	$(SIMULATOR) $(SFLAGS) $(COUTPUT) $(SOUTPUT)

$(TBOUTPUT): $(COUTPUT)
	$(SIMULATOR) $(SOPTIONS) $(COUTPUT) $(SOUTPUT)

$(COUTPUT): $(TESTBENCH) $(SRC)
	$(COMPILER) $(COFLAGS) $(COUTPUT) $(TESTBENCH) $(SRC)

clean:
	rm -r -f *.vcd *.out
