/*
    Bamboo piece measurements
    8.90x2.23
    
    NOTE: Print with a corner point down + support for best results.
*/

BAMBOO_WIDTH = 9;
BAMBOO_HEIGHT = 2.5;

L = BAMBOO_WIDTH * 2;//1.5;
W = L;
H = W;

SEPARATORS = false;

difference(){
    cube([L,W,H]);
    
    translate([-W/2,(W/2)-(BAMBOO_WIDTH/2),(H/2)-(BAMBOO_HEIGHT/2)]){
        cube([L*2,BAMBOO_WIDTH,BAMBOO_HEIGHT]);
    }
    
    translate([(W/2)+(BAMBOO_WIDTH/2),-(W/2),(H/2)-(BAMBOO_HEIGHT/2)]){
        rotate([0,0,90]){
            cube([L*2,BAMBOO_WIDTH,BAMBOO_HEIGHT]);
        }
    }
    
    translate([(W/2)-(BAMBOO_HEIGHT/2),(L/2)-(BAMBOO_WIDTH/2),L+(L/2)]){
        rotate([0,90,0]){
            cube([L*2,BAMBOO_WIDTH,BAMBOO_HEIGHT]);
        }
    }
}

// Optional separator
if(SEPARATORS){
    translate([(W/2)-(BAMBOO_HEIGHT/2),0,0]){
        #cube([BAMBOO_HEIGHT,W,H]);
    }
}
