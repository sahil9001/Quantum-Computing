namespace Solution {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Measurement;
    operation Solve (unitary : (Qubit => Unit is Adj+Ctl)) : Int {
        // your code here
        using (qs = Qubit()){
            X(qs);
            unitary(qs);
            Z(qs);
            unitary(qs);
            let res = M(qs);
            Reset(qs);
            return res == One ? 1 | 0; 
        }
    }
}
