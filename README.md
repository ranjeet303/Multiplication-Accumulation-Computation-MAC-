# Multiplication-Accumulation-Computation-MAC-
📌 Overview

This project implements a Multiply and Accumulate (MAC) Unit in Verilog HDL.
The MAC unit performs iterative multiplication and accumulation, which is a core operation in DSP (Digital Signal Processing), neural networks, and arithmetic-intensive applications.

The design follows a modular RTL approach, separating the datapath and controller, making the system easy to understand, verify, and extend.

⚡ Features

✅ Datapath + Controller architecture

✅ 4-bit × 4-bit multiplication with accumulation

✅ Finite State Machine (FSM) based controller

✅ Clock divider for timing control

✅ Synchronous reset and control signals

✅ Simulation-friendly with done flag and $display output

🏗️ Architecture

Datapath: Handles registers (A, B, M, Accumulator, Output) and arithmetic operations.

Controller: FSM that generates control signals (ld_a, ld_b, ld_m, ld_acc, ld_out) and monitors CMP.

Clock Divider: Provides slower clock for datapath operations.

Top Module (top_mac): Integrates datapath, controller, and clock divider.

📂 Project Structure
📂 src/         -> RTL source files (top_mac, datapath, controller, clockdivider)
📂 tb/          -> Testbench files
📂 sim/         -> Simulation outputs (waveforms, logs)
📂 docs/        -> Block diagrams, FSM diagrams, notes

🧪 Simulation & Verification

Run simulation with ModelSim / Vivado / Icarus Verilog + GTKWave

done signal indicates the end of accumulation

$display statement shows final accumulated result

Example output during simulation:

Accumulation Complete. Final Output: <value>

🚀 Applications

Digital Signal Processing (DSP)

FIR / IIR Filters

Neural Network MAC operations

Arithmetic-intensive embedded systems
