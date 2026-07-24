from math import cos, pi, sin
import numpy as np

priciseness = 1000

vertices = [np.array([0, 0, 0])]
for i in range(priciseness):
    theta = 2 * pi / priciseness * i
    x = cos(theta)
    y = sin(theta)
    new_point = np.array([x, y, 0])
    vertices.append(new_point)

edges = []

faces = []
for i in range(priciseness):
    faces.append([0, i, i + 1])
faces.append([0, -1, 1])
