🎯 What Is a Round-Robin Arbiter?
A round-robin arbiter ensures fair and bounded access to a shared resource by cycling through requesters in a fixed order. Unlike fixed-priority arbiters that can cause starvation, round-robin guarantees that each requester will eventually receive service 

⚙️ How It Works
1.	Mask-Based Priority Rotation
After each grant, the arbiter updates a mask so that the next requester in sequence becomes the first to be considered. This mask rotates continuously, preserving shared fairness 
2.	Dual Arbiter Mechanism
The logic uses two fixed-priority controllers:
o	One scans all active requests directly.
o	The other uses the masked requests to respect the current priority rotation.
The final grant is based on whichever arbiter (masked or unmasked) produces the active request No Starvation Guarantee
Every requester will get service in a predictable round robin sequence, even if others stay active.

⭐ Key Advantages
•	Fairness: Requests are honored in sequence, with no single requester dominating.
•	No Starvation: Each band gets guaranteed turns—unlike fixed-priority systems where low-priority can be denied indefinitely.
•	Efficient Hardware: Builds on existing priority encoder logic with minimal overhead 

🧩 Use Cases
•	Ideal in scenarios where every client must be guaranteed access, such as network routers, bus controllers, or multi-client shared memory systems.
•	When simple yet fair arbitration is needed without tailored priority managemen


