A Serial In Serial Out (SISO) shift register is a sequential digital circuit that moves and outputs data one bit at a time in a serial fashion. It consists of multiple flip-flops connected in series, with all flip-flops sharing the same clock signal.
•	Working Principle:
•	Data enters the register via a single serial input line.
•	At every clock pulse, the input bit is stored in the first flip-flop; previous bits shift down the chain to the next flip-flop.
•	After N clock cycles (for an N-bit register), the first bit inputted appears at the serial output—the output of the last flip-flop.
•	This process provides a controlled time delay for each data bit as it propagates through the register.
•	Key Features:
•	In SISO registers, data comes in and leaves serially—one bit per clock cycle.
•	Data is moved right (or left depending on design) at each clock edge.
•	Typical applications include temporary data storage, time delay generation, and serial-to-serial data transfer.
•	Example (4-bit register, data input 1011):
•	After each clock pulse, the input bit shifts through the chain—initially all flip-flops are reset to zero.
•	With each clock edge, a new input bit is loaded, previous bits are shifted, and the oldest bit appears at the output.
•	Applications:
•	Delay elements in digital circuits.
•	Serial data transfer for communication systems.
•	Simple finite state machines and basic counters.

