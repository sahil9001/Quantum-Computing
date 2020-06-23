namespace Solution {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Measurement;
    
    operation Solve (unitary : (Qubit[] => Unit is Adj+Ctl)) : Int {
        using (qs = Qubit[2]) {
                X(qs[0]);
                X(qs[1]);
//                DumpMachine();
                unitary(qs);
          //      DumpMachine();
                let res1 = M(qs[0]);
                let res2 = M(qs[1]);
                
                if(res1 != res2){
                    ResetAll(qs);
                    return res1 == One ? 1 | 2;
                }
                else{
                    ResetAll(qs);
                    X(qs[0]);
                    unitary(qs);
                    let res3 = M(qs[0]);
                    ResetAll(qs);
                    return res3 == Zero ? 3 | 0;
                }
            }
    }
}
