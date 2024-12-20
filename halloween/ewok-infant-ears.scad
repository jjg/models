// Ewok ear formers
// Foam head ball diameter: ~2.8" (71.12mm)

HEAD_DIAMETER = 71.12;
HEIGHT = 25; //62;
WIDTH = 25; //75;
DEPTH = 5;//10;
POST_HEIGHT = 25;
POST_WIDTH = 10;
POST_DEPTH = 2.5;

$fn=50;

// Visible ear
difference(){
    union(){
        translate([-8,0,0]){
            cylinder(r=WIDTH/2,h=DEPTH);
        }
        translate([-8,-WIDTH/2,0]){
            cube([HEIGHT, WIDTH, DEPTH]);   
        }
    }
 
    translate([40,0,5]){
        sphere(r=HEAD_DIAMETER/2);
    }
}

translate([0,0,POST_DEPTH]){
    rotate([0,90,0]){
        cylinder(r1=POST_DEPTH,r2=POST_DEPTH/3,h=POST_HEIGHT);
    }
}
/*
// Mounting Post
translate([HEIGHT,(WIDTH/2)-(POST_WIDTH/2),0]){
    cube([POST_HEIGHT, POST_WIDTH, POST_DEPTH]);
}
*/