BAR_WIDTH = 20;
BAR_LENGTH = 150; // 6" 152.4
SINK_EDGE = 30; // 1.5" 38.1mm
OVERALL_WIDTH = 250;

// The hook.
module hook(){
    difference(){
        
        cube([BAR_LENGTH,BAR_WIDTH*2+SINK_EDGE,BAR_WIDTH]);
        
        translate([BAR_WIDTH,BAR_WIDTH,0]){
            
            cube([BAR_LENGTH,SINK_EDGE,BAR_WIDTH]);
            
            translate([BAR_WIDTH,SINK_EDGE,0]){
                cube([BAR_LENGTH,BAR_WIDTH,BAR_WIDTH]);
            }
        }
    }

    // The lower brace
    translate([BAR_LENGTH/2,BAR_WIDTH,0]){
        #cube([BAR_WIDTH,BAR_WIDTH+15,BAR_WIDTH]);
    }
}
/*
// Main hook & bar.
hook();

// The part the towel hangs on.
translate([BAR_LENGTH,BAR_WIDTH/2,0]){
    difference(){
        
        cylinder(r=BAR_WIDTH/2,h=OVERALL_WIDTH);
        
        translate([0,0,OVERALL_WIDTH-BAR_WIDTH]){
            difference(){
                cylinder(r=BAR_WIDTH/2,h=BAR_WIDTH);
                cylinder(r=(BAR_WIDTH/2)*.75,h=BAR_WIDTH);
            }
        }
    }
}
*/

// Secondary hook.
translate([0,100,0]){
    difference(){
        union(){
            hook();
            translate([BAR_LENGTH,BAR_WIDTH/2,0]){ 
                cylinder(r=BAR_WIDTH/2,h=BAR_WIDTH);
            }
        }
        translate([BAR_LENGTH,BAR_WIDTH/2,0]){ 
            cylinder(r=(BAR_WIDTH/2)*.75,h=BAR_WIDTH);
        }
    }
}