namespace Pauli_gate {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;

    // ...
    open Microsoft.Quantum.Diagnostics;

    operation PauliGates_Demo () : Unit {
        let divider = "--------------------------------------------------------------------------------------------------";
        // This allocates a qubit for us to work with
        using (q = Qubit()) {
            
            // This will put the qubit into an uneven superposition |𝜓❭,
            // where the amplitudes of |0⟩ and |1⟩ have different moduli
            Ry(1.0, q);

            Message("Qubit in state |𝜓❭:");
            DumpMachine();
            Message(divider);
            
            // Let's apply the X gate; notice how it swaps the amplitudes of the |0❭ and |1❭ basis states
            X(q);
            Message("Qubit in state X|𝜓❭:");
            DumpMachine();
            Message(divider);
            
            // Applying the Z gate multiplies -1 relative phase to the |1❭ basis states
            Z(q);
            Message("Qubit in state ZX|𝜓❭:");
            DumpMachine();
            Message(divider);
            
            // Finally, applying the Y gate returns the qubit to its original state |𝜓❭, with an extra global phase of i
            Y(q);
            Message("Qubit in state YZX|𝜓❭:");
            DumpMachine();
            
            // This returns the qubit into state |0❭
            Reset(q);
        }
    }
}
