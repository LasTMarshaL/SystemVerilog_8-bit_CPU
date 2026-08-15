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
- [x] ALU (Mathematical & Logical commands/calculations.
- [x] Regsiter File (Registers read/write control).
- [X] Flag Register (Carry, Zero, Sign, Overflow)
- [X] Data Memory (Read/write constants & variables).
- [X] Instruction Memory (Read/write instructions).
- [ ] Program Counter (Instruction address tracking & flow control).
- [ ] Control Unit (Instructions decoding & distribution).
- [ ] CPU top (Unite all parts & data transfer).
* These are current tasks (goals), the next stage will be creating Python script for translating commands into machine code and loading instructions ("mini-assembler" for test). After that, connecting RISC-V standard compilator to translate C commands into machine code and launch sterling PL <-> CPU interaction.
  
## 🧪 Used Technologies & Software
* Vivado (Development environment)
* SystemVerilog (Hardware description
* Vivado Simulator (Digital Simulation)

## 🖼️ Screenshots
<img width="974" height="256" alt="image" src="https://github.com/user-attachments/assets/b6eae695-3033-4864-8eb4-f9cb69dccd0e" />
<img width="974" height="218" alt="image" src="https://github.com/user-attachments/assets/4cd68831-c46b-489d-8c06-f70be4eb9430" />
