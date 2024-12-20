include <fan_40mm.scad>

module lid(od, id){
  difference(){
    cylinder(r=od/2, h=10);
    translate([0,0,-3]){
      cylinder(r=id/2, h=10);
    }
    
    // fan mount opening
    translate([-20,-10,21]){
        rotate([-90,0,0]){
            fan();
        }
    }
    
    // duct hole
    translate([-20/2, -id/3, 0]){      
      hull(){
        cylinder(r=8, h=14);
        translate([20,0,0]){
          cylinder(r=8, h=14);
        }
      }
    }
  }
}