difference(){
    union(){
        // spine of handle
        translate([-.9,-0.4,0]){
            resize([0,2.6,0]){
                rotate([0,90,0]){
                    cylinder(r=0.8,h=6.48,$fn=50);
                }
            }
        }
        
        // finger guard shell
        translate([0,-1.2,-.5]){
            resize([0,2.5,0]){
                difference(){
                    cylinder(r=1,h=1,$fn=50);
                }
            }
        }
        translate([1.5,-1.5,-.5]){
            resize([0,2.5,0]){
                difference(){
                    cylinder(r=1,h=1,$fn=50);
                }
            }
        }
        translate([3.1,-1.5,-.5]){
            resize([0,2.5,0]){
                difference(){
                    cylinder(r=1,h=1,$fn=50);
                }
            }
        }
        translate([4.6,-1.5,-.5]){
            resize([0,2.5,0]){
                difference(){
                    cylinder(r=1,h=1,$fn=50);
                }
            }
        }
    }
    
    // finger guard holes
    translate([-0.1,-1.2,-2]){
        resize([0,2,0]){
            cylinder(r=.75,h=4,$fn=50);
        }
    }
    translate([1.5,-1.5,-2]){
        resize([0,2,0]){
            cylinder(r=.75,h=4,$fn=50);
        }
    }
    translate([3.1,-1.5,-2]){
        resize([0,2,0]){
            cylinder(r=.75,h=4,$fn=50);
        }
    }
    translate([4.7,-1.5,-2]){
        resize([0,2,0]){
        cylinder(r=.75,h=4,$fn=50);
        }
    }
    
    // blade cut-out
    translate([5.7,-1.5,-2]){
        rotate([0,0,20]){
            cube([5,1,4]);
        }
    }
    translate([6,-.1,-2]){
        cylinder(r=.9,h=4,$fn=50);
    }
    /*
    // round finger guards
    translate([-2,-1,0]){
        #resize([0,7,4.5]){
            rotate([0,90,0]){
                difference(){
                    cylinder(r=1,h=10,$fn=25);
                    cylinder(r=.50,h=10,$fn=50);
                }
            }
        }
    }
    */
}

// "blade"
translate([5,-0.4,-.25]){
    cube([3,1.2,.5]);
}