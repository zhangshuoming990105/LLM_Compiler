#include <stdio.h>

typedef struct point {  // offset
    float x;            // 0
    float y;            // 4
} point_t;              // size: 8

typedef struct line {   // offset
    point_t start;      // 0
    point_t end;        // 8
} line_t;               // size: 16

// collect locals: a1, b1, c1, a2, b2, c2, d
// collect params: l1, l2
point_t cross_point(line_t l1, line_t l2) {
    float a1 = l1.end.y - l1.start.y;
    float b1 = l1.start.x - l1.end.x;
    float c1 = l1.end.x * l1.start.y - l1.start.x * l1.end.y;

    float a2 = l2.end.y - l2.start.y;
    float b2 = l2.start.x - l2.end.x;
    float c2 = l2.end.x * l2.start.y - l2.start.x * l2.end.y;

    float d = a1 * b2 - a2 * b1;
    point_t p;
    p.x = (b1 * c2 - b2 * c1) / d;
    p.y = (a2 * c1 - a1 * c2) / d;
    return p;
}

int main() {
    line_t l1 = {{0, 0}, {1, 1}};
    line_t l2 = {{0, 1}, {1, -0}};
    point_t p = cross_point(l1, l2);
    printf("cross point: (%.3f, %.3f)\n", p.x, p.y);
    return 0;

}