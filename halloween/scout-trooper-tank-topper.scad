/*
    Scout Trooper tank topper
*/

$fn=70;

difference(){
    
    // base board
    hull(){
        difference(){
            cylinder(r=95/2,h=3);
            translate([-(95/2),-(95/2),-1]){
                cube([95,95/2,5]);
            }
        }
        
        // base bar
        translate([-(120/2)-10,-90+(95/2),0]){
            cube([120,10,3]);
        }
        
        // left bar
        translate([-(120/2)-10,-90+(95/2),0]){
            cube([20,20,3]);
        }
    }
    
    // button hole
    translate([-(120/2)+10,-(95/2)+20,-1]){
        cylinder(r=10,h=5);
        translate([10,0,0]){
            cylinder(r=10,h=5);
        }
        translate([0,-10,0]){
            cube([10,20,5]);
        }
    }
}

// knob
translate([0,10,3]){
    cylinder(r=50/2,h=2);
    translate([-2,-25,0]){
        cube([4,50,10]);
    }
}

// heatsink
translate([0,-(95/2)+5,3]){
    translate([6,0,0]){
        cube([44,10,2]);
    }
    
    for(a = [1:8]){
        translate([6*a,0,0]){
            cube([2,10,10]);
        }
    }   
}

// boxes
difference(){
    union(){
        translate([120/7,-(95/2)+15,3]){
            cube([10,10,7]);
            translate([-1,10,0]){
                rotate([0,90,0]){
                    cylinder(r=7,h=12);
                }
            }
        }
        translate([120/3.5,-(95/2)+15,3]){
            cube([10,10,7]);
            translate([-1,10,0]){
                rotate([0,90,0]){
                    cylinder(r=7,h=12);
                }
            }
        }
    }
    
    translate([0,-50,-5]){
        cube([50,50,5]);
    }
}
    