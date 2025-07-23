# Synchronous_fifo
This project contains the Verilog implementation of an 8-bit Synchronous FIFO (First-In-First-Out) memory module. The design includes a testbench to simulate and verify the functionality of the FIFO.

It is a memory buffer that is used to store and retrieve data sequentially, write and read operating under a same clock domain.

It is commonly used in digital systems to buffer data between two subsystems that are both operating under the same clock but may have different data processing speeds.

Both the write and read operations are governed by the same clock signal.

Data is written into the FIFO in sequence, and read out in the same order it was written, ensuring predictable data flow timing.


# FIFO Operation:

# Write Operation:
Data is written to the location pointed to by the write pointer, and the write pointer is incremented.

# Read Operation: 
Data is read from the location pointed to by the read pointer, and the read pointer is incremented.

If the write pointer catches up with the read pointer (or vice versa), the FIFO either becomes full or empty, depending on the direction.

# Components:

FIFO Memory Array: The storage area where the data is stored.

Full/Empty Flags:

Full Flag: Indicates the FIFO is full and no more data can be written until some is read out.

Empty Flag: Indicates the FIFO is empty, so no data can be read until new data is written.

Write Pointer: Keeps track of the location where the next data will be written.

Read Pointer: Keeps track of where the next data will be read from
