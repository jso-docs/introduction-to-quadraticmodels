# This file was generated, do not modify it. # hide
Hrows, Hcols, Hvals = findnz(sparse(tril(H)))
Arows, Acols, Avals = findnz(sparse(A))
qmCOO2 = QuadraticModel(c, Hrows, Hcols, Hvals, Arows = Arows, Acols = Acols, Avals = Avals,
                        lcon = lcon, ucon = ucon, lvar = l, uvar = u,
                        c0 = 0.0, name = "QM_COO2")