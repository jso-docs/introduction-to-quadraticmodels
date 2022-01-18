# This file was generated, do not modify it. # hide
T = Float64
S = Vector{T}
qmCOO3 = convert(QuadraticModel{T, S, SparseMatrixCOO{T, Int}, SparseMatrixCOO{T, Int}},
                 qmDense)

qmCOO4 = convert(QuadraticModel{T, S, SparseMatrixCOO{T, Int}, SparseMatrixCOO{T, Int}},
                 qmCSC)