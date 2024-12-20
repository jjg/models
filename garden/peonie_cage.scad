/*

Tested print settings:
Layer Height: 0.4
Infill: 15% rectilinear
Filament Used: 595.28g

Second iteration settings:
Infill: 5% support cubic
Filament Used: 509.84g

These settings will get 2 cages out of a 1kg spool.
*/

BOTTOM_DIAMETER = 304; // 12"
TOP_DIAMETER = 203.2; // 8"
HEIGHT = 370; //381; // 15"
THICKNESS = 6.35; // 0.25"  12.7; // 0.5"
HOLE_DIAMETER = 60.8; // 2"

difference(){
    
    union(){
        cylinder(r1=BOTTOM_DIAMETER/2,r2=TOP_DIAMETER/2,h=HEIGHT);
    }
    
    translate([0,0,0]){
        cylinder(r1=(BOTTOM_DIAMETER/2)-THICKNESS,r2=(TOP_DIAMETER/2)-THICKNESS,h=HEIGHT);
    }
    
    
    
    y=360/8;
    
    
    // layers
    for (j=[1:10]){
        
        layer_hole_radius = (HOLE_DIAMETER / 2) - (j*0.5);
        
        layer_z = j * 67; //?
        
        rotate([0,0,layer_z]){
            translate([0,0,(HOLE_DIAMETER/1.8)*j]){
                
                // holes for layer
                for (i=[1:8]){
                    z=y*i;
                    rotate([0,0,z]){
                        translate([BOTTOM_DIAMETER/2,0,0]){
                            rotate([0,-90,0]){
                                cylinder(r=layer_hole_radius,h=THICKNESS*10);
                            }
                        }
                    }
                }
            }
        }
    }
}