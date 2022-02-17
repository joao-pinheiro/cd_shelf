wall_width = 0.6; // slicer setting

margin = 2; // total margin for CD width
cd_thickness = 10.25 + margin;
cd_width = 125 + (margin/2) + (wall_width *2);
cd_height = 125;
spacing = 0.2; // space between cd's
gap_depth = 10; // depth of the fold between cd's

count = 9;  // cd capacity - 1


module rack() {
    for ( i = [0 : count] ){
        y = i*(cd_thickness + spacing);
        translate([0,y,0]) cube([cd_width, cd_thickness, cd_height]);
    }

    y = count*(cd_thickness + spacing) + cd_thickness;
    translate([gap_depth,0,0]) cube([cd_width - (gap_depth*2), y, cd_height]);
}

module hole() {
    back_border = 10;
    y = count*(cd_thickness + spacing) + cd_thickness;    
    translate([back_border+gap_depth,back_border,0]) cube([cd_width - (gap_depth*2) -back_border*2, y-back_border*2, cd_height]);    
}

difference() {
    rack();
    hole();
}