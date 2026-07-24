import numpy as np

vertices = [
    np.array([1, 1, 1]),
    np.array([1, -1, -1]),
    np.array([-1, 1, -1]),
    np.array([-1, -1, 1]),
]

edges = [
    [0, 1],
    [1, 2],
    [2, 3],
    [3, 0],
    [0, 2],
    [1, 3],
]

faces = [
    [0, 1, 2],
    [0, 1, 3],
    [0, 3, 2],
    [1, 2, 3],
]
