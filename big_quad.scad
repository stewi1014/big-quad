
$fs = 0.01;

use <lib/core.scad>
use <lib/flight_controller.scad>
use <lib/tarot.scad>
use <lib/crossfire.scad>

base_thickness = 18;

$show_parts = true;

module d() {
    translate([0, 0, 10])
    rotate([0, 180])
    SquareOf(30) HexScrewConnection();
    SquareOf(30) HexScrew(20);
}

module BasePlate() {
    difference() {
        hull() BaseScrews() cylinder(base_thickness, 8, 8, center = false);
        translate([0, 0, base_thickness]) BaseScrews() HexScrewConnection();
        BaseObstacles();

        // FC mounts
        translate([0, 0, 10])
        rotate([0, 180])
        SquareOf(30) HexScrewConnection();

        // Empty space
        translate([0,0,-0.001]){ 
            cylinder(base_thickness + 0.002, 14, 14);
            hull() {
                translate([24, 0, 0]) cylinder(base_thickness + 0.002, 5, 5);
                translate([43, 10, 0]) cylinder(base_thickness + 0.002, 5, 5);
                translate([43, -10, 0]) cylinder(base_thickness + 0.002, 5, 5);
            }

            SquareOf(28, rotate = -45) {
                hull() {
                    translate([6, 0, 0]) cylinder(base_thickness + 0.002, 5, 5);
                    translate([22, 10, 0]) cylinder(base_thickness + 0.002, 5, 5);
                    translate([22, -10, 0]) cylinder(base_thickness + 0.002, 5, 5);
                }
            }

            rotate(45)
            SquareOf(28, rotate = -45) {
                hull() {
                    translate([10, 2.5, 0]) cylinder(base_thickness + 0.002, 5, 5);
                    translate([10, -2.5, 0]) cylinder(base_thickness + 0.002, 5, 5);
                    translate([24, 5.5, 0]) cylinder(base_thickness + 0.002, 5, 5);
                    translate([24, -5.5, 0]) cylinder(base_thickness + 0.002, 5, 5);
                }
            }
        }
    }
}

BasePlate();

//d();

base_width = 120;
base_length = 120;

if ($show_parts) {
    // FC
    translate([0,0,base_thickness + 1]) TMotorF7Pro();
    translate([0, 0, 10]) rotate([0, 180]) SquareOf(30) HexScrew(12);

    // Crossfire
    translate([-70, 0, 3]) Crossfire();

    // GPS
    translate([45, 0, 120]) GPS();
}

