import numpy as np
cimport numpy as np
from libcpp.vector cimport vector


cdef extern from "use_vector.h":
    void use_vector(vector[int]&)
    void use_vector_vector(vector[vector[int]]&)



cpdef cpp_simple_vector():
    cdef:
        vector[int] v
        np.ndarray[int, ndim=1, mode='c'] arr
        int i

    use_vector(v)
    arr = np.zeros((v.size(),), dtype=np.int32)
    for i in range(v.size()):
        arr[i] = v[i]
    return arr


cpdef cpp_simple_vector_vector():
    cdef:
        vector[vector[int]] vs
        np.ndarray[int, ndim=1, mode='c'] v
        int i, j, size
    use_vector_vector(vs)

    out = list()
    for i in range(vs.size()):
        if vs[i].size() > 0:
            size = vs[i].size()
            out_i = np.zeros((size,), dtype=np.int)
            for j in range(size):
                out_i[i] = vs[i][j]
            out.append(out_i)
        else:
            out.append(None)
    return out

