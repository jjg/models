// Length in inches
LENGTH_IN_INCHES = 6.75; //[::float]

// Width in inches
WIDTH_IN_INCHES = 5.25; //[::float]


module __Customizer_Limit__ () {}  // Don't expose the variables below to the customizer.

// Other parameters (usually requires no modification).
LENGTH = in_to_mm(LENGTH_IN_INCHES);
DIAMETER = in_to_mm(WIDTH_IN_INCHES);
HEIGHT = 10;
WIDTH = 3;
CLAMP_LENGTH = 10;
CLAMP_WIDTH = 18;
CLAMP_GAP = 10;
SCREW_SHAFT_DIAMETER = 3.5;

function in_to_mm(inches) = inches * 25.4;

$fn=100;

// inner hoop
difference(){
    scale([1, (LENGTH - 2)/(DIAMETER - 2), 1]){
        cylinder(r=(DIAMETER/2)-2, h=HEIGHT);
    }
    scale([1,(LENGTH - (WIDTH+2))/(DIAMETER - (WIDTH + 2)),1]){
        cylinder(r=(DIAMETER/2)-(WIDTH+2), h=HEIGHT);
    }
}

// outer hoop
difference(){
    union(){

        // hoop
        scale([1,LENGTH/DIAMETER,1]){
            cylinder(r=DIAMETER/2, h=HEIGHT);
        }

        // clamp block
        // TODO: Figure out why we need that -2 on the Y axis
        translate([-(CLAMP_WIDTH/2),(LENGTH/2)-2.5,0]){
            difference(){
                cube([CLAMP_WIDTH,CLAMP_LENGTH,HEIGHT]);
            }
        }
    }

    union(){

        // hoop hole
        scale([1,(LENGTH - WIDTH)/(DIAMETER - WIDTH),1]){
            cylinder(r=(DIAMETER - WIDTH)/2, h=HEIGHT);
        }
    
        // clamp block holes
        translate([-(CLAMP_LENGTH/2),(LENGTH/2),0]){

            // clamp block gap
            translate([(CLAMP_LENGTH/2)-(CLAMP_GAP/2),-WIDTH,0]){
                cube([CLAMP_GAP,CLAMP_GAP+CLAMP_LENGTH+WIDTH,HEIGHT]);
            }

            // screw holes
            translate([-(CLAMP_WIDTH/2),(CLAMP_LENGTH/2) - (SCREW_SHAFT_DIAMETER/2),HEIGHT/2]){
                rotate([0,90,0]){
                    cylinder(r=SCREW_SHAFT_DIAMETER/2,h=CLAMP_WIDTH*2);
                }
            }
        }
    }
}
