import os
import sys


python_dir = os.path.dirname(__file__)
repository_dir = os.path.dirname(python_dir)

library_dir = os.path.join(
    repository_dir,
    "lib",
    "python-qt5")

if not library_dir in sys.path:
    sys.path.insert(0, library_dir)

import PyQt5
sys.modules[__name__] = PyQt5
reload(PyQt5)