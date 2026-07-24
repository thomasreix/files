from dataclasses import dataclass
from math import cos, sin
from typing import Any

import numpy as np
import pygame
from numpy.typing import NDArray
from pygame import Surface, Vector2

type Vertex = NDArray[Any]

projection_matrix = np.array([[1, 0, 0], [0, 1, 0], [0, 0, 0]])


@dataclass
class Orientation:
    angle_x: float
    angle_y: float
    angle_z: float


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


def render_shape(
    screen: Surface,
    vertices: list[Vertex],
    edges: list[list[int]],
    faces: list[list[int]],
    orientation: Orientation,
    position: Vector2,
    dimention: Dimension,
    color: Color,
    visibility: Visibility,
):
    projected_points = []

    rotation_x = np.array(
        [
            [1, 0, 0],
            [0, cos(orientation.angle_x), -sin(orientation.angle_x)],
            [0, sin(orientation.angle_x), cos(orientation.angle_x)],
        ]
    )
    rotation_y = np.array(
        [
            [cos(orientation.angle_y), 0, sin(orientation.angle_y)],
            [0, 1, 0],
            [-sin(orientation.angle_y), 0, cos(orientation.angle_y)],
        ]
    )
    rotation_z = np.array(
        [
            [cos(orientation.angle_z), -sin(orientation.angle_z), 0],
            [sin(orientation.angle_z), cos(orientation.angle_z), 0],
            [0, 0, 1],
        ]
    )

    for vertex in vertices:
        rotate_x = np.matmul(rotation_x, vertex)
        rotate_y = np.matmul(rotation_y, rotate_x)
        rotate_z = np.matmul(rotation_z, rotate_y)
        projected_point = np.matmul(projection_matrix, rotate_z)

        x = projected_point[0] * dimention.scale + position.x
        y = projected_point[1] * dimention.scale + position.y

        projected_points.append([x, y])

    if visibility.face:
        for face in faces:
            face_points = []
            for point in face:
                face_points.append(projected_points[point])
            pygame.draw.polygon(screen, color.face, (face_points), 0)

    if visibility.edge:
        for edge in edges:
            pygame.draw.line(
                screen,
                color.edge,
                projected_points[edge[0]],
                projected_points[edge[1]],
                dimention.width,
            )

    if visibility.vertex:
        for point in projected_points:
            pygame.draw.circle(screen, color.vertex, point, dimention.width, 0)
