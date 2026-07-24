from dataclasses import dataclass
from math import cos, sin

import pygame
from pygame import Surface

import sys

import tetrahedron
import cube
import dodecahedron
import disk
import mobius_strip



@dataclass
class Dimension:
    scale: float
    width: float


@dataclass
class Color:
    vertex: tuple
    edge: tuple
    face: tuple


@dataclass
class Visibility:
    vertex: bool
    edge: bool
    face: bool


def matrix_multiplication(
    matrix: list[list[float]], vector: list[float]
) -> list[float]:
    result = []
    for row in matrix:
        total = sum(row[i] * vector[i] for i in range(len(vector)))
        result.append(total)
    return result


def rotate_points(
    vertices: list[float],
    orientation: list,
):
    rotation_x = [
        [1, 0, 0],
        [0, cos(orientation[0]), -sin(orientation[0])],
        [0, sin(orientation[0]), cos(orientation[0])],
    ]
    rotation_y = [
        [cos(orientation[1]), 0, sin(orientation[1])],
        [0, 1, 0],
        [-sin(orientation[1]), 0, cos(orientation[1])],
    ]

    rotation_z = [
        [cos(orientation[2]), -sin(orientation[2]), 0],
        [sin(orientation[2]), cos(orientation[2]), 0],
        [0, 0, 1],
    ]

    rotated_points = []
    for vertex in vertices:
        rotate_x = matrix_multiplication(rotation_x, vertex)
        rotate_y = matrix_multiplication(rotation_y, rotate_x)
        rotate_z = matrix_multiplication(rotation_z, rotate_y)
        rotated_point = rotate_z
        rotated_points.append(rotated_point)


    return rotated_points


def project_points(vertices: list[list[float]]):
    projected_points = []
    distance = 5  # move the object away from the camera

    for vertex in vertices:
        x = vertex[0]
        y = vertex[1]
        z = vertex[2] + distance

        if z != 0:
            x = (x / z)
            y = (y / z)

        point = [x, y]
        projected_points.append(point)

    return projected_points


def display(
    screen: Surface,
    points: list[list[int]],
    edges: list[list[int]],
    faces: list[list[int]],
    scale: int,
    width:int,
    height:int,
    line_width: int,
    color: Color,
    visibility: Visibility,
):
    displayed_points = []
    for point in points:
        x = point[0] * scale + width / 2
        y = point[1] * scale + height / 2
        displayed_point = [x, y]
        displayed_points.append(displayed_point)


    if visibility.face:
        for face in faces:
            face_points = []
            for point in face:
                face_points.append(displayed_points[point])
            pygame.draw.polygon(screen, color.face, (face_points), 0)

    if visibility.edge:
        for edge in edges:
            pygame.draw.line(
                screen,
                color.edge,
                displayed_points[edge[0]],
                displayed_points[edge[1]],
                line_width,
            )

    if visibility.vertex:
        for point in displayed_points:
            pygame.draw.circle(screen, color.vertex, point, line_width, 0)


def main():
    pygame.init()

    width, height = 960, 540
    pygame.display.set_caption("cube")
    screen = pygame.display.set_mode((width, height))

    shapes = [tetrahedron, cube, dodecahedron, disk, mobius_strip]
    shape = shapes[1]
    vertices = shape.vertices
    edges = shape.edges
    faces = shape.faces

    orientation = [0, 0, 0]

    scale = 500
    color = Color((0, 63, 255), (0, 63, 255), (0, 127, 255))
    line_width = 2
    visibility = Visibility(vertex=False, edge=True, face=False)

    clock = pygame.time.Clock()
    while True:
        clock.tick(60)
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                pygame.quit()
                sys.exit()
        screen.fill((0, 0, 0))


        orientation[0] += 0.01
        orientation[1] += 0.02
        orientation[2] += 0.00

        rotated_points = rotate_points(vertices, orientation)
        projected_points = project_points(rotated_points)
        display(
            screen,
            projected_points,
            edges,
            faces,
            scale,
            width,
            height,
            line_width,
            color,
            visibility,
        )

        pygame.display.flip()


if __name__ == "__main__":
    main()
