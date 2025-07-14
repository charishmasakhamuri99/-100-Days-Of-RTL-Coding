1. Finite‑State Machine Basics
A finite‑state machine (FSM) is an abstract model defined by a finite set of states, inputs, outputs, a transition function, and (for Mealy) an output function that may depend on state and input .
FSMs process a sequence of input symbols one at a time, moving from state to state according to the transition function .

2. Mealy Machine Definition
A Mealy machine is an FSM whose outputs are functions of both the current state and the current input symbol .
Formally, a Mealy machine is a 6‑tuple 
 ( 𝑄,Σ,Λ,𝛿,𝜆,𝑞0)
(Q,Σ,Λ,δ,λ,q 0) where:

𝑄
Q is a finite set of states.

Σ
Σ is the input alphabet.

Λ
Λ is the output alphabet.

δ:Q×Σ→Q is the state‑transition function.
3. State‑Transition and Output Logic in “1010” Detector
Our Mealy detector uses four states (A–D) to track partial matches of “1010.”

State A: no bits matched yet; on input ‘1’ go to B, else stay in A.

State B: saw ‘1’; on ‘0’ go to C, else remain in B.

State C: saw “10”; on ‘1’ go to D, else back to A.

State D: saw “101”; on ‘0’ output 1 and go to C (overlap), on ‘1’ stay in B .
Because output (z) is tied to the transition in state D when input = ‘0’, it is asserted in the same clock that completes “1010” .

4. Overlapping Detection
Overlapping means the FSM can recognize back‑to‑back appearances of “1010” without resetting completely.
By routing state D on output back to state C (which has memory of the last two bits “10”), the machine can immediately detect the next “1010” beginning at that bit .

5. Mealy vs. Moore Comparison
Mealy: outputs on transitions → can use fewer states and respond immediately to inputs .

Moore: outputs on states → outputs change one cycle after the final input, often requiring extra states for timing .
Thus, Mealy designs often have lower latency but require careful glitch avoidance, whereas Moore designs are glitch‑free at the cost of extra states and delayed outputs .

6. Advantages and Trade‑Offs
Fewer States: Because outputs are on transitions, Mealy machines typically need fewer states than equivalent Moore machines .

Immediate Output: The detection output appears the very cycle the sequence completes, crucial for high‑speed serial processing .

Glitch Sensitivity: Since outputs combine state and input, glitches on inputs can momentarily assert outputs spuriously; requires synchronous design attention (e.g., input registers, careful encoding) .
