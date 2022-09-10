# 4-bit CPU
A 4-bit CPU core using only wires and logic gates. Implemented using verilog.
## Storage
## Instructions
## Schematic
Schematic generated using Intel Quartus Prime.
![alt text](schematic.png "schematic")
## Getting started
This is an example of running an assembly file on the CPU.
This example uses Icarus Verilog and GTKWave on Linux.
1. Locate assembly file, i.e. ins_mem/programs/general.tass
3. Build instruction memory module
```
cd ins_mem/
./assembler programs/general.tass
cd ../
```
4. Build datapath module
```
cd datapath/
./build.sh
vvp testbench
cd ../
```
5. View waveform
```
gtkwave datapath/test.vcd
```
