difference(){
    import("lego_flat.STL");
    translate([8,2.5,8]){
        star();
    }
    
    /*
    translate([8,2.5,-3]){
        rotate([0,-90,0]){
            equals();
        }
    }
    */
    
    /*
    translate([8,2.5,-3]){
        rotate([0,-90,0]){
            vee();
        }
    }
    */
    
    /*
    translate([1.5,2.5,1.5]){
        sq();
    }
    */
    
    /*
    translate([8,2.5,8]){
        rotate([0,45,0]){
            ex();
        }
    }
    */

    /*
    translate([8,2.5,8]){
        cross();
    }
    */
    
    /*
    translate([3,12.5,3]){
        rotate([90,0,0]){
            linear_extrude(10){
                text("A");                
            }
        }
    }
    */
}

module cross(){    
    POINTS = 4;
    for(p=[1:POINTS]){
        rotate([0,p*(360/POINTS),0]){
            translate([0,0,-1]){
                cube([8,5,2]);
            }
        }
    }
}

module ex(){    
    POINTS = 4;
    for(p=[1:POINTS]){
        rotate([0,p*(360/POINTS),0]){
            translate([0,0,-1]){
                cube([12,5,2]);
            }
        }
    }
}

module sq(){
    difference(){
        cube([13,5,13]);
        translate([1.5,-1,1.5]){
            #cube([10,10,10]);
        }
    }
}

module vee(){  
    color("yellow")
    rotate([0,25,0]){
        cube([24,5,2]);
    }
    color("blue")
    translate([0,5,0]){
        rotate([180,0,0]){
            rotate([0,25,0]){
                cube([24,5,2]);
            }
        }
    }
}

module equals(){  
    color("yellow")
    translate([0,0,3]){
        rotate([0,0,0]){
            cube([24,5,2]);
        }
    }
    color("blue")
    translate([0,5,-3]){
        rotate([180,0,0]){
            rotate([0,0,0]){
                cube([24,5,2]);
            }
        }
    }
}

module star(){    
    POINTS = 6;
    for(p=[1:POINTS]){
        rotate([0,p*(360/POINTS),0]){
            translate([0,0,-1]){
                cube([10,5,2]);
            }
        }
    }
}