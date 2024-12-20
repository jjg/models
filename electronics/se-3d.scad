/*

SE/3D is the best name I can come up with for a machine that combines a 3 axis CNC
with a computer to design, model and program the things the CNC is used to make. 

Some basic (potential) requirements:
* Portable
* 3d printing
* lasering
* milling(?)
* Solder station
* VOM/o-scope
* Parts bin
* 100mm3 build volume
* Fast enough to print the entire build envelope in ~30 minutes
* Core-XY (http://corexy.com/theory.html)
* 3D scanner (object capture, teleportation)

The design is based on the Macintosh SE/30.  It occured to me when I saw my (unfinished)
Tantilus printer next to an actual Macintosh SE and noticied the similarity. 

(then why is it based on the SE/30 and not the SE?  Because the SE/30 is cooler)

In a perfect world the SE/3D would be a true Reprap and capable of producing offspring. 
I'll try to make that happen.

Parts (other than the 3D printed parts)
* Waveshare LCD
* Some SBC
* Some CNC control board (RAMPS? RAMBO?)
* NEMA?? Stepper motors (x3)
* Belts
* Toothed pulley (x2), maybe they are called cogs?
* Various "minerals"

*/

/*
Original SE/30 dimensions.
(https://en.wikipedia.org/wiki/Macintosh_SE/30)
HEIGHT: 350
WIDTH:  240
DEPTH:  280
*/

SCALE = 0.80;
WALL_THICKNESS = 3;

HEIGHT = 350 * SCALE;
WIDTH = 240 * SCALE;
DEPTH = 280 * SCALE;

DOOR_HEIGHT = 250 * SCALE;
DOOR_DEPTH = 20;

FOOT_HEIGHT = HEIGHT * .15;

BIN_HEIGHT = HEIGHT * .25;
BIN_WIDTH = WIDTH * .90;
BIN_DEPTH = DEPTH-DOOR_DEPTH-10;

// Display dimensions
LCD_HEIGHT = 164.90;
LCD_WIDTH = 124.27;
LCD_DEPTH = 10; // estimate

// TODO: Get SBC dimensions
// TODO: Get CNC controller dimensions
// TODO: Get power supply dimensions

/*
difference(){
    
    // main body
    cube([WIDTH, DEPTH, HEIGHT]);
    
    // hollow-out 
    translate([WALL_THICKNESS,DOOR_DEPTH+WALL_THICKNESS,WALL_THICKNESS]){
      cube([WIDTH-(WALL_THICKNESS*2), DEPTH-DOOR_DEPTH-(WALL_THICKNESS*2), HEIGHT-WALL_THICKNESS*2]);
    }

    // Cut-out "foot"
    translate([0,0,0]){
        cube([WIDTH,DOOR_DEPTH,FOOT_HEIGHT]);
    }
    
    // TODO: Cut-out carry handle
    // TODO: Cut-out XY axis
    // TODO: Cut-out Z axis
    // TODO: Cut-out ventilation slots around base
    
    // Cut-out door
    // TODO: Figure out why this is leaving a "lip" at the front 
    // (just above the door hinge)
    translate([0,0,HEIGHT-DOOR_HEIGHT]){
        door(true,false,false);
        rotate_about_pt(-5,0,0,[DOOR_DEPTH/2,DOOR_DEPTH/2]){
          scale([1,1,1.1]){
            door(true, false, false);
          }
        }
        
        // pin hole
        translate([0,DOOR_DEPTH/2,0]){
            rotate([0,90,0]){
                cylinder(r=DOOR_DEPTH/4,h=WIDTH);
            }
        }
    }
}
*/

/*
// CNC build envelope
translate([(WIDTH/2)-50,(DEPTH/2)-50,(HEIGHT/2)-50]){
  color("pink"){
    cube([100,100,100]);
  }
}
*/


// Door
translate([0,0,HEIGHT-DOOR_HEIGHT]){
    rotate_about_pt(0,0,0,[DOOR_DEPTH/2,DOOR_DEPTH/2]){
        door(true, true, true);
    }
}

/*
// Z Axis
translate([WIDTH/2,DEPTH-WALL_THICKNESS-20,WALL_THICKNESS]){
    zAxis();
}

// XY Axis
translate([0,60,HEIGHT-30]){
    xyAxis();
}
*/

module xyAxis(){
    
    // x axis stepper & mount
    translate([WALL_THICKNESS,0,0]){
        cube([40,40,8]);
        translate([20,20,-40]){
            color("silver"){
                cylinder(r=5,h=50);
                translate([-20,-20,0]){            
                    cube([40,40,40]);            
                }
            }
        }
    }
    
    // y axis stepper & mount
    translate([WIDTH-WALL_THICKNESS-40,0,0]){
        cube([40,40,8]);
        translate([20,20,-40]){
            color("silver"){
                cylinder(r=5,h=50);
                translate([-20,-20,0]){
                    cube([40,40,40]);
                }
            }
        }
    }
    
