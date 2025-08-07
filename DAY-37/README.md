🎯 1. Vector Width Coercion: Automatic Padding
When you assign a smaller vector (vec_b, 5 bits) to a larger vector (vec_a, 7 bits), Verilog handles it automatically:
•	It zero-extends vec_b to match the width of vec_a.
•	That means the two most significant bits (MSBs) of vec_a become 0, while the lower bits copy from vec_b 
⏬ 2. Bit Slicing: Accessing Individual Bits
Your $monitor prints vec_a[2], which is the third bit from the right. This demonstrates part-select:
🔁 3. Continuous Behavior: Always @(*) Block
Though your example uses initial blocks for simplicity, a typical combinational design uses:
This ensures vec_a updates immediately whenever vec_b changes, modeling real-time combinational logic 
📝 4. System Task $monitor
•	$monitor is used to continuously track signals and automatically print whenever their values change (after all updates settle) 
•	It's called once to set up the tracking, and then the simulator handles subsequent prints for you.

🔍 Summary: What Happens in Your Code
1.	vec_b updates (e.g., to 5'b10110).
2.	vec_a auto-fills with zero-extended bits (7'b0010110).
3.	Simulator detects change, and $monitor outputs time, full vector values, and the sliced bit.
