include <../components/led.scad>

OPENING_RADIUS = 29;    // Probably 30 but it's ceramic and there's glue so...
COVER_RADIUS = 35;      // Radius of the original battery/light holder.
COVER_DEPTH = 1.25;
MAX_DEPTH = 120;        // The max depth at the opening radius (roughly).

$fn=50;
difference(){
    union(){
        cylinder(r=OPENING_RADIUS/2,h=5);
        cylinder(r=COVER_RADIUS/2,h=COVER_DEPTH);
    }
    
    cylinder(r=12/2,h=2);
    translate([0,0,2]){
        #led(10,13.7,1);
    }
    
    translate([0,-3,0]){
        #cube([20,6,3]);
    }
}

