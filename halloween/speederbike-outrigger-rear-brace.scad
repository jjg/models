/*
    Speederbike ...outrigger? braces
*/

TOLERANCE = 2;
MIN_WALL_THICKNESS = 10;

LENGTH = 304.8;                 // 12"
WIDTH = 50;
HEIGHT = 75; //25.4;

PIPE_OD = 33.56;                // 1" PVC measured OD, not even close to 1"
PIPE_INSIDE_SPACING = 234.95;   // 9.25"
TOP_TUBE_DIAMETER = 22.61;
TOP_TUBE_SLOT = 56; //54.19;
TOP_TUBE_GAP = 15;
BOLT_DIAMETER = 8;              // slightly larger than 1/4"

$fn=50;

difference(){
    translate([0,0,-(PIPE_OD+TOLERANCE)-MIN_WALL_THICKNESS]){
        cube([LENGTH,WIDTH,HEIGHT]);
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
        translate([-PIPE_OD*0.80,WIDTH/2,-PIPE_OD]){
            cylinder(r=BOLT_DIAMETER/2,h=HEIGHT+2);
        }
        translate([PIPE_OD,WIDTH/2,-PIPE_OD]){
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
        translate([-PIPE_OD,WIDTH/2,-PIPE_OD]){
            cylinder(r=BOLT_DIAMETER/2,h=HEIGHT+2);
        }
        translate([PIPE_OD*0.80,WIDTH/2,-PIPE_OD]){
            cylinder(r=BOLT_DIAMETER/2,h=HEIGHT+2);
        }
    }
    
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
    
    // cut-out excess above pipes
    translate([-1,-1,0]){
        cube([PIPE_OD*2.5+1,WIDTH+2,HEIGHT]);
    }
    translate([LENGTH-(PIPE_OD*2.5),-1,0]){
        cube([PIPE_OD*2.5+1,WIDTH+2,HEIGHT]);
    }
}