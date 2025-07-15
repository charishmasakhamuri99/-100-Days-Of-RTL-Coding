🔢 1. Decimal-to-Binary (Base‑10 → Base‑2)
Integer Part: Division-by‑2 Method
To convert a whole decimal number (N) into binary:

Repeatedly divide N by 2, keeping track of the integer quotient and the remainder (0 or 1).

Continue until the quotient becomes 0.

The binary equivalent is the sequence of remainders read in reverse order (from last division to the first)
This method runs in O(log₂ N) time and requires storing only log₂ N bits .

Fractional Part (if any): Multiply‑by‑2 Method
To convert the fractional part (e.g., 0.375):

Repeatedly multiply the fraction by 2.

Extract the integer part of each result (0 or 1) as the next binary digit.


🎯 2. Why It Works: Positional Notation
Both decimal and binary systems use positional weights:

Decimal digit: contributes digit × 10^position

Binary digit: contributes bit × 2^position

Division by 2 extracts the least significant bit each time, while multiplication by 2 converts fractions into binary digits 
🔡 3. BCD-to-Binary (Packed BCD → Pure Binary)
Decode BCD: Group bits in 4s; each nibble (0–9) represents a decimal digit.
Example: 0101 0111 = digits 5 and 7 → decimal 57 

Combine to integer: Form value = digitₙ×10ⁿ + … + digit₀.

Convert combined decimal → binary using division method over that integer.

This is the simplest hardware-friendly method, and is the basis behind textbook designs and modules 

🧠 4. Alternative: Double-Dabble (Binary → BCD)
Though less relevant here, it's worth noting the reverse: converting binary to BCD via the "double-dabble" (shift-add-3) algorithm:

Start with a binary number and a zeroed BCD register.

For each binary bit (from MSB to LSB):

Shift left both BCD and binary.

Before each shift, if any BCD nibble is ≥ 5, add 3 to it.

After all bits processed, the BCD register holds each decimal digit.


✅ Summary Table
Operation	Algorithm	Key Idea
Decimal → Binary	Divide by 2 + reverse bits	Each remainder is one bit of the binary number
Fractional → Binary	Multiply by 2	Each integer part is one binary digit
BCD → Decimal → Binary	Decode digits, then divide	Simpler to implement in hardware
Binary → BCD	Double Dabble (shift-add-3)	Converts binary to display-friendly format
