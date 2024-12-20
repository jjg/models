/*
    speederbike dashboard
*/

LENGTH = 200;
WIDTH = 200;
HEIGHT = 10;

$fn=40;

difference(){
    resize([0,400,0]){
        cylinder(r=200/2,h=HEIGHT);
    }
    
    // border
    translate([0,0,5]){
        difference(){
            resize([180,380,0]){
                cylinder(r=200/2,h=HEIGHT);
            }
            translate([-90,-190,-1]){
                cube([180,200,HEIGHT+2]);
            }
        }
    }
    
    translate([-100,-200,-1]){
        cube([200,200,HEIGHT+2]);
    }
}

// big knob
translate([LENGTH/4,(WIDTH/2)-10,HEIGHT/2]){
    cylinder(r=20,h=10);
}

// little knobs
translate([-LENGTH/3.5,(WIDTH/2)-10,HEIGHT/2]){
    cylinder(r=10,h=10);
    translate([25,0,0]){
        cylinder(r=10,h=10);
        translate([25,0,0]){
            cylinder(r=10,h=10);
        }
    }
}
    