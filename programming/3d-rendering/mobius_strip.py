from math import cos, pi, sin
import numpy as np

priciseness = 100

vertices = []
edges = []
for i in range(priciseness):
    theta = 2 * pi / priciseness * i
    x = cos(theta) - 0.25 * cos(theta / 2) * cos(theta)
    y = sin(theta) - 0.25 * cos(theta / 2) * sin(theta)
    z = 0.25 * sin(theta / 2)
    new_point0 = np.array([x, y, z])
    vertices.append(new_point0)

    x = cos(theta) + 0.25 * cos(theta / 2) * cos(theta)
    y = sin(theta) + 0.25 * cos(theta / 2) * sin(theta)
    z = -0.25 * sin(theta / 2)
    new_point1 = np.array([x, y, z])
    vertices.append(new_point1)

    edges.append([2 * i, 2 * i + 1])

faces = []
for i in range(int(priciseness - 1)):
    faces.append([i * 2, i * 2 + 1, i * 2 + 3, i * 2 + 2])
faces.append([0, 1, -2, -1])
