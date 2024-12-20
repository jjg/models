/*
Carbonite control panels

1" = 25.4mm

maximums:
length: 15" (381mm)
width: 5" (127mm)
height: 2"
*/

BASE_LENGTH = 300;
BASE_WIDTH = 120;
BASE_HEIGHT = 50;

SCREEN_LENGTH = 75;
SCREEN_WIDTH = 75;

LARGE_PANEL_LENGTH = 50;
LARGE_PANEL_WIDTH = 50;

SMALL_PANEL_LENGTH = 50;
SMALL_PANEL_WIDTH = 35;

LONG_PANEL_LENGTH = 160;
LONG_PANEL_WIDTH = 15;

VENT_LENGTH = 40;
VENT_WIDTH = 3;

// Adjust these to match the actual hardware
BUTTON_RADIUS = 20;
BUTTON_MOUNT_RADIUS = 10;

WALL_THICKNESS = 3;
FRAME_THICKNESS = 2;

// Render preview
PREVIEW = false;
EXPLODED = true;

// ***
// Call modules here to render them
// ***

// CCP1
// TODO: Panel mounting holes
// TODO: Arduino mount
// Bargraph
// large subpanel/lens (LEDS)
// small subpanel 1 (buttons)
// small subpanel 2 (switch)
// LCD screen frame


cover();

// base
module base(){
    difference(){
        cube([BASE_LENGTH,BASE_WIDTH,BASE_HEIGHT]);
        translate([WALL_THICKNESS,WALL_THICKNESS,WALL_THICKNESS]){
            cube([BASE_LENGTH-(WALL_THICKNESS*2),BASE_WIDTH-(WALL_THICKNESS*2),BASE_HEIGHT]);
        }
    }
}

// cover
module cover(){
    color("red")
    difference(){
        cube([BASE_LENGTH,BASE_WIDTH,WALL_THICKNESS]);
        
        // screen opening
        translate([BASE_LENGTH*.10+FRAME_THICKNESS,(BASE_WIDTH/2)-(SCREEN_WIDTH/2)+FRAME_THICKNESS,-1]){
            cube([SCREEN_LENGTH-(FRAME_THICKNESS*2),SCREEN_WIDTH-(FRAME_THICKNESS*2),WALL_THICKNESS+2]);
        }
        
        // large panel opening
        translate([BASE_LENGTH*.40+FRAME_THICKNESS,BASE_WIDTH*.40+FRAME_THICKNESS,-1]){
            cube([LARGE_PANEL_LENGTH-(FRAME_THICKNESS*2),LARGE_PANEL_WIDTH-(FRAME_THICKNESS*2),WALL_THICKNESS+2]);
        }
        
        // small panel A opening
        translate([BASE_LENGTH*.60+FRAME_THICKNESS,BASE_WIDTH*.53+FRAME_THICKNESS,-1]){
            cube([SMALL_PANEL_LENGTH-(FRAME_THICKNESS*2),SMALL_PANEL_WIDTH-(FRAME_THICKNESS*2),WALL_THICKNESS+2]);
        }
        
        // small panel B opening
        translate([BASE_LENGTH*.80+FRAME_THICKNESS,BASE_WIDTH*.53+FRAME_THICKNESS,-1]){
            cube([SMALL_PANEL_LENGTH-(FRAME_THICKNESS*2),SMALL_PANEL_WIDTH-(FRAME_THICKNESS*2),WALL_THICKNESS+2]);
        }
        
        // knob/button A
        translate([BASE_LENGTH*.80,BASE_WIDTH*.42,-1]){
            cylinder(r=BUTTON_MOUNT_RADIUS/2,h=WALL_THICKNESS+2);
        }
        
        // knob/button B
        translate([BASE_LENGTH*.90,BASE_WIDTH*.42,-1]){
            cylinder(r=BUTTON_MOUNT_RADIUS/2,h=WALL_THICKNESS+2);
        }
        
        // long panel opening
        translate([BASE_LENGTH*.40,BASE_WIDTH*.16,-1]){
            cube([LONG_PANEL_LENGTH,LONG_PANEL_WIDTH,WALL_THICKNESS+2]);
        }
        
        // vents
        translate([BASE_LENGTH*.58,BASE_WIDTH*.48,-1]){
            cube([VENT_LENGTH,VENT_WIDTH,WALL_THICKNESS+2]);
        }
        translate([BASE_LENGTH*.58,BASE_WIDTH*.44,-1]){
            cube([VENT_LENGTH,VENT_WIDTH,WALL_THICKNESS+2]);
        }
        translate([BASE_LENGTH*.58,BASE_WIDTH*.40,-1]){
            cube([VENT_LENGTH,VENT_WIDTH,WALL_THICKNESS+2]);
        }
        translate([BASE_LENGTH*.58,BASE_WIDTH*.36,-1]){
            cube([VENT_LENGTH,VENT_WIDTH,WALL_THICKNESS+2]);
        }
         translate([BASE_LENGTH*.58,BASE_WIDTH*.32,-1]){
            cube([VENT_LENGTH,VENT_WIDTH,WALL_THICKNESS+2]);
        }

    }
}

// screen
module screen(){
    color("white")
    difference(){
        cube([SCREEN_LENGTH,SCREEN_WIDTH,WALL_THICKNESS]);
        translate([FRAME_THICKNESS,FRAME_THICKNESS,-1]){
            cube([SCREEN_LENGTH-(FRAME_THICKNESS*2),SCREEN_WIDTH-(FRAME_THICKNESS*2),WALL_THICKNESS+2]);
        }
    }
}

