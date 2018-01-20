import numpy as np
cimport numpy as np  # for np.ndarray

from set_integer cimport set_integer_ref
from set_integer cimport set_integer_ptr
from set_integer cimport set_integer_ref_ptr
from set_integer cimport set_integer_ptr_ptr
from set_integer cimport set_integer_arr_ptr
from set_integer cimport set_integer_arr_ref_ptr

# Numpy must be initialized. When using numpy from C or Cython you must
# _always_ do that, or you will have segfaults
np.import_array()


cdef extern from "numpy/arrayobject.h":
    void PyArray_ENABLEFLAGS(np.ndarray arr, int flags)


cpdef pass_by_ref():
    cdef int x
    set_integer_ref(x)
    return x


cpdef pass_by_ptr_0():
    cdef int[1] x
    set_integer_ptr(x)
    return x[0]


cpdef pass_by_ptr_1():
    cdef np.ndarray[int, ndim=1, mode='c'] x

    x = np.zeros((1,), dtype=np.int32)
    set_integer_ptr(&x[0])
    return x[0]


cpdef pass_by_ref_ptr():
    cdef int* x
    set_integer_ref_ptr(x)
    return x[0]


cpdef pass_by_ptr_ptr():
    cdef int* x
    set_integer_ptr_ptr(&x)
    return x[0]


cpdef pass_by_ptr_arr():
    cdef np.ndarray[int, ndim=1, mode='c'] a

    a = np.zeros((4,), dtype=np.int32)
    set_integer_arr_ptr(&a[0])
    return a


cpdef pass_by_ref_ptr_arr():
    cdef:
        int* a_ptr
        int size
        np.npy_intp shape[1]

    set_integer_arr_ref_ptr(a_ptr, size)

    # 1. Make sure that you have called np.import_array()
    # http://gael-varoquaux.info/programming/
    # cython-example-of-exposing-c-computed-arrays-in-python-without-data-copies.html
    # 2. OWNDATA flag is important. It tells the NumPy to free data when the python object is deleted.
    # https://stackoverflow.com/questions/23872946/force-numpy-ndarray-to-take-ownership-of-its-memory-in-cython/
    # You can verify that the memory gets freed when Python object is deleted by using tools such as pmap.
    shape[0] = <np.npy_intp>size
    cdef np.ndarray[int, ndim=1] a = np.PyArray_SimpleNewFromData(1, shape, np.NPY_INT32, a_ptr)
    PyArray_ENABLEFLAGS(a, np.NPY_OWNDATA)
    return a
