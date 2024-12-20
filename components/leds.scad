module led_10(color="red",tolerance=0){
    
    $fn=15;
    
    // Measurements taken from https://evandesigns.com/pages/information-about-led-sizes
    total_height = 13.6+tolerance;
    body_radius = (10.0+tolerance)/2;
    lip_radius = (11+tolerance)/2;
    lip_height = 2;
    
    led(color,body_radius,total_height,lip_radius,lip_height);
}

module led_5(color="red",tolerance=0){
    
    $fn=15;
    
    // Measurements taken from https://evandesigns.com/pages/information-about-led-sizes
    total_height = 9.69+tolerance;
    body_radius = (5.0+tolerance)/2;
    lip_radius = (5.9+tolerance)/2;
    lip_height = 1;
    
    led(color,body_radius,total_height,lip_radius,lip_height);
}

module led_3(color="red",tolerance=0){
    
    $fn=15;
    
    // Measurements taken from https://evandesigns.com/pages/information-about-led-sizes
    total_height = 5.49+tolerance;
    body_radius = (3.0+tolerance)/2;
    lip_radius = (3.74+tolerance)/2;
    lip_height = 1;
    
    led(color,body_radius,total_height,lip_radius,lip_height);
}

module led(led_color,body_radius,total_height,lip_radius,lip_height){
    color(led_color){
        // Body.
        cylinder(r=body_radius,h=total_height-body_radius);
        // Lip.
        cylinder(r=lip_radius,h=lip_height);
        // Dome.
        translate([0,0,total_height-body_radius]){
            sphere(r=body_radius);
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

/*
// Examples
led_5(color="green");
translate([10,0,0]){
    led_3(color="yellow");
}
translate([-10,0,0]){
    led_10();
}
*/