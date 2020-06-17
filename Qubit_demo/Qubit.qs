namespace Qubit_demo {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;

    // ...
open Microsoft.Quantum.Diagnostics;

operation Qubits_Demo () : Unit {
    let divider = "--------------------------------------------------------------------------------------------------";
    
    // This line allocates a qubit in state |0⟩
    using (q = Qubit()) {
        Message("State |0⟩:");
        
        // This line prints out the state of the quantum computer
        // Since only one qubit is allocated, only its state is printed
        DumpMachine();
        Message(divider);
        
        // This line changes the qubit from state |0⟩ to state |1⟩
        X(q);
        
        Message("State |1⟩:");
        DumpMachine();
        Message(divider);
        
        // This line changes the qubit to state |-⟩ = (1/sqrt(2))(|0⟩ - |1⟩)
        // That is, this puts the qubit into a superposition
        // 1/sqrt(2) is approximately 0.707107
        H(q);
        
        Message("State |-⟩:");
        DumpMachine();
        Message(divider);
        
        // This line changes the qubit to state |-i⟩ = (1/sqrt(2))(|0⟩ - i|1⟩)
        S(q);
        
        Message("State |-i⟩:");
        DumpMachine();
        Message(divider);
        
        // This will put the qubit into an uneven superposition,
        // where the amplitudes of |0⟩ and |1⟩ have different moduli
        Rx(2.0, q);
        Ry(1.0, q);
        
        Message("Uneven superposition state:");
        DumpMachine();
        
        // This line returns the qubit to state |0⟩
        Reset(q);
    }
}
}

