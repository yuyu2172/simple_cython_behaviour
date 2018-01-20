cdef extern from "set_integer.h":
    void set_integer_ref(int&)
    void set_integer_ptr(int*)
    void set_integer_ref_ptr(int*&)
    void set_integer_ptr_ptr(int**)
    void set_integer_arr_ptr(int*)
    void set_integer_arr_ref_ptr(int*&, int&)
