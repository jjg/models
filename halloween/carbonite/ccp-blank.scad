/*
Carbonite control panels filler panel

1" = 25.4mm

*/

LENGTH_IN  = 7.9;
BASE_LENGTH = LENGTH_IN * 25.4; //300;
BASE_WIDTH = 150;
BASE_HEIGHT = 50;

WALL_THICKNESS = 3;

color("grey")
difference(){
    
    // panel base and frames
    cube([BASE_LENGTH,BASE_WIDTH,WALL_THICKNESS]);
    
    // mounting holes
    mounting_bolt_shaft_diameter = 5;
    translate([7,7,-1]){
        cylinder(r=mounting_bolt_shaft_diameter/2,h=WALL_THICKNESS*3);
    }
    translate([BASE_LENGTH-7,7,-1]){
        cylinder(r=mounting_bolt_shaft_diameter/2,h=WALL_THICKNESS*3);
    }
    translate([BASE_LENGTH-7,BASE_WIDTH-7,-1]){
        cylinder(r=mounting_bolt_shaft_diameter/2,h=WALL_THICKNESS*3);
    }
    translate([7,BASE_WIDTH-7,-1]){
        cylinder(r=mounting_bolt_shaft_diameter/2,h=WALL_THICKNESS*3);
    }
}