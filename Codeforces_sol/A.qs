namespace Solution {
    open Microsoft.Quantum.Intrinsic;
     open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Measurement;
    // ...
    open Microsoft.Quantum.Diagnostics;
    operation Solve () : Int {
        // your code here
        using(qs = Qubit()){
            let alpha = PI();
            DumpMachine();
            
            Rz(alpha*0.5,qs);
            DumpMachine();
            Reset(qs);
            
            return 0;
        }
    }
}