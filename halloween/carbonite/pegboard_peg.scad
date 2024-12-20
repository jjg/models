/*
    So let's try the pegboard version
    
    How many holes in 3'x6' of pegboard?
    holes are 1/4" (6.35mm)
    holes are 1" apart (25.4mm) on-center
    board is 1/4" thick (6.35mm)
    
    So if the holes are 1" apart, there should be 12 holes per foot, and 144 holes per square foot?
    
    We have 18 square feet, so if that's right we need 2592 pins?
    
    Double that for estimates as this model is of one side of one pin, so 5184 parts.
    
    time and materials per part: 23 min 5.82g
    total time: 82.8 days
    total materials: 30.17kg
    
    ok how about no infill?
    time and materials: 19 min 3.96g
    total time: 68.4 days
    total materials: 20kg
    
    so the pegs need to be two-part, and need to move let's say 1" (25.4mm)
    
*/
WALL_THICKNESS = 1;
SHAFT_DIAMETER = 6.5;//5.4;

/*
// solid shaft
translate([0,0,25]){
    //cylinder(r=SHAFT_DIAMETER/2,h=25);
    cylinder(r=(SHAFT_DIAMETER-(WALL_THICKNESS*2))/2,h=10);
}
*/


// hollow shaft
translate([0,0,25]){
    difference(){
        cylinder(r=SHAFT_DIAMETER/2,h=25);
        
        translate([0,0,0]){
            cylinder(r=(SHAFT_DIAMETER-(WALL_THICKNESS*2))/2,h=25);
        }
    }
}


// head
cylinder(r=25/2,h=25);

sphere(25/2);