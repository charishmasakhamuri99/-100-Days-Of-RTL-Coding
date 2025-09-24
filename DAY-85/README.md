
Basic Characteristics:
•	A JK flip-flop has inputs JJ and KK, and output QQ. On the rising edge of the clock, the outputs change as:
•	J=0,K=0J=0,K=0: No change (hold state)
•	J=0,K=1J=0,K=1: Reset Q=0Q=0
•	J=1,K=0J=1,K=0: Set Q=1Q=1
•	J=1,K=1J=1,K=1: Toggle QQ
•	A D flip-flop has a single input DD and output QQ. On the clock edge, QQ simply follows DD.
Conversion Principle:
To make a JK flip-flop behave like a D flip-flop, the inputs JJ and KK are controlled so that toggling never happens, and QQ mimics DD exactly:
J=DJ=DK=D‾K=D
•	When D=1D=1:
•	J=1J=1 and K=0K=0 → Set Q=1Q=1
•	When D=0D=0:
•	J=0J=0 and K=1K=1 → Reset Q=0Q=0
Thus, the JK flip-flop output QQ directly follows the DD input without any toggling.
Why this works:
•	By forcing JJ and KK to never be both 1 at the same time, the toggle behavior of JK flip-flop is avoided.
Summary:
•	This method relies on the excitation table and characteristic table analysis that shows how to drive JJ and KK inputs to replicate DD-flip-flop behavior.
•	It is useful when only JK flip-flops are available but a D flip-flop functionality is required.
