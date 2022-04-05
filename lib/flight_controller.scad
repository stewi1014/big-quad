$fs = 0.01;

use <core.scad>

module FlightController(color = "blue", spacing = 30, diameter = 3, thickness = 1.6) {
    pad = 1.8;

    pad_radius = diameter / 2 + pad;

    color(color)
    difference() {
		hull() SquareOf(spacing) cylinder(thickness, pad_radius, pad_radius, center = false);

        translate([0, 0, thickness]) FlightControllerMounts(10, spacing, diameter);
    }
}

module FlightControllerMounts(length, spacing = 30, diameter = 3) {
    SquareOf(spacing) HexScrew(length, diameter);
}

module TMotorF7Pro() {
	board_thickness = 1.6;
	FlightController(spacing = 30, diameter = 4, thickness = board_thickness);
	
	size = 37.3;
	usb_width = 9;
	usb_offset = 19 - usb_width;

	translate([-(size/2) + usb_offset, (size/2) - 7.4, board_thickness])
	cube([9, 7.4, 3.4]);
}

module GPS() {
	color("blue")
	translate([0, 0, 1.2/2])
	cube([20, 20, 1.2], center = true);

	color("blue")
	translate([0, 0, -2.8/2])
	cube([18, 18, 2.8], center = true);

	color("orange")
	translate([0, 0, (1.2 + 6.33) / 2])
	cube([15, 15, 6.33], center = true);

	color("white")
	translate([10 - 4.2, -8.35/2, -3])
	cube([4.2, 8.35, 3]);

	color("white")
	translate([-10, -8.35/2, -3])
	cube([4.2, 8.35, 3]);
}

translate([40, 0, 0]) {
	FlightController();
	translate([0,0,1.6]) FlightControllerMounts(15);
}

GPS();
