# RISC-V-_-5-Stage_pipelined_structure
Overview

This project implements a simplified 5-stage pipelined RISC-V CPU core using Verilog HDL.
The processor follows the classic RISC pipeline architecture consisting of Instruction Fetch (IF), Instruction Decode (ID), Execute (EX), Memory (MEM), and Write-Back (WB) stages.

The design demonstrates fundamental CPU architecture concepts such as pipeline registers, instruction execution flow, and register file operations. The processor is verified through simulation using Icarus Verilog on EDA Playground.

---

Objectives

- Design a basic RISC-V CPU core using Verilog HDL
- Implement a 5-stage pipeline architecture
- Simulate instruction execution through pipeline stages
- Verify CPU functionality using a testbench and waveform analysis

---

CPU Architecture

The processor follows the standard 5-stage RISC pipeline:

Stage| Description
IF| Instruction Fetch – retrieves instruction from instruction memory
ID| Instruction Decode – decodes instruction and reads register operands
EX| Execute – performs ALU operations
MEM| Memory Access – passes data through memory stage
WB| Write Back – writes result back to register file

Pipeline registers used:

IF/ID → ID/EX → EX/MEM → MEM/WB

---

Implemented Modules

1. ALU

Performs arithmetic and logical operations.

Supported operations:

- ADD
- SUB
- AND
- OR

---

2. Register File

- 32 general-purpose registers
- Two read ports
- One write port
- Synchronous write operation

---

3. Pipelined CPU Core

The CPU core integrates the pipeline stages and connects:

- instruction memory
- register file
- ALU
- pipeline registers

---

Instruction Flow Example

Example instruction sequence executed in simulation:

ADDI x1, x0, 1
ADDI x2, x0, 2
ADD x3, x1, x2

Expected result:

x1 = 1
x2 = 2
x3 = 3

---

Simulation

Simulation is performed using EDA Playground with Icarus Verilog.

Steps to Run

1. Open the project in EDA Playground
2. Place RTL modules on the Design panel
3. Place the testbench on the Testbench panel
4. Enable Open EPWave after run
5. Run simulation and observe waveform results

---

Waveform Output

The waveform shows the pipeline flow across clock cycles including:

- Program Counter (PC)
- Instruction registers
- ALU results
- Pipeline stage outputs

Example waveform:

"Pipeline Waveform" (images/riscv_pipeline_waveform.png)

---

Project Structure

riscv-pipelined-cpu
│
├── rtl
│ ├── alu.v
│ ├── regfile.v
│ └── riscv_pipeline.v
│
├── testbench
│ └── tb_riscv_pipeline.v
│
├── images
│ └── riscv_pipeline_waveform.png
│
└── README.md

---

Tools Used

- Verilog HDL
- Icarus Verilog
- EDA Playground
- EPWave waveform viewer

---

Future Improvements

Possible extensions for a more advanced CPU design:

- Hazard detection unit
- Data forwarding unit
- Branch control logic
- Data memory implementation
- Support for additional RISC-V instructions
