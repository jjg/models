difference(){
    cube([90,90,30]);
    
    cube([80,40,30]);
    
    translate([10,50,0]){
        cube([80,40,30]);
    }
    
    translate([0,70,15]){
        rotate([0,90,0]){
            cylinder(r=5/2,h=10);
        }
    }
}

translate([90,5,0]){
    rotate([0,0,20]){
        cube([10,10,30]);
    }
}