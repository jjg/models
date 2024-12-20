module led_5(diameter, height, tolerance){
    
    // Add tolerance.
    total_diameter = diameter+tolerance;
    
    // Derive remaining dimensions from the overall measurements.
    lip_radius = total_diameter/2;
    lip_height = 2; // TODO: this probably shouldn't be hard-coded.
    body_radius = (total_diameter-.5)/2;
    dome_radius = body_radius;
    body_height = height-dome_radius;
    
    color("red"){
        // Body.
        cylinder(r=body_radius,h=body_height);
        // Lip.
        cylinder(r=lip_radius,h=lip_height);
        // Dome.
        //translate([0,0,LED_HEIGHT-(LED_DIAMETER/2)]){
        translate([0,0,height-body_radius]){
            sphere(r=dome_radius);
        }
    }
    // Leads.
    color("gray"){
        translate([0,2,-10]){
            cylinder(r=.5,h=10);
        }
        translate([0,-2,-12]){
            cylinder(r=.5,h=12);
        }
    }
}

// Example.
led_5(10,13.7,1);