Single-Stage Pipeline Register

This repository contains a SystemVerilog implementation of a single-stage pipeline register using a valid/ready handshake.

The module accepts data when in_valid and in_ready are asserted, stores the data internally, and presents it on the output using out_valid. The design handles backpressure correctly without data loss or duplication and resets to a clean empty state.

Files:
- pipeline_reg.sv : RTL implementation
- tb_pipeline_reg.sv : Testbench used for simulation
