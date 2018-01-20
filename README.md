# 1. Pass by Reference

```bash
$ python setup.py build_ext --inplace
$ python -c 'from cython_simple import pass_by_ref; print(pass_by_ref())'
100
$ python -c 'from cython_simple import pass_by_ptr_1; print(pass_by_ptr_1())'
200
$ python -c 'from cython_simple import pass_by_ptr_1; print(pass_by_ptr_1())'
200
$ python -c 'from cython_simple import pass_by_ref_ptr; print(pass_by_ref_ptr())'
300
$ python -c 'from cython_simple import pass_by_ptr_ptr; print(pass_by_ptr_ptr())'
400
$ python -c 'from cython_simple import pass_by_ptr_arr; print(pass_by_ptr_arr())'
[1 3 5 7]
$ python -c 'from cython_simple import pass_by_ref_ptr_arr; print(pass_by_ref_ptr_arr())'
[2 4 6 ..., 0 0 100]

```

1. The language needs to be set to `c++`.


