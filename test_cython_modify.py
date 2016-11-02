import numpy as np
from cython_modify import modify


z = np.arange(6, dtype=np.uint32).reshape(2,3)
modify(z, copy=False)
print z

z = np.arange(6, dtype=np.uint32).reshape(2,3)
modify(z, copy=True)
print z

z = np.arange(6, dtype=np.uint32).reshape(2,3)
modify(z.copy(), copy=True)
print z
