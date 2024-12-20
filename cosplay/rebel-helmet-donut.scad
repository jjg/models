DIAMETER = 250;
HEIGHT = 65;
OPENING = 200;
BOTTOM_OPENING = 240;
WALL_THICKNESS = 10;

$fn=100;

difference(){
 
// Earpiece
translate([.5,-99,-5]){
    rotate([90,0,0]){
        cylinder(r=70,h=5);
        translate([0,0,5]){
            cylinder(r=50,h=5);
        }
    }
}

difference(){
    #cylinder(r=DIAMETER/2,h=HEIGHT);
        
    // inner opening
    // TODO: Uncomment this to print the donut
    //cylinder(r=BOTTOM_OPENING/2,h=HEIGHT-WALL_THICKNESS);
    
    // outer opening
    // TODO: Uncomment this when printing the donut
    translate([0,0,10]){
        //sphere(r=OPENING/2);
    }
    
    // bill angle cut
    translate([0,-DIAMETER/2,-WALL_THICKNESS*2]){
        rotate([0,-6,0]){
            cube([DIAMETER,DIAMETER,WALL_THICKNESS*2]);
        }
    }
}
}