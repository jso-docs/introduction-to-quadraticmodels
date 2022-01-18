# This file was generated, do not modify it.

# Create a QuadraticModel

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

qmCOO = QuadraticModel(c, HCOO, A = ACOO, lcon = lcon, ucon = ucon, lvar = l, uvar = u,
                       c0 = 0.0, name = "QM_COO")

qmDense = QuadraticModel(c, tril(H), A = A, lcon = lcon, ucon = ucon, lvar = l, uvar = u,
                         c0 = 0.0, name = "QM_Dense")

qmLinop = QuadraticModel(c, LinearOperator(Symmetric(H)), A = LinearOperator(A),
                         lcon = lcon, ucon = ucon, lvar = l, uvar = u,
                         c0 = 0.0, name = "QM_Linop")

Hrows, Hcols, Hvals = findnz(sparse(tril(H)))
Arows, Acols, Avals = findnz(sparse(A))
qmCOO2 = QuadraticModel(c, Hrows, Hcols, Hvals, Arows = Arows, Acols = Acols, Avals = Avals,
                        lcon = lcon, ucon = ucon, lvar = l, uvar = u,
                        c0 = 0.0, name = "QM_COO2")

T = Float64
S = Vector{T}
qmCOO3 = convert(QuadraticModel{T, S, SparseMatrixCOO{T, Int}, SparseMatrixCOO{T, Int}},
                 qmDense)

qmCOO4 = convert(QuadraticModel{T, S, SparseMatrixCOO{T, Int}, SparseMatrixCOO{T, Int}},
                 qmCSC)

using NLPModels
x = rand(3)
grad(qmCOO, x)

hess(qmCOO, x)

using NLPModelsModifiers
qmSlack = SlackModel(qmCOO)

using QPSReader
qps = readqps("AFIRO.SIF")
qmCOO4 = QuadraticModel(qps)

using RipQP
stats = ripqp(qmCOO)
println(stats)

