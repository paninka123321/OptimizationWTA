solve;
display x;
# Compute and print the probability of no-leaker
param P_nl;

let P_nl := product {i in ASM} (1 - product {j in SAM} (1 - p[i,j]) ^ x[i,j]);

printf "\nProbability of No-Leaker: %.4f\n", P_nl;
printf "\nArtificial SAMs used: %d\n",
    sum {i in ASM, j in SAM_artificial} x[i,j];
