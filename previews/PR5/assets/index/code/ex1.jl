# This file was generated, do not modify it. # hide
H = [
  6.0 2.0 1.0
  2.0 5.0 2.0
  1.0 2.0 4.0
]
c = [-8.0; -3; -3]
A = [
  1.0 0.0 1.0
  0.0 2.0 1.0
]
lcon = [-2.0; 0.]
ucon = [10.0; 20.0]
l = [0.0; 0; 0]
u = [Inf; Inf; Inf]
using LinearAlgebra, SparseArrays, QuadraticModels, SparseMatricesCOO, LinearOperators
HCOO = SparseMatrixCOO(tril(H))
ACOO = SparseMatrixCOO(A)
HCSC = sparse(tril(H))
ACSC = sparse(A)
qmCSC = QuadraticModel(c, HCSC, A = ACSC, lcon = lcon, ucon = ucon, lvar = l, uvar = u,
                       c0 = 0.0, name = "QM_CSC")