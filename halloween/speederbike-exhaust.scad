/*
    speederbike rear exaust
    
    body diameter: 1.25"
    flange diameter: .25"
*/

WALL_THICKNESS = 3;
BODY_OD = 32;               // ~ 1.25"
FLANGE_OD = BODY_OD + 6.5;  // ~0.25"

HEIGHT = 25;                // ~2"

$fn=50;

difference(){
    union(){
        cylinder(r=BODY_OD/2, h=HEIGHT);
        cylinder(r=FLANGE_OD/2, h=WALL_THICKNESS);
    }

    translate([0,0,-1]){
        cylinder(r=(BODY_OD-(WALL_THICKNESS*2))/2, h=HEIGHT+2);
    }
}

translate([-BODY_OD/2,-BODY_OD/8,0]){
   cube([BODY_OD,BODY_OD/4,WALL_THICKNESS]);
}
