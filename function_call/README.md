# Pass by Reference


```bash
$ python setup.py build_ext --inplace
$ python -c 'from function_call import pass_by_ref; print(pass_by_ref())'
100
$ python -c 'from function_call import pass_by_ptr_1; print(pass_by_ptr_1())'
200
$ python -c 'from function_call import pass_by_ptr_1; print(pass_by_ptr_1())'
200
$ python -c 'from function_call import pass_by_ref_ptr; print(pass_by_ref_ptr())'
300
$ python -c 'from function_call import pass_by_ptr_ptr; print(pass_by_ptr_ptr())'
400
$ python -c 'from function_call import pass_by_ptr_arr; print(pass_by_ptr_arr())'
[1 3 5 7]
$ python -c 'from function_call import pass_by_ref_ptr_arr; print(pass_by_ref_ptr_arr())'
[2 4 6 ..., 0 0 100]

```

https://medium.com/@yuyuniitani/calling-c-functions-from-cython-references-pointers-and-arrays-e1ccb461b6d8

