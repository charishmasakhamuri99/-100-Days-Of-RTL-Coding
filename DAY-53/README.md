🧠 Core Concepts of Dual-Port RAM
1.	What is Dual-Port RAM?
A memory with two independent access ports, typically allowing one port to write and the other to read simultaneously. True dual-port memory even permits both ports to write or read at distinct addresses at the same time 
2.	Synchronous vs. Asynchronous Access
o	Synchronous RAM uses a clock for all operations—read and write happen on clock edges, enabling higher speeds through pipelining and predictable timing.
o	Asynchronous RAM updates outputs immediately based on address changes, regardless of the clock—simpler but slower and less scalable .
3.	Port Structure in Your Verilog Code
o	Port 0 is a write/read port: on each rising clock edge, if we0 (write-enable) is high, it writes din0 into ram[addr0].
o	Port 1 is read-only: it continuously outputs ram[addr1] based on the current address.
o	Both outputs (dout0, dout1) are asynchronous, reflecting memory contents immediately when the address changes.
4.	Simultaneous Access
Your design supports concurrent operations, e.g., writing to one address on port 0 while reading from another via port 1. As long as they target different addresses, there’s no conflit.

5.	If both ports access the same address in the same cycle, behavior depends on timing and the memory architecture—common outcomes include returning the new value, old value, or unstable data.
✅ Detailed Breakdown
Feature	Explanation
Write Operation (Port 0)	Happens at clock edge if we0=1: memory updates synchronously.
Read Operations (Ports 0 & 1)	Asynchronous—no clock needed; output instantly reflects ram[addr].
Concurrency	Supports read+write or read+read on different ports simultaneously. Writes/read at different addresses are safe.
