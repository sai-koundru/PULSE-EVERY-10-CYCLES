# PULSE-EVERY-10-CYCLES

# 🔂 Pulse Every 10 Clock Cycles (Verilog)

This project implements a Verilog module that generates a **single-cycle output pulse** every **10 clock cycles**, **only when enabled via a `start` signal**. This is commonly used in counters, event timers, sampling triggers, or FSM control signals.

---

## 📦 Module: `pulse_every_10_cycles`

### 🧠 Functional Description

The module monitors the `start` signal:
- When `start = 1`, it counts clock cycles
- After **10 clock cycles** (i.e., count reaches 9), it pulses `op_sig = 1` for **1 clock cycle**
- Then the count resets and starts again
- `rst` asynchronously resets the entire logic

---

## 📋 Ports Description

| Signal    | Direction | Description                                          |
|-----------|-----------|------------------------------------------------------|
| `clk`     | Input     | System clock                                         |
| `start`   | Input     | Enables counting while high                          |
| `rst`     | Input     | Asynchronous reset, clears counter and output        |
| `op_sig`  | Output    | Single-cycle high pulse every 10 active `clk` ticks  |

---

## 🧮 Truth Table (Conceptual)

| `clk` | `start` | `count` | `op_sig` |
|-------|---------|---------|----------|
| ↑     | 1       | 0..8    | 0        |
| ↑     | 1       | 9       | 1        |
| ↑     | 1       | reset   | 0        |
| ↑     | 0       | hold    | 0        |
| ↑     | any     | —       | 0 (on `rst`) |

---

## 💾 Example Use Case

Used to:
- Trigger periodic sampling
- Send strobes at fixed intervals
- Generate timing markers in FSMs
- Debounce after a fixed window

---

## 🧪 Test Suggestion (Optional Testbench Idea)

```verilog
initial begin
  clk = 0;
  rst = 1;
  start = 0;
  #20 rst = 0;
  #10 start = 1;
  // After 90 cycles, expect op_sig to pulse
end
