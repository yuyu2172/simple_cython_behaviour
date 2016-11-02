cimport numpy as np
cimport cython
from libc.stdint cimport uint32_t, uint8_t


cdef void _modify(uint32_t[:, :] arr) nogil:
    cdef int i
    for i in xrange(arr.shape[0]):
        for j in xrange(arr.shape[1]):
            arr[i, j] = arr[i, j] + 1 

def modify(arr, copy=True):
    if copy:
        arr = arr.copy()

    _modify(arr)
