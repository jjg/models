module fan(){

  FAN_HOLE_DIAMETER = 38;
  HOLE_DEPTH = 25;
  MOUNTING_HOLE_DIAMETER = 3.5;
  
  //difference(){
  union(){
  
    // bounding box
    cube([40,10.3,40]);

    // blade opening
    translate([20,-1,20]){
      rotate([-90,0,0]){
        cylinder(r=FAN_HOLE_DIAMETER/2,h=HOLE_DEPTH);
      }
    }
    
    // mounting holes
    DISTANCE_FROM_BOUNDS = (2.27 + (3.5/2));
    
    translate([DISTANCE_FROM_BOUNDS,-1,DISTANCE_FROM_BOUNDS]){
      rotate([-90,0,0]){
        cylinder(r=MOUNTING_HOLE_DIAMETER/2,h=HOLE_DEPTH);
      }
    }

    translate([DISTANCE_FROM_BOUNDS,-1, 40 - DISTANCE_FROM_BOUNDS]){
      rotate([-90,0,0]){
        cylinder(r=MOUNTING_HOLE_DIAMETER/2,h=HOLE_DEPTH);
      }
    }
    
    translate([40 - DISTANCE_FROM_BOUNDS,-1, 40 - DISTANCE_FROM_BOUNDS]){
      rotate([-90,0,0]){
        cylinder(r=MOUNTING_HOLE_DIAMETER/2,h=HOLE_DEPTH);
      }
    }
    
    translate([40 - DISTANCE_FROM_BOUNDS,-1,DISTANCE_FROM_BOUNDS]){
      rotate([-90,0,0]){
        cylinder(r=MOUNTING_HOLE_DIAMETER/2,h=HOLE_DEPTH);
      }
    }  
  }
}
