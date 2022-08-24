# Pillar
RISC-V Architecture Emulator in Verilog That Runs a Custom Kernel

## Prerequisites
Pillar requires:

- iverilog
- elftohex (optional)
- gtkwave (optional)

### Icarus Verilog
Icarus Verilog can be installed by:
````
sudo apt update
sudo apt install iverilog
````

### Elftohex
elfttohex requires it be built from its repository on gitub [here](https://github.com/sifive/elf2hex)

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
<p align="center">
  <img src="https://user-images.githubusercontent.com/80648742/186539876-11ab6e84-f9ab-47ff-bb94-807eef5742e1.png"/>
</p>

````
gtkwave wave.vcd
````
