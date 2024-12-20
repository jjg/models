module fan(diameter, height, blades, shaft_diameter){
  difference(){
    union(){
      cylinder(r=shaft_diameter*3, h=height);
      for (i = [0:blades-1]) {
        rotate([30, 0, (360*i/blades)]){
          cube([diameter/2, 1, height]);
        }
      }
    }
    translate([0,0,-1]){
      cylinder(r=shaft_diameter/2, h=height);
    }
  }
}