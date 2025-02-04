/*
    Projector stand
    
    Sadly there's no great way to print this w/o supports.
*/

difference(){
    
    // Base
    union(){
        cube([150,135,30]);
        
        // extra foot
        translate([0,0,-30]){
            cube([150,135,30]);
            
            // hook
            translate([-10,0,-10]){
                cube([10,135,70]);
            }
        }
    }
    
    // Projector cut-out
    translate([(190-150-5),5,5]){
        rotate([0,-6,0]){
            cube([150,125,50]);
        }
    }
    
    // Measuring thing to get projector angle
    /*
    translate([(190-5-5),135-20,5]){
        #cube([5,15,15]);
    }
    */
    
    // Remove excess material
    // TODO: This causes the "cross brace" to fall under the
    // projector's front feet, screwing with the angle.
    // Instead, move this out from under the feet, and adjust
    // the projector mount angle accordingly (or figure out 
    // a way to make the angle adjustable, which would be ideal).
    translate([50,10,-31]){
        cube([90,115,50]);
    }
    
    // Power cord notch
    translate([100,-1,30-10]){
        cube([20,12,11]);
    }
    
    // Rear pocket
    // TODO: Consider making this more useful by adding a slot/
    // hole for cords to go in and out (so the Roku could be 
    // stored here for example); or maybe remotes can go here?
    translate([-5,5,15]){
        cube([40,125,50]);
    }
    translate([-5,5,-25]){
        cube([35,125,50]);
    }
    
    // Cross-section
    translate([-15,-25,-50]){
        //cube([210,140,100]);
    }
}