#include "stdint.h"

void addi() {
    __asm__ ("li x3, 0x0");
    __asm__ ("addi x3, x3, 0x1");
    __asm__ ("addi x3, x3, 0x2");
    __asm__ ("addi x3, x3, 0x3");
    __asm__ ("li x4, 0x6");
    __asm__ ("bne x3, x4, exitfail");
    __asm__ ("j exit");
    __asm__ ("exitfail:");
    __asm__ ("lui x31, 0xdead");
    __asm__ ("exit:");
}

int main () {
    addi();

    // Exit Simulation
    __asm__ ("lui x31, 0xdead");
    return 0;
}
