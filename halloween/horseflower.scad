VERSION = "MARK 1";
MOUNTING_HOLE_DIAMETER = 26; // head: 22mm, butt: 26mm
PLUG_LENGTH = 10;
PETAL_THICKNESS = 3;

$fn = 50;

// mounting plug
difference(){
    cylinder(r = MOUNTING_HOLE_DIAMETER / 2, h = PLUG_LENGTH);
    
    translate([-(MOUNTING_HOLE_DIAMETER / 4), 0, PLUG_LENGTH - 1]){
        linear_extrude(5){
            #text(VERSION, size=2);
        }
    }
}

// flower petals
PETAL_COUNT = 5;
for(a = [1:PETAL_COUNT]){
    rotate([0,0,a * (360 / PETAL_COUNT)]){
        translate([MOUNTING_HOLE_DIAMETER * .95,0,0]){
            resize(newsize = [MOUNTING_HOLE_DIAMETER * 1.30, MOUNTING_HOLE_DIAMETER * .7, PETAL_THICKNESS]){
                cylinder(r = MOUNTING_HOLE_DIAMETER / 2, h = PETAL_THICKNESS);
            }
        }
    }
}

/*
// dome (print separately?)
difference(){
    sphere(r = MOUNTING_HOLE_DIAMETER / 2);
    
    cylinder(r = MOUNTING_HOLE_DIAMETER / 2, h = MOUNTING_HOLE_DIAMETER / 2);        
}
*/
