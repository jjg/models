// 8" = 203.2mm

WALL_THICKNESS = 3;
LIP = 25;   // ~1"
HEIGHT = 75; // ~3"

ID = 205;
OD = ID + WALL_THICKNESS*2;
LIP_OD = OD + LIP*2;

$fn=50;

/*
// front 
resize([0,0,0]){
    difference(){
        union(){
            // main body
            cylinder(r=OD/2,h=HEIGHT);

            // lip
            cylinder(r=LIP_OD/2,h=WALL_THICKNESS);
        }
        
        // hole
        translate([0,0,-1]){
            cylinder(r=ID/2, h=HEIGHT+2);
        }
        
        // delete half
        translate([-LIP_OD/2,-LIP_OD/2,-1]){
            cube([LIP_OD,LIP_OD/2,HEIGHT+2]);
        }
    }
}

// sides
translate([-(ID/2)-WALL_THICKNESS,-70,HEIGHT/2]){
    difference(){
        rotate([-30,0,0]){
            cube([WALL_THICKNESS,75,HEIGHT]);
            translate([-LIP,0,0]){                
                cube([LIP,75,WALL_THICKNESS]);
            }
        }
        translate([-1,67,-HEIGHT/2]){
            cube([WALL_THICKNESS*2,75,HEIGHT*2]);
        }
        translate([-1,0,HEIGHT/2]){
            cube([WALL_THICKNESS*2,75,HEIGHT]);
        }
    }
}

translate([ID/2,-70,HEIGHT/2]){
    difference(){
        rotate([-30,0,0]){
            cube([WALL_THICKNESS,75,HEIGHT]);
            translate([WALL_THICKNESS,0,0]){                
                cube([LIP,75,WALL_THICKNESS]);
            }
        }
        translate([-1,67,-HEIGHT/2]){
            cube([WALL_THICKNESS*2,75,HEIGHT*2]);
        }
        translate([-1,0,HEIGHT/2]){
            cube([WALL_THICKNESS*2,75,HEIGHT]);
        }
    }
}
*/

// back
translate([-190/2,-70-WALL_THICKNESS,HEIGHT/2]){
    cube([190,WALL_THICKNESS,15]);
    translate([-LIP,-LIP+WALL_THICKNESS,0]){
        cube([190+(LIP*2),LIP,WALL_THICKNESS]);
    }
    
    /*
    translate([0,0,0]){
        rotate([0,0,8]){
            cube([WALL_THICKNESS,75,HEIGHT/2]);
            translate([-LIP,0,0]){
                cube([LIP,75,WALL_THICKNESS]);
            }
        }
    }

    translate([190,0,HEIGHT/2]){
        rotate([0,180,-8]){
            cube([WALL_THICKNESS,75,HEIGHT/2]);
            translate([-LIP,0,(HEIGHT/2)-WALL_THICKNESS]){
                cube([LIP,75,WALL_THICKNESS]);
            }
        }
    }
    */
}