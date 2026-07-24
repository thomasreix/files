import sys
from math import cos, pi, sin

import numpy as np
import pygame
from simpy import render_shape


def main():
    pygame.init()

    width, height = 960, 540
    pygame.display.set_caption("disk")
    screen = pygame.display.set_mode((width, height))

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

    def orientation(self):
        self.angle_x = 0
        self.angle_y = 0
        self.angle_z = 0

    orientation(orientation)

    position = pygame.math.Vector2(width / 2, height / 2)

    def dimention(self):
        self.scale = 100
        self.width = 8

    dimention(dimention)

    def color(self):
        self.vertex = (255, 127, 0)
        self.edge = (255, 127, 0)
        self.face = (255, 190, 0)

    color(color)

    def visibility(self):
        self.vertex = False
        self.edge = False
        self.face = True

    visibility(visibility)

    clock = pygame.time.Clock()
    while True:
        clock.tick(60)
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                pygame.quit()
                sys.exit()
        screen.fill((0, 0, 0))

        orientation.angle_x += 0.02
        orientation.angle_y += 0.01
        orientation.angle_z += 0.0

        render_shape(
            screen,
            vertices,
            edges,
            faces,
            orientation,
            position,
            dimention,
            color,
            visibility,
        )

        pygame.display.flip()


if __name__ == "__main__":
    main()
