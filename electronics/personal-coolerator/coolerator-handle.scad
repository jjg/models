include <fan_40mm.scad>
include <coolerator-battery.scad>

/*
  usb battery measurements:
  diameter: 22mm
    with clip: 23mm
  clip width: 9mm
  "bottom" of USB input: 6mm
  distance from battery top to USB plug "flange": ~5mm
*/

handle();
/*
translate([59.5,0,20]){
  rotate([180,0,-90]){
    battery();
  }
}
*/
module handle(){
    BATTERY_DIAMETER = 21;

    difference(){
        hull(){
            cylinder(r=25,h=23);
            
            translate([60,0,0]){
                cylinder(r=(BATTERY_DIAMETER/2)+3,h=23);
            }
        }
        
        // fan mount & airway cut-outs
        translate([-20,20,-0.5]){
            rotate([90,0,0]){
                fan();
            }
        }
        
        // extra fan clearance
        translate([-22,-22,-1]){
            cube([44,44,21]);
        }
        
        // base battery opening
        translate([59.5,0,-30]){
          cylinder(r=(BATTERY_DIAMETER/2)+3,h=50);
          /*
          rotate([180,0,-90]){
            battery();
          }
          */
        }
        
        // cable mgmt
        translate([18,8,-1]){
            rotate([0,0,-10]){
                cube([38,10,21]);
            }
        }
    }
}
