<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

This is a digital comparator circuit that compares two 8-bit input values. 

The circuit takes two inputs:
- `ui_in[0]` (V+) - First input value
- `ui_in[1]` (V-) - Second input value

The output `uo_out[0]` (Vout) is set to HIGH (1) when V+ is greater than V-, and LOW (0) otherwise.

The comparison logic is implemented using a simple combinational circuit:
```
Vout = (V+ > V-) ? 1 : 0
```

This allows for real-time voltage/value comparison without requiring a clock, making it a purely combinational design suitable for the Tiny Tapeout ASIC manufacturing process.

## How to test

To test this digital comparator:

1. Set the `ui_in[0]` pin to your first value (V+)
2. Set the `ui_in[1]` pin to your second value (V-)
3. Read the output on `uo_out[0]` (Vout)

**Expected behavior:**
- If V+ > V-, then Vout = 1 (HIGH)
- If V+ ≤ V-, then Vout = 0 (LOW)

**Example test cases:**
- V+ = 5, V- = 3 → Vout = 1 (since 5 > 3)
- V+ = 2, V- = 7 → Vout = 0 (since 2 ≤ 7)
- V+ = 4, V- = 4 → Vout = 0 (since 4 is not greater than 4)

The design includes automated tests using cocotb that verify correct comparator operation across multiple input combinations. Run `make` in the test directory to execute the test suite.

## External hardware

No external hardware is required for basic operation. The design is self-contained and operates purely on digital signals provided through the dedicated inputs and outputs.
