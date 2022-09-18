SRC = control.v     \
      counter.v     \
      fetch.v       \
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

COUTPUT = tools/Pillar

$(COUTPUT): $(TESTBENCH) $(SRC)
	$(COMPILER) $(COFLAGS) $(COUTPUT) $(TESTBENCH) $(SRC)

clean:
	rm -r -f tools/*.vcd *.out tests/*.o tests/*.hex tools/Pillar
