$fs = 0.01;

use <core.scad>

module BaseScrews() {
    seperation = (40.8 + 3)/2;
    distance = (88.9 + 3)/2;

    // Left two
    translate([-seperation, distance]) children(0);
    translate([seperation, distance]) children(0);

    // Right two
    translate([-seperation, -distance]) children(0);
    translate([seperation, -distance]) children(0);

    // Front two
    translate([distance, -seperation]) children(0);
    translate([distance, seperation]) children(0);

    // Back two
    translate([-distance, -seperation]) children(0);
    translate([-distance, seperation]) children(0);
}

module BaseObstacles() {
    // plus-pattern screws
    front_back_seperation = (58.5 - 4.3)/2;
    left_right_seperation = (59.7 - 4.3)/2;

    translate([front_back_seperation, 0, -0.001]) HexScrewHeadClearance(3);
    translate([-front_back_seperation, 0, -0.001]) HexScrewHeadClearance(3);

    translate([0, left_right_seperation, -0.001]) HexScrewHeadClearance(3);
    translate([0, -left_right_seperation, -0.001]) HexScrewHeadClearance(3);

    // x-pattern screws
    diagonal_seperation = (54.4 - 4.3) / 2;

    rotate(45) {
        translate([diagonal_seperation, 0, -0.001]) HexScrewHeadClearance(3);
        translate([-diagonal_seperation, 0, -0.001]) HexScrewHeadClearance(3);
        translate([0, diagonal_seperation, -0.001]) HexScrewHeadClearance(3);
        translate([0, -diagonal_seperation, -0.001]) HexScrewHeadClearance(3);
    }
}

BaseScrews() HexScrew(10);
BaseObstacles();