include <leds.scad>;

module led_bargraph(length, width, depth, led_count){
    
    TOLERANCE = 1;      // adjust until LED's "snap-in" 
    END_CAP_LENGTH = 5; // usually the LED diameter
    FLANGE = 10;

    // computed
    bar_length = length-(END_CAP_LENGTH*2);
    
    color("yellow",0.2)
    difference(){
        union(){
            // bar
            cube([bar_length,width,depth]);
            // end caps
            translate([-END_CAP_LENGTH,0,0]){
                cube([5,width,depth]);
                translate([-FLANGE,0,0]){
                    cube([FLANGE,width,depth]);
                }
            }
            translate([bar_length,0,0]){
                cube([5,width,depth]);
                translate([END_CAP_LENGTH,0,0]){
                    cube([FLANGE,width,depth]);
                }
            }
        }
        // subtract leds
        translate([0,width/2,0]){
            for(i=[0:led_count]){
                translate([i*(bar_length/led_count),0,0]){
                    led_5(tolerance=TOLERANCE);
                }
            }
        }
    }
}

// examples
//led_bargraph(length=10, width=10, depth=12, led_count=1);
//led_bargraph(length=160, width=15, depth=11, led_count=10);
