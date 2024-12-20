difference(){
    linear_extrude(254){
        polygon(points=[[0,0],[0,31.75],[76.2,57.15],[76.2,0]]);
    }
    
    translate([12.7,11,0]){
        cube([1.5875,25.4,254]);
    }
    translate([28,17,0]){
        cube([1.5875,25.4,254]);
    }
    translate([44.45,22,0]){
        cube([1.5875,25.4,254]);
    }
    translate([62,28,0]){
        cube([1.5875,25.4,254]);
    }
    
    translate([72,15,175]){
        rotate([0,90,0]){
            linear_extrude(5){
                #text("Jason", size=40, font="Z003:style=Medium Italic");
            }
        }
    }
}

