#model.mod

set N;                      # ASMs
set M;                      # SAMs
set V within {N, M};         # Valid ASM-SAM engagements (V is a subset of N x M)

param a {V};                # Coefficients a_ij
param b {N};                # Right-hand side thresholds
param d {M};                # Available rounds on SAM j
param s {N};                # Max engagements against ASM i
param u {V};                # Max missiles from SAM j to ASM i

var x {V} >= 0, integer;    # Number of missiles from j to i
var e >= 0;                 # Maximum deviation

# Objective
minimize Total_Deviation: e;

# Constraint (9)
subject to Protection_Constraint {i in N}:
    sum {j in M: (i,j) in V} a[i,j] * x[i,j] + e >= b[i];

# Constraint (2)
subject to SAM_Capacity {j in M}:
    sum {i in N: (i,j) in V} x[i,j] <= d[j];

# Constraint (3)
subject to Max_Engagements {i in N}:
    sum {j in M: (i,j) in V} x[i,j] <= s[i];

# Constraint (4)
subject to Engagement_Limits {(i,j) in V}:
    0<= x[i,j] <= u[i,j];
