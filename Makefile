SRC = control.v     \
      counter.v     \
      fetch.v       \
      ram.v         \
      cpu.v         \
      clock.v       \
      decode.v      \
      alu.v         \
      opcode.v      \
      itype.v       \
      memory.v      \
      write.v       

TESTBENCH = top.v
TBOUTPUT = waves.lxt

COMPILER = iverilog
SIMULATOR = vvp
VIEWER = gtkwave

COFLAGS = -o
SFLAGS =
SOUTPUT =

COUTPUT = compiler.out

simulate: $(COUTPUT)
	$(SIMULATOR) $(COUTPUT) 

$(TBOUTPUT): $(COUTPUT)
	$(SIMULATOR) $(SOPTIONS) $(COUTPUT) $(SOUTPUT)

$(COUTPUT): $(TESTBENCH) $(SRC)
	$(COMPILER) $(COFLAGS) $(COUTPUT) $(TESTBENCH) $(SRC) -DFILE=\"tests\/test.hex\"

clean:
	rm -r -f *.vcd *.out
