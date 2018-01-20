void set_integer_ref(int& x)
{
    x = 100;
}


void set_integer_ptr(int* x)
{
    *x = 200;
}


void set_integer_ref_ptr(int*& x)
{
    x = new int[1];
    *x = 300;
}


void set_integer_ptr_ptr(int** x)
{
    *x = new int[1];
    *x[0] = 400;
}


void set_integer_arr_ptr(int* a)
{
    a[0] = 1;
    a[1] = 3;
    a[2] = 5;
    a[3] = 7;
}


void set_integer_arr_ref_ptr(int*& a, int& size)
{
    size = 100000000;
    a = new int[size];
    a[0] = 2;
    a[1] = 4;
    a[2] = 6;
    a[size - 1] = 100;
}
