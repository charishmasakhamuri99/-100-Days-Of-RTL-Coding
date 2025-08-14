How it works:
1.	A counter (cnt) toggles clk_out every DIV/2 cycles for a 50% duty cycle.
2.	Each rising edge of clk_out increments pulses.
3.	When pulses hits LIMIT, the done signal asserts and division stops.
This approach is based on standard divider practices like “toggle on half count” 
Testbench summary:
•	Applies reset at start.
•	Uses a 100 MHz input clock.
•	Monitors clk_out and done signal.
•	Simulation ends after 500 ns, enough time to observe the 5 output pulses.
🔍 Explanation & References
•	Using a counter + toggle is a well-known technique for generating a 50% duty-cycle divided clock.
•	The done flag adds a useful output limit, handy for generating a fixed number of pulses (e.g., finite-state control, timed operations).
