/*
    Speederbike outrigger mid brace
*/

TOLERANCE = 2;
MIN_WALL_THICKNESS = 10;

LENGTH = 90;//304.8;                 // 12"
WIDTH = 50;
HEIGHT = 75; //25.4;

TRIANGLE_LENGTH = 230;
TRIANGLE_WIDTH = 280;

PIPE_OD = 25; //33.56;                // 1" PVC measured OD, not even close to 1"
PIPE_INSIDE_SPACING = 234.95;   // 9.25"
TOP_TUBE_DIAMETER = 22.61;
TOP_TUBE_SLOT = 56; //54.19;
TOP_TUBE_GAP = 15;
BOLT_DIAMETER = 8;              // slightly larger than 1/4"

$fn=50;

difference(){
    
    union(){
        // clamp
        translate([0,0,-(PIPE_OD+TOLERANCE)-MIN_WALL_THICKNESS]){
            cube([LENGTH,WIDTH,HEIGHT]);
        }
        
        // triangle thing
        translate([(LENGTH/2)-(50/2),WIDTH,-PIPE_OD-MIN_WALL_THICKNESS-TOLERANCE]){
            
            linear_extrude(25){
            // core
            #polygon([[0,0],[0,280],[50,280],[50,0]]);
            
            // bottom leaf
            translate([(-200/2)+(50/2),0,0]){
                difference(){
                    polygon([[0,0],[(200/2),280],[200,0]]);
                    translate([35,0,0]){
                        polygon([[0,0],[50,190],[50,0]]);
                    };
                    translate([200-35-50,0,0]){
                        polygon([[0,0],[0,190],[50,0]]);
                    }
                }
            }
            
            // top leaf
            translate([-((40+85+40)/2)+(50/2),190,0]){
                difference(){
                    polygon([[0,0],[40,90],[85+40,90],[40+85+40,0]]);
                    translate([20,0,0]){
                        polygon([[0,0],[35,60],[40,60],[40,0]]);
                    }
                    translate([(40+85+40)-20-35,0,0]){
                        polygon([[0,0],[0,60],[35,0]]);
                    }
                }
            }
            }
        }
    }
    
    // pipe holders
    translate([(LENGTH/2)-(PIPE_INSIDE_SPACING/2),-1,-(PIPE_OD+TOLERANCE)/2]){
        rotate([-90,0,0]){
            cylinder(r=(PIPE_OD+TOLERANCE)/2,h=WIDTH+2);            
        }
        translate([-(PIPE_OD+TOLERANCE)/2,0,0]){
            cube([PIPE_OD+TOLERANCE,WIDTH+2,HEIGHT]);
        }
    
        // bolt holes
        translate([-PIPE_OD*0.80,WIDTH/4,-PIPE_OD]){
            cylinder(r=BOLT_DIAMETER/2,h=HEIGHT+2);
        }
        translate([PIPE_OD,WIDTH/4,-PIPE_OD]){
            cylinder(r=BOLT_DIAMETER/2,h=HEIGHT+2);
        }
        translate([-PIPE_OD*0.80,WIDTH-(WIDTH/4),-PIPE_OD]){
            cylinder(r=BOLT_DIAMETER/2,h=HEIGHT+2);
        }
        translate([PIPE_OD,WIDTH-(WIDTH/4),-PIPE_OD]){
            cylinder(r=BOLT_DIAMETER/2,h=HEIGHT+2);
        }
    }
    translate([(LENGTH/2)+(PIPE_INSIDE_SPACING/2),-1,-(PIPE_OD+TOLERANCE)/2]){
        rotate([-90,0,0]){
            cylinder(r=(PIPE_OD+TOLERANCE)/2,h=WIDTH+2);
        }
        translate([-(PIPE_OD+TOLERANCE)/2,0,0]){
            cube([PIPE_OD+TOLERANCE,WIDTH+2,HEIGHT]);
        }
        
        // bolt holes
        translate([-PIPE_OD,WIDTH/4,-PIPE_OD]){
            cylinder(r=BOLT_DIAMETER/2,h=HEIGHT+2);
        }
        translate([PIPE_OD*0.80,WIDTH/4,-PIPE_OD]){
            cylinder(r=BOLT_DIAMETER/2,h=HEIGHT+2);
        }
        translate([-PIPE_OD,WIDTH-(WIDTH/4),-PIPE_OD]){
            cylinder(r=BOLT_DIAMETER/2,h=HEIGHT+2);
        }
        translate([PIPE_OD*0.80,WIDTH-(WIDTH/4),-PIPE_OD]){
            cylinder(r=BOLT_DIAMETER/2,h=HEIGHT+2);
        }
    }
    
    /*
    // top-tube slot
    tt_min = TOP_TUBE_SLOT;    // TOP_TUBE_SLOT
    tt_max = 65;    // fresh measurement
    
    translate([(LENGTH/2)-(tt_max/2),-1,-1]){
        //cube([TOP_TUBE_SLOT,WIDTH+2,TOP_TUBE_DIAMETER+1]);
        
        linear_extrude(TOP_TUBE_DIAMETER+1){
            polygon([[0,0],[(tt_max-tt_min)/2,WIDTH+2],[tt_max-((tt_max-tt_min))/2,WIDTH+2],[tt_max,0]]);
        }
        
        // bolt holes
        translate([-tt_max/4,WIDTH/2,-TOP_TUBE_DIAMETER]){
            cylinder(r=BOLT_DIAMETER/2,h=HEIGHT);
        }
        translate([tt_max+(tt_max/4),WIDTH/2,-TOP_TUBE_DIAMETER]){
            cylinder(r=BOLT_DIAMETER/2,h=HEIGHT);
        }
    }
    
    // cut-out excess underneath
    translate([LENGTH/2,-1,-((PIPE_OD+TOLERANCE)-MIN_WALL_THICKNESS)-LENGTH/2.45]){
        rotate([-90,0,0]){
            cylinder(r=LENGTH/2,h=WIDTH+2);
        }
    }
    */
    
    // cut-out excess above pipes
    translate([-1,-1,-20.56]){
        cube([LENGTH+TOLERANCE,WIDTH+2,HEIGHT]);
    }
}