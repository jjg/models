BODY_LENGTH = 80;
BODY_WIDTH = 45;
BODY_HEIGHT = 15;

BATTERY_BOX_LENGTH = 65;
BATTERY_BOX_WIDTH = 28;
BATTERY_BOX_HEIGHT = 15;

SWAB_DIAMETER = 2.3;
SWAB_LENGTH = 150;

difference() {
    
    // Body
    cube([BODY_LENGTH,BODY_WIDTH,BODY_HEIGHT]);
    
    // Subtrackt 
    translate([7,9,3]){
        #cube([BATTERY_BOX_LENGTH, BATTERY_BOX_WIDTH, BATTERY_BOX_HEIGHT]);
    }
    
    translate([0,0,0]){
        rotate([-10,30,10]){
            translate([0,0,-100]){
                #cylinder(r=SWAB_DIAMETER/2, h=SWAB_LENGTH,$fn=50);
            }
        }
    }
    
    translate([0,BODY_WIDTH,0]){
        rotate([10,30,-10]){
            translate([0,0,-100]){
                #cylinder(r=SWAB_DIAMETER/2, h=SWAB_LENGTH,$fn=50);
            }
        }
    }
    
    translate([BODY_LENGTH,0,0]){
        rotate([-10,-30,-10]){
            translate([0,0,-100]){
                #cylinder(r=SWAB_DIAMETER/2, h=SWAB_LENGTH,$fn=50);
            }
        }
    }
    
    translate([BODY_LENGTH,BODY_WIDTH,0]){
        rotate([10,-30,10]){
            translate([0,0,-100]){
                #cylinder(r=SWAB_DIAMETER/2, h=SWAB_LENGTH,$fn=50);
            }
        }
    }
}