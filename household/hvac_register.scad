/*
    Original grate: 25"wx5"hx1/4"d
    
    Converted to mm: 635x127x6.35
*/

WIDTH = 317; //635;
DEPTH = 127;
HEIGHT = 6;

FRAME_WIDTH = 15;
//AIR_HOLE_SIZE = 10;

MOUNTING_SCREW_HEAD_DIAMETER = 8.4;
MOUNTING_SCREW_SHAFT_DIAMETER = 4;
MOUNTING_SCREW_TAPER_LENGTH = 3.5;
MOUNTING_SCREW_LENGTH = 30;

module screw_hole(){
    #cylinder(r=(MOUNTING_SCREW_SHAFT_DIAMETER)/2,h=MOUNTING_SCREW_LENGTH);
    #cylinder(r1=MOUNTING_SCREW_HEAD_DIAMETER/2,r2=MOUNTING_SCREW_SHAFT_DIAMETER/2,h=MOUNTING_SCREW_TAPER_LENGTH);
}

difference(){
    
    // Base panel
    cube([WIDTH, DEPTH, HEIGHT]);
    
    // Mounting holes
    translate([FRAME_WIDTH/2,FRAME_WIDTH/2,0]){
        screw_hole();
    }
    translate([FRAME_WIDTH/2,DEPTH-FRAME_WIDTH/2,0]){
        screw_hole();
    }
    translate([WIDTH-FRAME_WIDTH/2,DEPTH-FRAME_WIDTH/2,0]){
        screw_hole();
    }
    translate([WIDTH-FRAME_WIDTH/2,FRAME_WIDTH/2,0]){
        screw_hole();
    }
    
    // Air holes
    for(i=[1:8]){
        translate([FRAME_WIDTH, i*FRAME_WIDTH, -4]){
            rotate([45,0,0]){
                #cube([WIDTH/2-FRAME_WIDTH,DEPTH/15,HEIGHT*2]);
            }
        }
        
        translate([WIDTH-(WIDTH/2-FRAME_WIDTH)-FRAME_WIDTH, i*FRAME_WIDTH, -4]){
            rotate([45,0,0]){
                #cube([WIDTH/2-FRAME_WIDTH,DEPTH/15,HEIGHT*2]);
            }
        }
    }
    
    /*
    ROWS = (DEPTH-(FRAME_WIDTH/2)) / AIR_HOLE_SIZE;
    COLUMNS = (WIDTH-(FRAME_WIDTH/2)) / AIR_HOLE_SIZE;
    translate([(WIDTH+(FRAME_WIDTH/2))-(COLUMNS*AIR_HOLE_SIZE),(DEPTH+(FRAME_WIDTH/2))-(ROWS*AIR_HOLE_SIZE),-1]){
    //translate([FRAME_WIDTH+(AIR_HOLE_SIZE/2),FRAME_WIDTH+(AIR_HOLE_SIZE/2),-1]){
        for(y=[0:ROWS-1]){
            for (x=[0:COLUMNS-1]){
                translate([x*(AIR_HOLE_SIZE*1.1),y*(AIR_HOLE_SIZE*1.1),0]){
                    #cylinder(r=AIR_HOLE_SIZE/2,h=HEIGHT+2);
                }
            }
        }
    }
    */
}