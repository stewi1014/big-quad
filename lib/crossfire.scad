use <core.scad>

// length, width, height;
crossfire_size = [55.5, 31.0, 12.5];
plug_hole = [7, 23, 9];

antenne_plug_radius = 5.2 / 2;
antenne_seperation = 18.66 - antenne_plug_radius * 2;
antenne_length = 8;

module CrossfireBox(pad = 0) {
    translate([-crossfire_size[0]/2, -crossfire_size[1]/2])
        PaddedCube(crossfire_size, pad);
}

module Crossfire() {
    color("blue")
    difference() {
        CrossfireBox(pad = 0);

        translate([crossfire_size[0]/2 + 0.001 - plug_hole[0], -plug_hole[1]/2, (crossfire_size[2] - plug_hole[2])/2])
        cube(plug_hole);
    }
        
    translate([-crossfire_size[0]/2, 0]) {
        translate([0, antenne_seperation/2, crossfire_size[2]/2])
        rotate([0, -90]) 
        cylinder(8,antenne_plug_radius, antenne_plug_radius, center = false);

        translate([0, -antenne_seperation/2, crossfire_size[2]/2])
        rotate([0, -90]) 
        cylinder(8,antenne_plug_radius, antenne_plug_radius, center = false);
    }
}

Crossfire();