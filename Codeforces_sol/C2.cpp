namespace Solution {
    open Microsoft.Quantum.Intrinsic;
 
    operation Solve (qs : Qubit[], parity : Int) : Unit {
        let N = Length(qs);
        if(parity == 1) {X(qs[0]);}
        for(i in 1 .. N-1) {
            H(qs[i]);
            Controlled X([qs[i]],qs[i-1]);
        }
    }
}
