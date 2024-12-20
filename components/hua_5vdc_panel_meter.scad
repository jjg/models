
module hua_5vdc_panel_meter(CUT_MOUNTING_HOLES=false){

    /*

    HUA 5vdc Panel Meter

    */

    BODY_DIAMETER = 53;   // ~2"
    BODY_LENGTH = 37; // ~1.5"
    FACE_DIAMETER = 65.53; // ~2.5"
    FACE_LENGTH = 4.1; // ~0.16"
    INNER_FACE_DIAMETER = 50.77; // ~2"
    INNER_FACE_LENGTH = 1.91; //~0.075
    TERMINAL_DIAMETER = 3.97; // ~0.15"
    TERMINAL_LENGTH = 8.81; // ~.35"
    TERMINAL_X_OFFSET = 15;
    TERMINAL_Y_OFFSET = 10;
    TERMINAL_SPACING = 30;
    MOUNTING_HOLE_DIAMETER = 3.5; // ~0.131, M3 cap head fits nicely
    MOUNTING_HOLE_OFFSET = 3; // roughly

    // If set to "true", this will add posts to the model
    // that will make mounting holes in another object
    // that the module is "differenced()" with.
    //CUT_MOUNTING_HOLES = true;

    difference(){
        
        // Body
        union(){
            cylinder(r=BODY_DIAMETER/2,h=BODY_LENGTH);
            translate([0,0,BODY_LENGTH]){
                cylinder(r=FACE_DIAMETER/2,h=FACE_LENGTH);
                translate([0,0,FACE_LENGTH]){
                    cylinder(r=INNER_FACE_DIAMETER/2,h=INNER_FACE_LENGTH);
                }
            }
        }
        
        if (!CUT_MOUNTING_HOLES){
            // Mounting holes
            rotate([0,0,-30]){  // Needed to tweak this back so first hole is at 12:00.
                y = 360/3;
                for (i=[1:3]){
                    z = y*i;
                    rotate([0,0,z]){
                        translate([(FACE_DIAMETER/2)-MOUNTING_HOLE_OFFSET,0,BODY_LENGTH]){
                            #cylinder(r=MOUNTING_HOLE_DIAMETER/2,h=FACE_LENGTH);
                        }
                    }
                }
            }
        }
    }

    if (CUT_MOUNTING_HOLES){
        // Mounting holes
        rotate([0,0,-30]){  // Needed to tweak this back so first hole is at 12:00.
            y = 360/3;
            for (i=[1:3]){
                z = y*i;
                rotate([0,0,z]){
                    translate([(FACE_DIAMETER/2)-MOUNTING_HOLE_OFFSET,0,0]){
                        cylinder(r=MOUNTING_HOLE_DIAMETER/2,h=BODY_LENGTH+FACE_LENGTH);
                    }
                }
            }
        }
    }
    // Terminals
    translate([-TERMINAL_X_OFFSET,TERMINAL_Y_OFFSET,-TERMINAL_LENGTH]){
        cylinder(r=TERMINAL_DIAMETER/2,h=TERMINAL_LENGTH);
        translate([TERMINAL_SPACING,0,0]){
            cylinder(r=TERMINAL_DIAMETER/2,h=TERMINAL_LENGTH);
        }
    }
}

$fn=50;

/*
// Example
difference(){
    cube([75,75,50]);
    translate([2.5,2.5,0]){
        cube([70,70,47]);
    }
    translate([75/2,75/2,50-36]){
        #hua_5vdc_panel_meter(true);
    }
}
*/