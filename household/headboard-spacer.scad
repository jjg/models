// 20x20x35

/*
    A thing that snaps to the back of our headboard
    because it can't be against the wall due to the
    kickboard.
    
    The bars it will snap to are about 20mmx20mm, and
    the distance the kickboard & trim sticks-out is 
    about 35mm.
*/
PART_HEIGHT = 20;

POST_LENGTH = 20;
POST_WIDTH = 20;
WALL_GAP = 35;
CLIP = 5;

TOLERANCE = 1;
WALL_THICKNESS = 3;


difference(){
    
    cube([WALL_GAP+WALL_THICKNESS+POST_LENGTH+CLIP,POST_WIDTH+(WALL_THICKNESS*2),PART_HEIGHT]);
    
    // post cutout
    translate([WALL_GAP+WALL_THICKNESS,WALL_THICKNESS-(TOLERANCE*.5),-TOLERANCE]){
        cube([POST_LENGTH+TOLERANCE,POST_WIDTH+TOLERANCE,PART_HEIGHT+(TOLERANCE*2)]);
    }
    
    // clip cutout
    translate([WALL_GAP+WALL_THICKNESS+(POST_LENGTH*1.25),WALL_THICKNESS-(TOLERANCE*.5),-TOLERANCE]){
        rotate([0,0,45]){
            cube([POST_LENGTH*.75,POST_WIDTH*.75,PART_HEIGHT+(TOLERANCE*2)]);
        }
    }
}