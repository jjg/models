difference(){
    hull(){
        cylinder(r=4,h=5);
        translate([100,0,0]){
            cylinder(r=1,h=5);
        }
    }

    translate([1,0,-1]){
        //cylinder(r=8,h=7);
        cylinder(r=3,h=7);
    }
}