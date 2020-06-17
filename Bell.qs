namespace Quantum.Bell {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;

    //Operation "Set" takes in two arguments 'desired' and a qubit 'q1'
    operation Set(desired : Result, q1 : Qubit) : Unit {
        //Checking if desired result equals to the measured qubit q1 (Measured using 'M' operator)
        if (desired != M(q1)){
            //If it doesn't match, we flip the probabilities of qubit q1 using 'X' operator (Pauli-X gate)
            X(q1);
        }
    }

    //This operation returns (Int, Int) which is specified after the colon
    operation TestBellState(count : Int, initial : Result) : (Int, Int) {
        //Set the numOnes variable to 0
        mutable numOnes = 0;
        // 'using' statement allocates qubits at the start, and releases at the end of block
        using (qubit = Qubit()) {

            for (test in 1..count) {
                //Measure and test the qubit if it equals to initial value
                Set(initial, qubit);
                // 'res' is assigned to measured value of qubit
                let res = M(qubit);

                // Count the number of ones we saw:
                if (res == One) {
                    set numOnes += 1;
                }
            }
            Set(Zero, qubit);
        }

        // Return number of times we saw a |0> and number of times we saw a |1>
        return (count-numOnes, numOnes);
    }

}