    // left pulleys & mount
    translate([WALL_THICKNESS,125,0]){
        cube([40,40,8]);
    }
    
    // right pulleys & mount
    translate([WIDTH-WALL_THICKNESS-40,125,0]){
        cube([40,40,8]);
    }
    
    // y axis rods
    translate([WALL_THICKNESS+40/4,0,4]){
        rotate([-90,0,0]){
            cylinder(r=3, h=150);
        }
    }
    translate([WALL_THICKNESS+40-(40/4),0,4]){
        rotate([-90,0,0]){
            cylinder(r=3, h=150);
        }
    }
    
    // TODO: x axis rods
    // TODO: x axis ...sleds?
    // TODO: x axis carriage
}

module zAxis(){
    
    // z axis stepper
    cylinder(r=5,h=50);
    translate([-20,-20,0]){
        cube([40,40,40]);
    }
    
    // z axis leadscrew
    cylinder(r=3,h=HEIGHT);
    
    // z axis rods
    translate([-25,0,0]){
        cylinder(r=3,h=HEIGHT);
    }
    translate([25,0,0]){
        cylinder(r=3,h=HEIGHT);
    }
    
    // z axis bed
    translate([-55,-115,75]){
        cube([110,110,5]);
    }
}

module door(pin, thing, lcd){
    
    /*
    Right now this is mostly a placeholder, because as-is
    it couldn't contain the LCD (it just has a hole the size
    of the bounding box of the LCD & its mountpoints).
    
    I'm considering covering the back of the door with a
    panel (acrylic? aluminum?) to both enclose the LCD and
    provide a flat, sturdy work surface.  Acrylic has the 
    advantage of being able to be back or side-lit and provide
    illumination to the workpiece.
    */
    
    difference(){
        
        union(){
            // Door outline
            // TODO: This "+1.65" adjustment is wack,
            // and probably won't handle scale changes,
            // come up with something better.
            cube([WIDTH,DOOR_DEPTH,DOOR_HEIGHT+1.65]);
            
            // Hinge barrel
            translate([0,DOOR_DEPTH/2,0]){
                rotate([0,90,0]){
                    cylinder(r=(DOOR_DEPTH/2),h=WIDTH);
                }
            }
        }
        
        // Hinge pin
        if(pin){
            translate([0,DOOR_DEPTH/2,0]){
                rotate([0,90,0]){
                    cylinder(r=DOOR_DEPTH/4,h=WIDTH);
                }
            }
        }
        
        // Hinge slots
        if(thing){
            cube([WIDTH/4,DOOR_DEPTH/2,DOOR_DEPTH/2]);
        }
        translate([0,DOOR_DEPTH/2,0]){
            rotate([0,90,0]){
                cylinder(r=(DOOR_DEPTH/2),h=WIDTH/4);                
            }
        }
        
        if(thing){
            translate([WIDTH-(WIDTH/4),0,0]){
                cube([WIDTH/4,DOOR_DEPTH/2,DOOR_DEPTH/2]);
            }
        }
        translate([WIDTH-(WIDTH/4),DOOR_DEPTH/2,0]){
            rotate([0,90,0]){
                cylinder(r=(DOOR_DEPTH/2),h=WIDTH/4);                
            }
        }
        
        if(lcd){
            LCD_BOARD_LENGTH = 190; //180; //164.90;
            LCD_BOARD_WIDTH = 135; //124.27;
            //LCD_MOUNT_LENGTH_CENTERPOINT = 156.90;
            //LCD_MOUNT_WIDTH_CENTERPOINT = 114.96;
            
            LCD_SCREEN_LENGTH = 164.90;
            LCD_SCREEN_WIDTH = 106.96;
            
            // LCD cut-out
            //translate([(WIDTH/2)-(LCD_WIDTH/2),0,(DOOR_HEIGHT/2)-(LCD_HEIGHT/2)]){
            // note: DOOR_DEPTH/2 is used here to compensate for the space consumed
            // by the hinge when centering the LCD vertically
            translate([(WIDTH/2)-(LCD_SCREEN_WIDTH/2),-1,(DOOR_HEIGHT/2)-(LCD_SCREEN_LENGTH/2)+(DOOR_DEPTH/2)]){
                //cube([LCD_WIDTH,LCD_DEPTH,LCD_HEIGHT]);
                
                // screen hole
                cube([LCD_SCREEN_WIDTH,25,LCD_SCREEN_LENGTH]);
                
                // board hole
                translate([(LCD_SCREEN_WIDTH/2)-(LCD_BOARD_WIDTH/2),DOOR_DEPTH/2,(LCD_SCREEN_LENGTH/2)-(LCD_BOARD_LENGTH/2)-6]){
                    cube([LCD_BOARD_WIDTH,25,LCD_BOARD_LENGTH]);
                }
            }
        }
    }
}


// Rotates object around specified point
module rotate_about_pt(x, z, y, pt) {
    translate(pt)
        rotate([x, y, z])
            translate(-pt)
                children();   
}





