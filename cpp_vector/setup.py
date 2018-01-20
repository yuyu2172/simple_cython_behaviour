from distutils.core import setup
from Cython.Build import cythonize
from distutils.extension import Extension
import numpy


extensions = [
    Extension('cpp_simple_vector', ['cpp_simple_vector.pyx', 'use_vector.cpp'],
              include_dirs=[numpy.get_include()],
              extra_compile_args=['-std=c++11'],
              language='c++'
              ),
]

setup(
    ext_modules=cythonize(extensions),
    # extra_compile_args=["-w", '-g'],
)
