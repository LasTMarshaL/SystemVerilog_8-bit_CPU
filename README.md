# SystemVerilog_8-bit_CPU
8-bit CPU developed with SystemVerilog Hardware Description Language in AMD Vivado development environment. Project is at the developing stage.

## 📌About
This repository contains a 8-bit CPU to implement some elementary commands and explore CPU architecture (**!Development stage!**). It demonstrates hardware description (architecture), understanding how CPU works and opportunity to construct complex hardware system. This project is planed to be devoleped for real usage and connection with proggraming languages to make requests directly to ths CPU.

## 🗂️ Repository Structure
* **`SystemVerilog_8-bit_CPU/`** - Hardware description (architecture) and TB files for simulations amd tests.
* **`CPU_Simulation_Pictures&Logs.docx`** - File with simulation graphs and simulation loggs (created in TB files).
* **`Processor_Commands.docx`** - File with comamnds' codes.
  
## ⚙️ Short Hardware Overview
* **Selected FPGA:** Artix-7.
  
## 💻 Short Software Overview
* **Architecture:** Hardware description is constructed by SystemVerilog Hardware Description Language in Vivado development environment.
* **Simulation:** Simulation is implemented by Vivado Simulator.

## ⚠️ Safety Notice
* ⚠️!The author bears no responsibility for the reader's actions!⚠️

## 🚀 Roadmap
* **CPU architecture (SystemVerilog)**
- [x] ALU (Mathematical & Logical commands/calculations).
- [x] Regsiter File (Registers read/write control).
- [X] Flag Register (Carry, Zero, Sign, Overflow).
- [X] Data Memory (Read/write constants & variables).
- [X] Instruction Memory (Read/write instructions).
- [X] Program Counter (Instruction address tracking & flow control).
- [X] Control Unit (Instructions decoding & distribution).
- [X] CPU top (Unite all parts & data transfer).
* The next project stage is located in the "RISC-V-Standard-Modernization" branch.
  
## 🧪 Used Technologies & Software
* Vivado (Development environment)
* SystemVerilog (Hardware description
* Vivado Simulator (Digital Simulation)