// large panel
module large_panel(){
    color("yellow",0.2)
    difference(){
        cube([LARGE_PANEL_LENGTH,LARGE_PANEL_WIDTH,WALL_THICKNESS]);
    }
}

module large_frame(){
    color("white")
    difference(){
        cube([LARGE_PANEL_LENGTH,LARGE_PANEL_WIDTH,WALL_THICKNESS]);
        translate([FRAME_THICKNESS,FRAME_THICKNESS,-1]){
            cube([LARGE_PANEL_LENGTH-(FRAME_THICKNESS*2),LARGE_PANEL_WIDTH-(FRAME_THICKNESS*2),WALL_THICKNESS+2]);
        }
    }
}

// small panel
module small_panel(){
    color("yellow",0.2)
    difference(){
        cube([SMALL_PANEL_LENGTH,SMALL_PANEL_WIDTH,WALL_THICKNESS]);
    }
}

module small_frame(){
    color("white")
    difference(){
        cube([SMALL_PANEL_LENGTH,SMALL_PANEL_WIDTH,WALL_THICKNESS]);
        translate([FRAME_THICKNESS,FRAME_THICKNESS,-1]){
            cube([SMALL_PANEL_LENGTH-(FRAME_THICKNESS*2),SMALL_PANEL_WIDTH-(FRAME_THICKNESS*2),WALL_THICKNESS+2]);
        }
    }
}

// long panel
module long_panel(){
    color("yellow",0.2)
    union(){
        cube([LONG_PANEL_LENGTH,LONG_PANEL_WIDTH,WALL_THICKNESS]);
        translate([-LONG_PANEL_WIDTH/2,LONG_PANEL_WIDTH/2,0]){
            rotate([0,0,-45]){
                cube([LONG_PANEL_WIDTH/1.5,LONG_PANEL_WIDTH/1.5,WALL_THICKNESS]);
            }
        }
        translate([LONG_PANEL_LENGTH-(LONG_PANEL_WIDTH/2),LONG_PANEL_WIDTH/2,0]){
            rotate([0,0,-45]){
                cube([LONG_PANEL_WIDTH/1.5,LONG_PANEL_WIDTH/1.5,WALL_THICKNESS]);
            }
        }
    }
}

module knob(){
    color("brown")
    cylinder(r=BUTTON_RADIUS/2,h=WALL_THICKNESS*3);
}

module button(){
    cylinder(r=BUTTON_RADIUS/2,h=WALL_THICKNESS*3);
}


// assemble!
if (PREVIEW){
    color("gray"){
        base();
    }
    if (EXPLODED){
        translate([0,0,BASE_HEIGHT*2]){
            cover();
            translate([BASE_LENGTH*.10,(BASE_WIDTH/2)-(SCREEN_WIDTH/2),BASE_HEIGHT]){
                screen();
            }
            translate([BASE_LENGTH*.40,BASE_WIDTH*.40,BASE_HEIGHT]){
                large_panel();
                translate([0,0,BASE_HEIGHT]){
                    large_frame();
                }
            }
            translate([BASE_LENGTH*.60,BASE_WIDTH*.53,BASE_HEIGHT]){
                small_panel();
                translate([0,0,BASE_HEIGHT]){
                    small_frame();
                }
            }
            translate([BASE_LENGTH*.80,BASE_WIDTH*.53,BASE_HEIGHT]){
                small_panel();
                translate([0,0,BASE_HEIGHT]){
                    small_frame();
                }
            }
            // knob/button A
            translate([BASE_LENGTH*.75,BASE_WIDTH*.42,BASE_HEIGHT]){
                knob();
            }
            // knob/button B
            translate([BASE_LENGTH*.87,BASE_WIDTH*.42,BASE_HEIGHT]){
                knob();
            }        
            translate([BASE_LENGTH*.40,BASE_WIDTH*.16,BASE_HEIGHT]){
                long_panel();
            }
        }
    } else {
        translate([0,0,BASE_HEIGHT]){
            cover();        
            translate([BASE_LENGTH*.10,(BASE_WIDTH/2)-(SCREEN_WIDTH/2),WALL_THICKNESS]){
                screen();
            }        
            translate([BASE_LENGTH*.40,BASE_WIDTH*.40,WALL_THICKNESS]){
                large_panel();
                translate([0,0,WALL_THICKNESS+1.1]){
                    large_frame();
                }
            }
            translate([BASE_LENGTH*.60,BASE_WIDTH*.53,WALL_THICKNESS]){
                small_panel();
                translate([0,0,WALL_THICKNESS+1.1]){
                    small_frame();
                }
            }
            translate([BASE_LENGTH*.80,BASE_WIDTH*.53,WALL_THICKNESS]){
                small_panel();
                translate([0,0,WALL_THICKNESS+1.1]){
                    small_frame();
                }
            }
            translate([BASE_LENGTH*.75,BASE_WIDTH*.42,WALL_THICKNESS]){
                knob();
            }        
            translate([BASE_LENGTH*.87,BASE_WIDTH*.42,WALL_THICKNESS]){
                knob();
            }                
            translate([BASE_LENGTH*.40,BASE_WIDTH*.16,WALL_THICKNESS]){
                long_panel();
            }
        }
    }
}