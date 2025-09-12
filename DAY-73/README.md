Theory Explanation of the APB Slave Module
1. What is the APB Protocol?
The Advanced Peripheral Bus (APB) is a simple, low-power bus protocol primarily used for connecting peripherals in SoCs. It is a part of the ARM AMBA protocols hierarchy and is designed for low complexity and low power with a non-pipelined interface.
2. APB Slave Interface Signals Overview
•	pclk: APB clock signal.
•	presetn: Active-low asynchronous reset.
•	psel: APB select signal; asserted when a transfer is intended for the slave.
•	penable: Enable signal; distinguishes between setup phase and access phase.
•	pwrite: Write/read indicator; 1 = write, 0 = read.
•	paddr: Address bus for selecting registers/memory inside the slave.
•	pwdata: Write data bus containing data to be written.
•	prdata: Read data bus driven by the slave during read transfers.
•	pready: Indicates slave is ready to complete the transfer.
•	pslverr: Protocol error indicator from the slave (optional).
3. APB Transfer Phases
The APB transfer occurs in two phases:
•	Setup Phase: psel = 1, penable = 0.
•	Access Phase: psel = 1, penable = 1.
Data is transferred (read or write) during the access phase.
4. Module Internal Structure Overview
a) Register File
•	Contains 4 registers (reg_file[0..3]) each DATA_WIDTH bits.
•	Address bits [3:2] are used to decode which register is accessed.
b) Pready Signal Generation
•	pready is asserted during the access phase (penable high), indicating the slave is ready to complete the transfer.
•	This model assumes zero wait states for simplicity, so pready mirrors penable.
c) Write Operation
•	Occurs on the rising edge of pclk during the access phase (when psel && penable && pwrite && pready is true).
•	Data from pwdata is written into the selected register, based on paddr[3:2].
d) Read Operation
•	Also synchronized with pclk.
•	During the read phase (psel && penable && !pwrite), the slave drives the addressed register data onto prdata.
•	If no read is occurring, prdata outputs zero.
e) Reset (presetn)
•	Asynchronous active-low reset.
•	Upon reset, all registers and outputs are initialized to zero.
f) Error Signal (pslverr)
•	This code does not implement errors, so pslverr is always zero.

