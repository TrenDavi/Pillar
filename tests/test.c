#include "stdint.h"

void adi() {
    register uint32_t a = 5;
    register uint32_t b = 5;

    if (a + b != 10) {
        __asm__ ("lui x30, 0x1");
        __asm__ ("lui x31, 0xdead");
    }
}

int main () {
    adi();

    // Exit Simulation
    __asm__ ("lui x31, 0xdead");
    return 0;
}
