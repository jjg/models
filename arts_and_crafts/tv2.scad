// TODO: Get actual measurements of the image card.
CARD_LENGTH = 51;
CARD_WIDTH = 51;
CARD_DEPTH = 3;
BORDER = 3;
KNOB_DIAMETER = 3;

difference(){
    
    // Console
    union(){
        cube([CARD_LENGTH+(BORDER*2), CARD_WIDTH+(BORDER*2), CARD_DEPTH*3]);
    
        // This is a lazy way to make it thicker but will work for now
        translate([0,0,-CARD_DEPTH*3]){
            cube([CARD_LENGTH+(BORDER*2), CARD_WIDTH+(BORDER*2), CARD_DEPTH*3]);
            translate([CARD_LENGTH+BORDER,0,0]){
                cube([CARD_LENGTH/3, CARD_WIDTH+(BORDER*2), CARD_DEPTH*3]);
            }
        }
        
        
    }
    
    /*
    // Card opening
    translate([0,BORDER,BORDER]){
        #cube([CARD_LENGTH,CARD_WIDTH,CARD_DEPTH]);
    }
    */
    
    translate([BORDER,BORDER,BORDER]){
    
        // Card cutout
        cube([CARD_LENGTH,CARD_WIDTH,CARD_DEPTH]);

        // Frame cutout
        translate([0,0,CARD_DEPTH]){
            cube([CARD_LENGTH,CARD_WIDTH,CARD_DEPTH*2]);
        }
    }
}

// Frame corners
translate([0,0,CARD_DEPTH]){
    difference(){
        cube([CARD_LENGTH+(BORDER*2), CARD_WIDTH+(BORDER*2), CARD_DEPTH+1]);
        translate([BORDER,BORDER,0]){
            // View cutout
            color("blue"){
                translate([CARD_LENGTH/2,CARD_LENGTH/2,0]){
                    cylinder(r=CARD_LENGTH/1.5,h=CARD_DEPTH+1,$fn=50);
                }
            }
        }
    }
}

// Controls
translate([CARD_LENGTH+BORDER,0,0]){
    difference(){
        cube([CARD_LENGTH/3, CARD_WIDTH+(BORDER*2), CARD_DEPTH*3]);
        
        // Frame cutout
        translate([BORDER,BORDER,(CARD_DEPTH*2)+BORDER-1]){
            cube([(CARD_LENGTH/3)-(BORDER*2),CARD_WIDTH,CARD_DEPTH]);
            
            // Speaker grille
            translate([(((CARD_LENGTH/3)-(BORDER*2))/2)-(((CARD_LENGTH/3)-BORDER*2.5)/2),(CARD_WIDTH-BORDER)-(KNOB_DIAMETER*8),-BORDER]){
                #cube([(CARD_LENGTH/3)-BORDER*2.5,1,BORDER]);
                translate([0,-2,0]){
                    #cube([(CARD_LENGTH/3)-BORDER*2.5,1,BORDER]);
                    translate([0,-2,0]){
                        #cube([(CARD_LENGTH/3)-BORDER*2.5,1,BORDER]);
                        translate([0,-2,0]){
                            #cube([(CARD_LENGTH/3)-BORDER*2.5,1,BORDER]);
                            translate([0,-2,0]){
                                #cube([(CARD_LENGTH/3)-BORDER*2.5,1,BORDER]);
                            }
                        }
                    }
                }
            }
        }
    }
    
    // Knobs
    translate([BORDER+((CARD_LENGTH/3)/2)-KNOB_DIAMETER,(CARD_WIDTH-BORDER),(CARD_DEPTH*2)+BORDER-1.5]){
        cylinder(r=KNOB_DIAMETER,h=BORDER,$fn=25);
        translate([0,-KNOB_DIAMETER*3,0]){
            cylinder(r=KNOB_DIAMETER,h=BORDER,$fn=25);
        }
    }
}
