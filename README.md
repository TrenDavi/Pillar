# Pillar
A Custom RISC-V Architecture Emulator in Verilog That Runs a Custom Kernel

## Prerequisites
Pillar requires:

- iverilog
- riscv32-unknown-elf-gcc
- elftohex 
- gtkwave (optional)

### Icarus Verilog
Icarus Verilog can be installed by:
````
sudo apt update
sudo apt install iverilog
````
### Risc-V Toolchain
The Risc-V toolchain can be built from [here](https://github.com/riscv-collab/riscv-gnu-toolchain.git)

**Make sure to configure it to 32bit Risc-V**

### Elftohex
elfttohex can be built from [here](https://github.com/sifive/elf2hex)

### GTKWave
gtkwave can be installed by:
````
sudo apt update
sudo apt install gtkwave
````

## Compilation
Clone and Build
````
git clone https://github.com/TrenDavi/Pillar.git
cd Pillar
make simulate
````

## Debug in GTKWave
````
gtkwave wave.vcd
````
