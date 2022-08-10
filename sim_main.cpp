#include <iostream>
#include <verilated.h>
#include "Vtop.h"
#include "Vtop_ram.h"

vluint64_t main_time = 0;
double sc_time_stamp() {
    return main_time;
}

int main(int argc, char** argv, char** env) {
    Verilated::debug(0);
    Verilated::randReset(0);
    Verilated::traceEverOn(true);
    Verilated::commandArgs(argc, argv);
    Verilated::mkdir("logs");

    Vtop* top = new Vtop;

    top->clk = 0;
    while (!Verilated::gotFinish()) {
        ++main_time;
        top->clk = !top->clk;
        top->reset = (main_time < 10) ? 1 : 0;
        if (main_time < 5) {
            VerilatedCov::zero();
        }
        top->eval();

	if(main_time > 25) {
            break;
	}
    }
    top->final();

#if VM_COVERAGE
    Verilated::mkdir("logs");
    VerilatedCov::write("logs/coverage.dat");
#endif

    delete top;
    return 0;
}
