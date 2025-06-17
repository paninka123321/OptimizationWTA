set ASM;                             
set SAM_real;                        
set SAM_artificial;                  
set SAM := SAM_real union SAM_artificial;

param p {ASM, SAM};                  
param d {SAM};                       
param s {ASM};                     
param h {ASM};                       
param beta;                         

param a {i in ASM, j in SAM} :=
    floor(-beta * log(1 - p[i,j]));

param b {i in ASM} :=
    floor(-beta * log(1 - h[i]));

var x {i in ASM, j in SAM} integer >= 0;

minimize ArtificialUse:
    sum {i in ASM, j in SAM_artificial} x[i,j];

# Constraint 1 
subject to Demand_Limit {j in SAM}:
    sum {i in ASM} x[i,j] <= d[j];

# Constraint 2
subject to Supply_Limit {i in ASM}:
    sum {j in SAM} x[i,j] <= s[i];

# Constraint 3
subject to Probability_Threshold {i in ASM}:
    sum {j in SAM} a[i,j] * x[i,j] >= b[i];

