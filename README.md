# Simon's Algorithm

> **Category**: search &nbsp;|&nbsp; **Difficulty**: intermediate &nbsp;|&nbsp; **Qubits**: 4 &nbsp;|&nbsp; **Gates**: 6 &nbsp;|&nbsp; **Depth**: 4

Simon's algorithm finds the hidden period s of a 2-to-1 function f: {0,1}^n → {0,1}^n satisfying f(x) = f(x⊕s) in O(n) quantum queries, versus exponential classically. Each run of the circuit yields a random string y orthogonal to s (y·s = 0 mod 2). After O(n) runs, Gaussian elimination over GF(2) recovers s. This problem inspired Shor's factoring algorithm.

## Expected Output

y such that y·s = 0 mod 2 for s='11'; run multiple times and apply GF(2) elimination

## Circuit

The OpenQASM 2.0 circuit is in [`circuit.qasm`](./circuit.qasm).

```
OPENQASM 2.0;
include "qelib1.inc";
// Simon's algorithm: 2-bit function with period s="11"
// f(00)=f(11)=10, f(01)=f(10)=01
// q[0..1]: input register, q[2..3]: output register
qreg q[4];
creg c[2];
// Superpose input
h q[0]; h q[1];
// Oracle for f with period s="11":
// Copy q[0] -> q[2], q[1] -> q[3], q[0] XOR q[1] -> q[2]
cx q[0],q[2];
cx q[1],q[2];
cx q[0],q[3];
// Apply Hadamard to input register
h q[0]; h q[1];
// Measure input: gives y satisfying y.s = 0 mod 2
measure q[0] -> c[0];
measure q[1] -> c[1];
```

## Tags

`simons` `hidden-subgroup` `period-finding` `exponential-speedup`

## References

- [Simon, D.R. (1997). On the Power of Quantum Computation. SIAM J. Comput. 26(5)](https://doi.org/10.1137/S0097539796298637)

## License

MIT — part of the [OpenQC Algorithm Catalog](https://github.com/openqc-algorithms).
