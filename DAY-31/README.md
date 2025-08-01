1. Basic MUX Theory
An 8:1 multiplexer (MUX) is a digital combinational circuit with:

Its function: based on the binary value of (𝑆2𝑆1𝑆0)(S 2S 1S 0), exactly one input is routed to the output. Formally:

𝑌=(¬𝑆2∧¬𝑆1∧¬𝑆0∧𝐼0)∨…∨(𝑆2∧𝑆1∧𝑆0∧𝐼7)Y=(¬S 2∧¬S 1 ∧¬S 0∧I 0)∨…∨(S 2∧S 1​∧S 0∧I 7​)

That is, the input corresponding to the select pattern appears at the output 

2. Conditional Operator as a 2:1 Switch
In languages like Verilog, the ternary ?: operator embodies a 2:1 multiplexer:

assign Q = sel ? B : C;
If sel = 1, Q = B; otherwise Q = C.

This directly corresponds to:
𝑄=(𝑠𝑒𝑙∧𝐵)∨(¬𝑠𝑒𝑙∧𝐶)Q=(sel∧B)∨(¬sel∧C)

Essentially it's a conditioned disjunction at the logic level 
4. Theoretical Foundation: Conditioned Disjunction
The ternary structure (“if 𝑞q then 𝑝p else 𝑟r”)is formally known as conditioned disjunction. In logic:(𝑞→𝑝)∧(¬𝑞→𝑟)(q→p)∧(¬q→r)

Equivalently:(𝑞∧𝑝)∨(¬𝑞∧𝑟)(q∧p)∨(¬q∧r)

This mirrors how a MUX selects between two values based on a condition—at each level in the nested chain 
5. Architectural View
Internally, an 8:1 MUX can be constructed using:

8 AND gates, each enabled by one unique combination of select inputs

3 NOT gates for inverting select signals where needed

1 OR gate that combines outputs of all AND gates

Only the AND gate whose select inputs match the binary address is enabled, so its input drives the final output 
 Alternatively, two 4:1 multiplexers can feed into a final 2:1 MUX to achieve 8:1 selection 

Gate‑level structure	8 ANDs + NOTs decode selects, then OR to combine

🔍 Theoretical Insight
Each 2:1 conditional expression is a building block of the full 8:1 logic.

Nesting yields a clean expression consistent with the formal conditioned disjunction principle.

Though chaining many conditionals can be syntactically dense, synthesis tools handle it efficiently and map it to the corresponding logic gates or priority encoders in hardware 
