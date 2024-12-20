/*

    WIP Joint for connecting two lenths of PVC pipe at adjustable angles.
    
    Print with pipe opening down for best bed adhesion, lowest pipe opening
    distortion and strongest teeth.  
    
    Lots of testing remains to get fitings and clearances correct, and also
    needs work on being properly parametric as well as field testing for 
    strength, durability, etc. (details in TODO's below).
    
    We've had good results printing this on its side (with the flat-end of the
    joint on the bed) at 30% infill.

*/

// TODO: Increase negative tooth depth, consider increasing tooth size, reducing tooth count
// TODO: Fix parametrics (maybe just don't resize anything but the pipe openings for now?)
// TODO: Extract rotate_about into a separate utility module file
// TOOD: Extract the bolt into a separate reusable module file
// TODO: Make bolt size more parametric

// TODO: Remove unused bolt code (no countersinks, etc.)


// Globals
TOLERANCE = 1;

// Rotates object around specified point
module rotate_about_pt(z, y, pt) {
    translate(pt)
        rotate([0, y, z])
            translate(-pt)
                children();   
}

// 3/8" bolt 
// l pareamter determines the overall length of the bolt
// t parameter increases dimensions to compensate for printer tolerance
module bolt(l, t){
    
    BOLT_LENGTH = l;
    HEAD_LENGTH = 14.2 + t;
    HEAD_WIDTH = 8 + t;
    HEAD_HEIGHT = 6 + t;
    SHAFT_DIAMETER = 10 + t;
    
    cylinder(r=SHAFT_DIAMETER/2,h=BOLT_LENGTH);
    translate([-HEAD_LENGTH/2,-HEAD_LENGTH/3.5,BOLT_LENGTH-HEAD_HEIGHT]){        
        cube([HEAD_LENGTH, HEAD_WIDTH, HEAD_HEIGHT]);
        rotate_about_pt(60,0,[HEAD_LENGTH/2,HEAD_WIDTH/2,0]){
            cube([HEAD_LENGTH, HEAD_WIDTH, HEAD_HEIGHT]);
            rotate_about_pt(60,0,[HEAD_LENGTH/2,HEAD_WIDTH/2,0]){
                cube([HEAD_LENGTH, HEAD_WIDTH, HEAD_HEIGHT]);
            }
        }
    }
}

// Adjustable joint for 1" PVC
// teeth parameter determines if this is the end with teeth
// count parameter determines the number of teeth
module pvc_joint_spur(count) {

    PIPE_OD = 33.5; //34; //25.5;
    WALL_THICKNESS = 13;
    OUTER_SHELL_OD = PIPE_OD+WALL_THICKNESS;
    JOINT_BOLT_LENGTH = 50; // ~2" ???
    PIPE_BOLT_LENGTH = 57;  // ~2.25" ???
    SOCKET_OD = 24;         // Diameter of socket used to tighten joint

    difference(){
        union(){
            
            // Main outer shell
            cylinder(r=OUTER_SHELL_OD/2, h=OUTER_SHELL_OD*1.6);
            
            // Joint
             translate([-OUTER_SHELL_OD/2,0,PIPE_OD*2.2]){
                rotate([0,90,0]){
                    cylinder(r=OUTER_SHELL_OD/2,h=OUTER_SHELL_OD);
                }
            }
            
            // Cylinder for the pipe bolt nut to tighten against
            translate([0,OUTER_SHELL_OD/2,PIPE_OD/2]){
                    rotate([90,0,0]){
                        cylinder(r=10,h=PIPE_OD);
                }
            }
        }        
        
        // Pipe opening
        //cylinder(r=(PIPE_OD+TOLERANCE)/2, h=PIPE_OD);
        // NOTE: Use 1/2" pipe for this part
        cylinder(r=(22+TOLERANCE)/2, h=PIPE_OD);
        
        // Pipe bolt hole
        // NOTE: "10" is kind of a magic number here, it will vary
        // depending on the size of the bolt head, which is fixed
        // for now but once this is fully parametric will need to change
        translate([0,PIPE_BOLT_LENGTH-(PIPE_OD/2)-10,PIPE_OD/2]){
                rotate([90,0,0]){             
                bolt(PIPE_BOLT_LENGTH, TOLERANCE);
            }
        }
        
        // Cut-aways
        translate([5,-OUTER_SHELL_OD/2,OUTER_SHELL_OD]){
            cube([PIPE_OD,OUTER_SHELL_OD,PIPE_OD*2]);
        }
        translate([-PIPE_OD-5,-OUTER_SHELL_OD/2,OUTER_SHELL_OD]){
            cube([PIPE_OD,OUTER_SHELL_OD,PIPE_OD*2]);
        }        
                
        // If this end has teeth, cut the bolt hole
        // and countersink the head
        /*
        if (teeth){
            
            // Joint bolt hole
            translate([26,0,PIPE_OD*2.2]){
                rotate([0,-90,0]){
                    bolt(JOINT_BOLT_LENGTH, TOLERANCE);
                }
            }
            
        } else {
        */
            // If this is the end without teeth, cut a 
            // hole for the bolt, a hole to countersink
            // the washer & nut and then grooves for the teeth
            
            // Joint bolt hole
            translate([5,0,PIPE_OD*2.2]){
                rotate([0,-90,0]){
                    bolt(JOINT_BOLT_LENGTH, TOLERANCE);
                }
            }
            /*
            // Joint nut & washer countersink
            // SOCKET_OD should accomodate putting a socket
            // on the nut to tighten the joint
            translate([-OUTER_SHELL_OD/3,0,PIPE_OD*2.2]){
                rotate([0,-90,0]){
                    cylinder(r=(SOCKET_OD+TOLERANCE)/2,h=PIPE_OD/2);
                }
            }            
            */
            // Grooves for the teeth
            translate([6.5,0,PIPE_OD*2.2]){                
                for(i=[0:count]){
                    rotate([i*(360/count),0,0]){
                        translate([0,-3.55,11.5]){
                            rotate([0,0,45]){
                                cube([5,5,OUTER_SHELL_OD/5]);
                            }
                        }
                    }
                }
            }  
        /*
        }
        */
    }

    // Teeth
    //if (teeth){
        translate([-3,0,PIPE_OD*2.2]){
            for(i=[0:count]){
                rotate([i*(360/count),0,0]){
                    translate([0,-3.55,12]){
                        rotate([0,0,45]){
                            cube([5,5,OUTER_SHELL_OD/6]);
                        }
                    }
                }
            }
        }
    //}
}

// Sample layout
pvc_joint_spur(count=16);

/*
// Two-way joint
color("blue"){
    translate([10,0,149.5]){
        rotate([180,0,0]){
            rotate([0,0,180]){
                pvc_joint(teeth=true, count=20);
            }
        }
    }
}
*/

/*
// Ruler
translate([25,0,0]){
    cube([10,10,127.5]);
}
*/





