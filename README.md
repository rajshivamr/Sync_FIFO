# Synchronous_fifo
This project contains the Verilog implementation of an 8-bit Synchronous FIFO (First-In-First-Out) memory module. The design includes a testbench to simulate and verify the functionality of the FIFO.
It is a memory buffer that is used to store and retrieve data sequentially, write and read operating under a same clock domain.

It is commonly used in digital systems to buffer data between two subsystems that are both operating under the same clock but may have different data processing speeds.

Both the write and read operations are governed by the same clock signal.

Data is written into the FIFO in sequence, and read out in the same order it was written, ensuring predictable data flow timing.
