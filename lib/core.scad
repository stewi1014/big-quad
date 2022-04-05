SMALL_NUMBER = 0.001;

module HexScrew(length, m = 3) {
    color("grey") {
        cylinder(m+0.001, m*.9, m*.9, center = false);
        translate([0, 0, -length]) cylinder(length+.01, d1 = m, d2 = m, center = false);
    }
}

module HexScrewHeadClearance(m = 3) {
    cylinder(m * 2, m*2, 1, center = false);
}

module HexScrewConnection(m = 3, length = 20, cut = 10.001) {
    cylinder(cut, m*.9, m+(cut/5), center = false);
    HexScrew(length, m);
}

module SquareOf(size, rotate = 0) {
    offset = size / 2;

    rotate(rotate) translate([offset, offset]) rotate(-rotate) children(0);
    rotate(90 + rotate) translate([offset, offset]) rotate(-rotate) children(0);
    rotate(180 + rotate) translate([offset, offset]) rotate(-rotate) children(0);
    rotate(270 + rotate) translate([offset, offset]) rotate(-rotate) children(0);
}

module PaddedCube(size = [1, 1, 1], pad = 0, center = false) {
    new_size = [size[0] + pad, size[1] + pad, size[2] + pad];
    if (center)
        cube(new_size, center = true);
    else
        translate([-pad/2, -pad/2, -pad/2])
            cube(new_size, center = false);
}

HexScrew(50, m = 10);

translate([30, 0, 0]) {
    color("red") HexScrew(20, m = 3);
    color("blue") HexScrewHeadClearance(3);
}