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
