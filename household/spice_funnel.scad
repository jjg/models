// ID: 30.71
// OD: 36.47
// big ID: 50
// tube in mouth: 15
// overall height: 50

OVERALL_HEIGHT = 50;
EXIT_DIAMETER = 30;
EXIT_LENGTH = 15;
ENTRANCE_DIAMETER = 60;
WALL_THICKNESS = 2;

$fn=100;

difference(){
    union(){
        cylinder(r=EXIT_DIAMETER/2,h=OVERALL_HEIGHT);
        
        translate([0,0,EXIT_LENGTH]){
            cylinder(r1=EXIT_DIAMETER/2, r2=ENTRANCE_DIAMETER/2, h=OVERALL_HEIGHT-EXIT_LENGTH);
        }
        
        translate([0,0,OVERALL_HEIGHT-WALL_THICKNESS]){
            //cube([ENTRANCE_DIAMETER,ENTRANCE_DIAMETER,WALL_THICKNESS]);
            cylinder(r=(ENTRANCE_DIAMETER+(WALL_THICKNESS*2))/2,h=WALL_THICKNESS);
        }
    }
    
    cylinder(r=(EXIT_DIAMETER/2) - (WALL_THICKNESS/2),h=OVERALL_HEIGHT);
    
    translate([0,0,EXIT_LENGTH]){
        cylinder(r1=(EXIT_DIAMETER/2) - (WALL_THICKNESS/2), r2=(ENTRANCE_DIAMETER/2) - (WALL_THICKNESS/2), h=OVERALL_HEIGHT-EXIT_LENGTH);
    }
}