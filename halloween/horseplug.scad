VERSION = "MARK 1";
MOUNTING_HOLE_DIAMETER = 22; // head: 22mm, butt: 26mm
PLUG_LENGTH = 10;

$fn = 100;

// mounting plug
difference(){
    union(){
        cylinder(r = MOUNTING_HOLE_DIAMETER / 2, h = PLUG_LENGTH);
        cylinder(r = MOUNTING_HOLE_DIAMETER / 1.5, h = PLUG_LENGTH/4);
    }
    
    translate([-(MOUNTING_HOLE_DIAMETER / 4), 0, PLUG_LENGTH - 1]){
        linear_extrude(5){
            #text(VERSION, size=2);
        }
    }
}