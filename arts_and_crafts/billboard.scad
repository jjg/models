// Sign board
BOARD_LENGTH = 76.2;
BOARD_WIDTH = 38.1; //25.4;
BOARD_DEPTH = 5;    // This is a guess
WOOD_TOLERANCE = 1;

SIGN_BORDER = 3;
POST_HEIGHT = BOARD_LENGTH;
POST_DIAMETER = SIGN_BORDER * 2;
BASE_LENGTH = BOARD_LENGTH / 2;
BASE_WIDTH = BOARD_LENGTH / 2;//BOARD_WIDTH / 2;
BASE_DEPTH = BOARD_DEPTH * 2;
PLASTIC_TOLERANCE = 1;

// Sign top
difference(){
    
    union(){
        // Sign board holder
        cube([BOARD_LENGTH + (SIGN_BORDER * 2), BOARD_WIDTH + (SIGN_BORDER * 2), BOARD_DEPTH * 2]);
        
        // Lights
        translate([0, -SIGN_BORDER * 2,0]){
            
            // Connectors
            NUMBER_OF_CONNECTORS = 5;
            CONNECTOR_WIDTH = BOARD_LENGTH / NUMBER_OF_CONNECTORS;
            for (i = [0:NUMBER_OF_CONNECTORS]){
                translate([(i * CONNECTOR_WIDTH)+0.5, 0,0]){ // This +0.5 is weird but...?
                    cube([5,SIGN_BORDER * 2,BOARD_DEPTH]);
                }
            }
            
            // Light bar
            cube([BOARD_LENGTH + (SIGN_BORDER * 2), SIGN_BORDER, BOARD_DEPTH * 3]);
            
            // Post
            translate([(BOARD_LENGTH + (SIGN_BORDER * 2)) / 2,SIGN_BORDER * 2,0]){
                rotate([90,0,0]){
                    cylinder(r=POST_DIAMETER,h=POST_HEIGHT);
                }
            }
        }
    }
    
    // Cutout for sign board
    translate([SIGN_BORDER-(WOOD_TOLERANCE/2), SIGN_BORDER-(WOOD_TOLERANCE/2), BOARD_DEPTH]){
        cube([BOARD_LENGTH+WOOD_TOLERANCE, BOARD_WIDTH+WOOD_TOLERANCE, BOARD_DEPTH]);
    }
    
    // Cut-off everything below the ground plane
    translate([0,-POST_HEIGHT,-POST_DIAMETER]){
        cube([BOARD_LENGTH + (SIGN_BORDER * 2), BOARD_WIDTH + (SIGN_BORDER * 2) + POST_HEIGHT, POST_DIAMETER]);
    }
}

// Base
// TODO: Remove translate() and rotate() for printing (just here for preview)
translate([0,BOARD_WIDTH + (SIGN_BORDER * 3),0]){
//translate([((BOARD_LENGTH + (SIGN_BORDER * 2)) / 2)-(BASE_LENGTH/2),-POST_HEIGHT+BASE_DEPTH, -BASE_WIDTH/2]){
    //rotate([90,0,0]){
        difference(){
            cube([BASE_LENGTH, BASE_WIDTH, BASE_DEPTH]);
            
            translate([BASE_LENGTH/2, (BASE_WIDTH/2)-(POST_DIAMETER/2), 0]){
                cylinder(r=POST_DIAMETER+(PLASTIC_TOLERANCE/2), BASE_DEPTH);
            }
        }
        // Constrain hole into "D" shape
        #cube([BASE_LENGTH, (BASE_WIDTH/2)-(POST_DIAMETER/2), BASE_DEPTH]);
    //}
//}
}