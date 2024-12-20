module duct(length, angle){
  tube(10);
  translate([0,1,6]){
    rotate([angle, 0 , 0]){
      tube(length);
    }
  }
}

module tube(length){
   difference(){
    // outer
    hull(){
      cylinder(r=8, h=length);
      translate([20,0,0]){
        cylinder(r=8, h=length);
      }
    }
    // inner
    translate([0,0,-1]){
      hull(){
        cylinder(r=7, h=length+2);
        translate([20,0,0]){
          cylinder(r=7, h=length+2);
        }
      }
    }
  }
} 