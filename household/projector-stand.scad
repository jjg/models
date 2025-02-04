/*
    Projector stand
*/

difference(){
    
    // Base
    union(){
        cube([190,135,30]);
        translate([-10,0,-10]){
            cube([10,135,40]);
        }
    }
    
    // Projector cut-out
    translate([(190-150-5),5,5]){
        rotate([0,-6,0]){
            cube([150,125,50]);
        }
    }
    
    // Forkers
    translate([150,10,-1]){
        cube([50,115,50]);
    }
    translate([50,10,-1]){
        cube([90,115,50]);
    }
    
    // Chin
    translate([190-30,0,-5]){
        rotate([0,-6,0]){
            cube([35,135,20]);
        }
    }
    
    // Measuring thing
    /*
    translate([(190-5-5),135-20,5]){
        #cube([5,15,15]);
    }
    */
    
    // Rear pocket
    translate([-5,5,15]){
        cube([40,125,50]);
    }
    translate([-5,5,5]){
        cube([35,125,50]);
    }
    
    // Cross-section
    translate([-15,-25,-15]){
        //cube([210,140,50]);
    }
}