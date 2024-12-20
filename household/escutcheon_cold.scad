// OD = 2.5", ID = 1", length = ~1"
// 1" == 25.4mm, so
OD = 80; //63.5;
ID = 25.75;
SHELL = 3;

// Length is different for the hot and cold sides.
// HOT
//LENGTH = 30; //25.5;
// COLD
LENGTH = 35;

FASTENER_HEAD = 6;
FASTENER_SHAFT = 3.5;

$fn=100;

// split in half
difference(){
    
    // whole part
    difference(){
        
        // outside
        cylinder(r=OD/2, h=LENGTH);
        
        // hole
        cylinder(r=ID/2, h=LENGTH);
        
        // inside
        cylinder(r=(OD/3)-SHELL, h=(LENGTH-SHELL));
        
        // fastener holes
        translate([-OD/2,-OD/3,FASTENER_SHAFT*2]){
            rotate([0,90,0]){
                cylinder(r=FASTENER_SHAFT/2, h=OD/1.5);
            }
        }
        
        translate([-OD/2,OD/3,FASTENER_SHAFT*2]){
            rotate([0,90,0]){
                cylinder(r=FASTENER_SHAFT/2, h=OD/1.5);
            }
        }
        
        // fastener head countersinks
        translate([-OD/2.5,-OD/3,FASTENER_SHAFT*2]){
            rotate([0,90,0]){
                cylinder(r=FASTENER_HEAD/2, h=OD/4);
            }
        }
        
        translate([-OD/2.5,OD/3,FASTENER_SHAFT*2]){
            rotate([0,90,0]){
                cylinder(r=FASTENER_HEAD/2, h=OD/4);
            }
        }
        
        // nut traps
        translate([5,-(OD/3)-.7,FASTENER_SHAFT*2]){
            // center on axis
            translate([-2.45/2,-5.5/2,-5.75/2]){
                #cube([2.5,7,5.75]);
            }
        }
        
        translate([5,(OD/3)-1.5+.7,FASTENER_SHAFT*2]){
            // center on axis
            translate([-2.45/2,-5.5/2,-5.75/2]){
                #cube([2.5,7,5.75]);
            }
        }
    }
        
    // spit it
    translate([-OD,-(OD/2),0]){
        #cube([OD,OD,LENGTH]);
    }
}