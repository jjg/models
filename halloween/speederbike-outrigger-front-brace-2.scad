/*

    speederbike outrigger front brace/winglet mount
    
*/

LENGTH = 340;//326;//304.8;
WIDTH = LENGTH/2;
HEIGHT = 50;//100;

PIPE_OD = 33.56;
PIPE_INSIDE_SPACING = 234.95;

BOLT_THREAD_LENGTH = 12;
BOLT_THREAD_DIAMETER = 4.1;
    

WINGLET_THICKNESS = 5;

TOLERANCE = 2;
$fn=40;

difference(){
    union(){
        linear_extrude(HEIGHT){
            polygon([[0,0],[LENGTH/2,WIDTH],[LENGTH,0]]);
        }
        // lower extension
        translate([0,-((PIPE_OD+TOLERANCE)/2)-5,0]){
            cube([LENGTH,PIPE_OD,HEIGHT]);
        }
        // nipples
        translate([(LENGTH/2)-(PIPE_INSIDE_SPACING/2),0,HEIGHT]){
            sphere(PIPE_OD/2);
        }
        translate([(LENGTH/2)+(PIPE_INSIDE_SPACING/2),0,HEIGHT]){
            sphere(PIPE_OD/2);
        }
        // other thing
        translate([LENGTH/2,WIDTH-(WIDTH/4),HEIGHT]){
            cylinder(r=PIPE_OD/2,h=40);
            translate([0,0,30]){
                cylinder(r=PIPE_OD/1.5,h=10);
            }
            translate([0,0,40]){
                sphere(PIPE_OD/2);
            }
        }
    }    
    
    // pipe holes
    translate([(LENGTH/2)-(PIPE_INSIDE_SPACING/2),0,-1]){
        cylinder(r=(PIPE_OD+TOLERANCE)/2,h=HEIGHT-2);            
    }
    translate([(LENGTH/2)+(PIPE_INSIDE_SPACING/2),0,-1]){
        cylinder(r=(PIPE_OD+TOLERANCE)/2,h=HEIGHT-2);            
    }
    
    // lower winglet indents
    translate([-15,0,0]){
        rotate([0,0,-45]){
            translate([-1,-15,-1]){
                cube([25,WIDTH/1.5,HEIGHT+2]);
            }
        }
    }
    translate([LENGTH-3,-15,0]){
        rotate([0,0,45]){
            translate([-1,-15,-1]){
                cube([25,WIDTH/1.5,HEIGHT+2]);
            }
        }
    }
    
    // mounting bolt holes
    // right large winglet
    translate([LENGTH/2.8,WIDTH-(WIDTH/4),HEIGHT/2]){
        rotate([0,90,-45]){
            cylinder(r=(BOLT_THREAD_DIAMETER+TOLERANCE)/2,h=BOLT_THREAD_LENGTH);
        }
    }
    translate([LENGTH/3.5,WIDTH-(WIDTH/2.5),HEIGHT-(HEIGHT/2)]){
        rotate([0,90,-45]){
            cylinder(r=(BOLT_THREAD_DIAMETER+TOLERANCE)/2,h=BOLT_THREAD_LENGTH);
        }
    }
    
    // right small winglet
    translate([LENGTH/6,WIDTH/4,HEIGHT/4]){
        rotate([0,90,-45]){
            cylinder(r=(BOLT_THREAD_DIAMETER+TOLERANCE)/2,h=BOLT_THREAD_LENGTH);
        }
    }
    translate([LENGTH/6,WIDTH/4,HEIGHT-(HEIGHT/4)]){
        rotate([0,90,-45]){
            cylinder(r=(BOLT_THREAD_DIAMETER+TOLERANCE)/2,h=BOLT_THREAD_LENGTH);
        }
    }
    
    // left large winglet
        translate([LENGTH-(LENGTH/2.8),WIDTH-(WIDTH/4),HEIGHT/2]){
            rotate([0,-90,45]){
                cylinder(r=(BOLT_THREAD_DIAMETER+TOLERANCE)/2,h=BOLT_THREAD_LENGTH);
            }
        }
        translate([LENGTH-(LENGTH/3.5),WIDTH-(WIDTH/2.5),HEIGHT-(HEIGHT/2)]){
            rotate([0,-90,45]){
                cylinder(r=(BOLT_THREAD_DIAMETER+TOLERANCE)/2,h=BOLT_THREAD_LENGTH);
            }
        }
    
    // left small winglet
    translate([LENGTH-(LENGTH/6),WIDTH/4,HEIGHT/4]){
        rotate([0,-90,45]){
            cylinder(r=(BOLT_THREAD_DIAMETER+TOLERANCE)/2,h=BOLT_THREAD_LENGTH);
        }
    }
    translate([LENGTH-(LENGTH/6),WIDTH/4,HEIGHT-(HEIGHT/4)]){
        rotate([0,-90,45]){
            cylinder(r=(BOLT_THREAD_DIAMETER+TOLERANCE)/2,h=BOLT_THREAD_LENGTH);
        }
    }
    
    
    // skeletonize
    translate([LENGTH/3.7,WIDTH/2,0]){
        rotate([0,0,-45]){
            translate([-1,-15,-1]){
                cube([25,WIDTH/2,HEIGHT+2]);
            }
        }
    }
    translate([LENGTH-(LENGTH/3.7)-15,(WIDTH/2)-16.5,0]){
        rotate([0,0,45]){
            translate([-1,-15,-1]){
                cube([25,WIDTH/2,HEIGHT+2]);
            }
        }
    }    
    
    translate([50,25,0]){
        rotate([0,0,-45]){
            translate([-1,0,-1]){
                cube([25,WIDTH/4.5,HEIGHT+2]);
            }
        }
    }
    translate([LENGTH-66,8,0]){
        rotate([0,0,45]){
            translate([-1,0,-1]){
                cube([25,WIDTH/4.5,HEIGHT+2]);
            }
        }
    }
    translate([LENGTH/2,0,-1]){
        rotate([0,0,45]){
            cube([75,75,HEIGHT+2]);
        }
    }
    translate([LENGTH/3,-WIDTH/10,-1]){
        rotate([0,0,45]){
            cube([40,40,HEIGHT+2]);
        }
    }
    translate([LENGTH-(LENGTH/3),-WIDTH/10,-1]){
        rotate([0,0,45]){
            cube([40,40,HEIGHT+2]);
        }
    }
    
    /*
    // Cut down to 1/4 height and drop bolt holes for test print
    translate([0,-(PIPE_OD+TOLERANCE)/2,HEIGHT/8]){
        #cube([LENGTH,WIDTH+(PIPE_OD+TOLERANCE)/2,HEIGHT*2]);
    }
    // right large winglet
    translate([LENGTH/2.8,WIDTH-(WIDTH/4),HEIGHT/8]){
        rotate([0,90,-45]){
            cylinder(r=(BOLT_THREAD_DIAMETER+TOLERANCE)/2,h=BOLT_THREAD_LENGTH);
        }
    }
    
    // right small winglet
    translate([LENGTH/6,WIDTH/4,HEIGHT/8]){
        rotate([0,90,-45]){
            cylinder(r=(BOLT_THREAD_DIAMETER+TOLERANCE)/2,h=BOLT_THREAD_LENGTH);
        }
    }
    
    // left large winglet
        translate([LENGTH-(LENGTH/2.8),WIDTH-(WIDTH/4),HEIGHT/8]){
            rotate([0,-90,45]){
                cylinder(r=(BOLT_THREAD_DIAMETER+TOLERANCE)/2,h=BOLT_THREAD_LENGTH);
            }
        }
    
    // left small winglet
    translate([LENGTH-(LENGTH/6),WIDTH/4,HEIGHT/8]){
        rotate([0,-90,45]){
            cylinder(r=(BOLT_THREAD_DIAMETER+TOLERANCE)/2,h=BOLT_THREAD_LENGTH);
        }
    }
    */
}