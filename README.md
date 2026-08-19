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
- [X] Flag Register (Carry, Zero, Sign, Overflow).
- [X] Data Memory (Read/write constants & variables).
- [X] Instruction Memory (Read/write instructions).
- [X] Program Counter (Instruction address tracking & flow control).
- [X] Control Unit (Instructions decoding & distribution).
- [ ] CPU top (Unite all parts & data transfer).
* These are current tasks (goals), the next stage will be creating Python script for translating commands into machine code and loading instructions ("mini-assembler" for test). After that, connecting RISC-V standard compilator to translate C commands into machine code and launch sterling PL <-> CPU interaction.
  
## 🧪 Used Technologies & Software
* Vivado (Development environment)
* SystemVerilog (Hardware description
* Vivado Simulator (Digital Simulation)

## 🖼️ Screenshots
**ALU**
<img width="974" height="265" alt="image" src="https://github.com/user-attachments/assets/2ef06271-8a6b-4d85-9972-dd7d802fbae3" />
**Register File**
<img width="974" height="226" alt="image" src="https://github.com/user-attachments/assets/5f520bd1-b0b1-46c1-a06b-4bb2cced574c" />
**Flag Register**
<img width="974" height="168" alt="image" src="https://github.com/user-attachments/assets/832493dd-a8ff-4225-a665-012ca032dfad" />
**Data Memory**
<img width="974" height="193" alt="image" src="https://github.com/user-attachments/assets/db86e434-d22d-4fa7-90cc-ff2c8a38894c" />
**Instruction Memoty**
<img width="974" height="298" alt="image" src="https://github.com/user-attachments/assets/8193cea3-8313-4478-a3f0-b75fae4f0dd7" />
**Program Counter**
![Uploading image.png…]()
**Control Unit**
![Uploading image.png…]()




