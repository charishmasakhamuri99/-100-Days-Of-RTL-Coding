
Theory Explanation:
JK Flip-Flop Overview
A JK flip-flop is a universal flip-flop that can perform the functions of Set, Reset, and Toggle based on its input signals J and K:
•	When J=0, K=0: No change (hold current state)
•	When J=0, K=1: Reset (output goes to 0)
•	When J=1, K=0: Set (output goes to 1)
•	When J=1, K=1: Toggle (output switches state)
D Flip-Flop Overview
A D (Data or Delay) flip-flop simply captures the value of its input D at the rising edge of the clock and outputs it as Q. It has no inherent Set, Reset, or Toggle modes beyond what is externally provided.
Implementing JK using D Flip-Flop
Since we only have a D flip-flop, we must express the JK flip-flop’s behavior using logic at the D input, so that the output Q of the D flip-flop behaves like a JK flip-flop.
The characteristic equation for the JK flip-flop, rewritten for the D input, is:
•	D = J·(~Q) + (~K)·Q
Here,
•	J and K are the JK flip-flop inputs,
•	Q is the current output of the flip-flop,
•	D is the input for the D flip-flop.
This equation ensures the right next state for Q, depending on J, K, and the previous Q.
How the Code Works
1.	D_FF module:
•	This is a simple D flip-flop with clock and synchronous reset. It stores the input D at every clock edge.
2.	JK_FF_Using_DFF module:
•	This module uses the characteristic equation above to compute D, using the current Q.
•	The D value is then given to the D flip-flop.
•	The output Q of the D flip-flop is used as the JK flip-flop’s output.
Essentially, the module wraps a D flip-flop with extra logic to “translate” JK inputs into proper D input changes, thus replicating a JK flip-flop's behavior.
Purpose of the Testbench
•	The testbench initializes and drives the circuit, applying all input combinations (J, K) to verify correct Set, Reset, Toggle, and Hold operations on clock edges, mimicking standard JK flip-flop behavior.
Summary:
By using the characteristic equation, the code transforms JK flip-flop input behavior into an equivalent D input. The single D flip-flop, with this logic added upfront, can thus function identically to a true JK flip-flop. This demonstrates how more complex flip-flop types can be built from simpler ones using the right combinational logic.
