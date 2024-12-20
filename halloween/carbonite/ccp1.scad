include <../../components/led_bargraph.scad>

/*
Carbonite control panels

1" = 25.4mm

maximums:
length: 15" (381mm)
width: 5" (127mm)
height: 2"
*/

BASE_LENGTH = 300;
BASE_WIDTH = 150;//120;
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
// Call individual modules here to render them for printing
// ***
panel();
//led_bargraph(length=LONG_PANEL_LENGTH+(FRAME_THICKNESS*2), width=LONG_PANEL_WIDTH+(FRAME_THICKNESS*2), depth=10, led_count=10);

// CCP1
LCD_MAX_SQUARE = 53;

//***
// module definitions
//***

module arduino_uno(){
    
    $fn=30;
    
    TOLERANCE=1;
    LENGTH=68.6;
    WIDTH=53.3;
    HEIGHT=5;   // just a guess at the board thickness
    HOLE_DIAMETER=3.2+TOLERANCE;
    
    // mounting holes (only bother with the two we're going to use for now)
    UL = [14.0+1.3,2.5+5.1+27.9+15.2,-1];
    UR = [14.0+1.3+50.8,2.5+5.1+27.9,-1];
    
    color("blue"){
        cube([LENGTH,WIDTH,HEIGHT]);
    }
    translate(UL){
        cylinder(r=HOLE_DIAMETER/2,h=HEIGHT*4);
    }
    translate(UR){
        cylinder(r=HOLE_DIAMETER/2,h=HEIGHT*4);
    }
}

module hiletgo_3_5_IPS_LCD(){    
    // Measured with LCD facing forward, pins on the right.
    LENGTH=96.6;
    WIDTH=60.7;
    HEIGHT=1.6;//4.9;
    MOUNTING_HOLE_DIAMETER=2.0; // measured at 1.5, but we're using M2 bolts so...
    MOUNTING_HOLE_Z_OFFSET = -1;
        
    // mounting hole offsets
    // left, top
    TL = [0.9+(MOUNTING_HOLE_DIAMETER/2),WIDTH-(0.45+(MOUNTING_HOLE_DIAMETER/2)),MOUNTING_HOLE_Z_OFFSET];
    // left, bottom
    BL = [0.9+(MOUNTING_HOLE_DIAMETER/2),1+(MOUNTING_HOLE_DIAMETER/2),MOUNTING_HOLE_Z_OFFSET];
    // right, top
    TR = [LENGTH-(1.38+(MOUNTING_HOLE_DIAMETER/2)),WIDTH-(0.5+(MOUNTING_HOLE_DIAMETER/2)),MOUNTING_HOLE_Z_OFFSET];
    // right, bottom
    BR = [LENGTH-(1.42+(MOUNTING_HOLE_DIAMETER/2)),1.0+(MOUNTING_HOLE_DIAMETER/2),MOUNTING_HOLE_Z_OFFSET];
    
    // LCD screen itself
    LCD_MODULE_LENGTH=84.95;
    LCD_MODULE_WIDTH=55.5;
    LCD_MODULE_HEIGHT=4.75-HEIGHT;
        
    union(){
        // board
        color("green"){
            cube([96.0,60.3,HEIGHT]);
        }
        // screen
        translate([5.2,2.75,HEIGHT]){
            color("black"){
                cube([LCD_MODULE_LENGTH,LCD_MODULE_WIDTH,LCD_MODULE_HEIGHT]);
            }
        }
    }
    
    // mounting holes
    translate(TL){
        cylinder(r=MOUNTING_HOLE_DIAMETER,h=HEIGHT*8);
    }
    translate(BL){
        cylinder(r=MOUNTING_HOLE_DIAMETER,h=HEIGHT*8);
    }
    translate(TR){
        cylinder(r=MOUNTING_HOLE_DIAMETER,h=HEIGHT*8);
    }
    translate(BR){
        cylinder(r=MOUNTING_HOLE_DIAMETER,h=HEIGHT*8);
    }
}

// base
module base(){
    difference(){
        cube([BASE_LENGTH,BASE_WIDTH,BASE_HEIGHT]);
        translate([WALL_THICKNESS,WALL_THICKNESS,WALL_THICKNESS]){
            cube([BASE_LENGTH-(WALL_THICKNESS*2),BASE_WIDTH-(WALL_THICKNESS*2),BASE_HEIGHT]);
        }
    }
}

// main panel
module panel(){
    color("grey")
    difference(){
        
        // panel base and frames
        union(){
            cube([BASE_LENGTH,BASE_WIDTH,WALL_THICKNESS]);
            translate([0,0,WALL_THICKNESS]){
                cube([BASE_LENGTH,BASE_WIDTH,WALL_THICKNESS]);
                
                translate([BASE_LENGTH*.40,BASE_WIDTH*.40,WALL_THICKNESS]){
                    large_frame();
                }
                translate([BASE_LENGTH*.60,BASE_WIDTH*.53,WALL_THICKNESS]){
                    small_frame();
                }
                translate([BASE_LENGTH*.80,BASE_WIDTH*.53,WALL_THICKNESS]){
                    small_frame();
                }
                translate([(BASE_LENGTH*.40)-FRAME_THICKNESS,(BASE_WIDTH*.16)-FRAME_THICKNESS,WALL_THICKNESS]){
                    long_frame();
                }    
            }
        }
        
        // mounting holes
        mounting_bolt_shaft_diameter = 5;
        translate([7,7,-1]){
            cylinder(r=mounting_bolt_shaft_diameter/2,h=WALL_THICKNESS*3);
        }
        translate([BASE_LENGTH-7,7,-1]){
            cylinder(r=mounting_bolt_shaft_diameter/2,h=WALL_THICKNESS*3);
        }
        translate([BASE_LENGTH-7,BASE_WIDTH-7,-1]){
            cylinder(r=mounting_bolt_shaft_diameter/2,h=WALL_THICKNESS*3);
        }
        translate([7,BASE_WIDTH-7,-1]){
            cylinder(r=mounting_bolt_shaft_diameter/2,h=WALL_THICKNESS*3);
        }
        
        // LCD mounting holes
        translate([98,(BASE_WIDTH/2)-50,-5]){
            rotate([0,0,90]){
                hiletgo_3_5_IPS_LCD();
            }
        }
        
        // screen opening
        translate([BASE_LENGTH*.10+FRAME_THICKNESS,(BASE_WIDTH/2)-(SCREEN_WIDTH/2)+FRAME_THICKNESS,-1]){
            cube([SCREEN_LENGTH-(FRAME_THICKNESS*2),SCREEN_WIDTH-(FRAME_THICKNESS*2),(WALL_THICKNESS*2)+2]);
        }
        
        // large subpanel opening
        translate([BASE_LENGTH*.40+FRAME_THICKNESS,BASE_WIDTH*.40+FRAME_THICKNESS,-1]){
            cube([LARGE_PANEL_LENGTH-(FRAME_THICKNESS*2),LARGE_PANEL_WIDTH-(FRAME_THICKNESS*2),(WALL_THICKNESS*2)+2]);
        }
        
        // small subpanel A
        translate([BASE_LENGTH*.60+FRAME_THICKNESS,BASE_WIDTH*.53+FRAME_THICKNESS,-1]){
            subpanel_length = SMALL_PANEL_LENGTH-(FRAME_THICKNESS*2);
            subpanel_width = SMALL_PANEL_WIDTH-(FRAME_THICKNESS*2);
            
            translate([subpanel_length/4,subpanel_width/2,-1]){
                cylinder(r=13/2,h=(WALL_THICKNESS*2)+2);
            }
            translate([subpanel_length-(subpanel_length/4),subpanel_width/2,-1]){
                cylinder(r=13/2,h=WALL_THICKNESS+2);
            }
            translate([0,0,WALL_THICKNESS]){
                cube([SMALL_PANEL_LENGTH-(FRAME_THICKNESS*2),SMALL_PANEL_WIDTH-(FRAME_THICKNESS*2),WALL_THICKNESS+2]);
            }
        }
        
        // small subpanel B
        translate([BASE_LENGTH*.80+FRAME_THICKNESS,BASE_WIDTH*.53+FRAME_THICKNESS,-1]){
            subpanel_length = SMALL_PANEL_LENGTH-(FRAME_THICKNESS*2);
            subpanel_width = SMALL_PANEL_WIDTH-(FRAME_THICKNESS*2);
            
            translate([subpanel_length/2,subpanel_width/2,-WALL_THICKNESS-1]){
                cylinder(r=13/2,h=(WALL_THICKNESS*2)+2);
            }
            translate([0,0,WALL_THICKNESS]){
                cube([SMALL_PANEL_LENGTH-(FRAME_THICKNESS*2),SMALL_PANEL_WIDTH-(FRAME_THICKNESS*2),WALL_THICKNESS+2]);
            }
        }
        
        // knob/button A
        translate([BASE_LENGTH*.80,BASE_WIDTH*.42,-1]){
            cylinder(r=BUTTON_MOUNT_RADIUS/2,h=(WALL_THICKNESS*2)+2);
        }
        
        // knob/button B
        translate([BASE_LENGTH*.90,BASE_WIDTH*.42,-1]){
            cylinder(r=BUTTON_MOUNT_RADIUS/2,h=(WALL_THICKNESS*2)+2);
        }
        
        // long panel opening
        translate([BASE_LENGTH*.40,BASE_WIDTH*.16,-1]){
            cube([LONG_PANEL_LENGTH,LONG_PANEL_WIDTH,(WALL_THICKNESS*2)+2]);
        }
        
        // vents
        translate([BASE_LENGTH*.58,BASE_WIDTH*.48,-1]){
            cube([VENT_LENGTH,VENT_WIDTH,(WALL_THICKNESS*2)+2]);
        }
        translate([BASE_LENGTH*.58,BASE_WIDTH*.44,-1]){
            cube([VENT_LENGTH,VENT_WIDTH,(WALL_THICKNESS*2)+2]);
        }
        translate([BASE_LENGTH*.58,BASE_WIDTH*.40,-1]){
            cube([VENT_LENGTH,VENT_WIDTH,(WALL_THICKNESS*2)+2]);
        }
        translate([BASE_LENGTH*.58,BASE_WIDTH*.36,-1]){
            cube([VENT_LENGTH,VENT_WIDTH,(WALL_THICKNESS*2)+2]);
        }
         translate([BASE_LENGTH*.58,BASE_WIDTH*.32,-1]){
            cube([VENT_LENGTH,VENT_WIDTH,(WALL_THICKNESS*2)+2]);
        }
    }
}

// screen
module screen_frame(){
    color("white")
    difference(){
        cube([SCREEN_LENGTH,SCREEN_WIDTH,WALL_THICKNESS]);
        translate([(SCREEN_LENGTH/2)-(LCD_MAX_SQUARE/2),(SCREEN_LENGTH/2)-(LCD_MAX_SQUARE/2),-1]){
            cube([LCD_MAX_SQUARE,LCD_MAX_SQUARE,WALL_THICKNESS+2]);
        }
    }
}

// large panel
module large_panel(thickness=WALL_THICKNESS){
    color("yellow",0.2)
    difference(){
        cube([LARGE_PANEL_LENGTH,LARGE_PANEL_WIDTH,thickness]);
    }
}

// large panel with 4 10mm LEDs
// TODO: 10mm LED's need a little more clearance
module large_led_panel(){
    difference(){
        large_panel(10);
        translate([LARGE_PANEL_LENGTH/4,LARGE_PANEL_WIDTH/4,0]){
            led_10();
        }
        translate([LARGE_PANEL_LENGTH-(LARGE_PANEL_LENGTH/4),LARGE_PANEL_WIDTH/4,0]){
            led_10();
        }
        translate([LARGE_PANEL_LENGTH/4,LARGE_PANEL_WIDTH-(LARGE_PANEL_WIDTH/4),0]){
            led_10();
        }
        translate([LARGE_PANEL_LENGTH-(LARGE_PANEL_LENGTH/4),LARGE_PANEL_WIDTH-(LARGE_PANEL_WIDTH/4),0]){
            led_10();
        }
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

// small panel with 1 large toggle switch
module small_panel_1_large_toggle(){
    difference(){
        small_panel();
        translate([SMALL_PANEL_LENGTH/2,SMALL_PANEL_WIDTH/2,-1]){
            cylinder(r=13/2,h=WALL_THICKNESS+2);
        }
    }
}

// small panel with 2 illuminated pusbuttons
module small_panel_2_buttons(){
    difference(){
        small_panel();
        translate([SMALL_PANEL_LENGTH/4,SMALL_PANEL_WIDTH/2,-1]){
            cylinder(r=13/2,h=WALL_THICKNESS+2);
        }
        translate([SMALL_PANEL_LENGTH-(SMALL_PANEL_LENGTH/4),SMALL_PANEL_WIDTH-(SMALL_PANEL_WIDTH/2),-1]){
            cylinder(r=13/2,h=WALL_THICKNESS+2);
        }
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

// long frame
module long_frame(){
    
    length = LONG_PANEL_LENGTH+(FRAME_THICKNESS*2);
    width = LONG_PANEL_WIDTH+(FRAME_THICKNESS*2);
    
    color("white")
    difference(){
        union(){
            cube([length,width,WALL_THICKNESS]);
            translate([-width/2+.5,width/2,0]){
                rotate([0,0,-45]){
                    cube([width/1.5,width/1.5,WALL_THICKNESS]);
                }
            }
            translate([length-(width/2)+0.5,width/2,0]){
                rotate([0,0,-45]){
                    cube([width/1.5,width/1.5,WALL_THICKNESS]);
                }
            }
        }
        translate([FRAME_THICKNESS,FRAME_THICKNESS,-1]){
            cube([LONG_PANEL_LENGTH,LONG_PANEL_WIDTH,WALL_THICKNESS+2]);
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
    //color("gray"){
        //base();
        translate([98,(BASE_WIDTH/2)-50,45]){
            rotate([0,0,90]){
                hiletgo_3_5_IPS_LCD();
            }
        }
    //}
    if (EXPLODED){
        translate([0,0,BASE_HEIGHT*2]){
            panel();
            translate([BASE_LENGTH*.10,(BASE_WIDTH/2)-(SCREEN_WIDTH/2),BASE_HEIGHT]){
                screen_frame();
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
            translate([BASE_LENGTH*.80,BASE_WIDTH*.42,-1]){
                knob();
            }
            // knob/button B
            translate([BASE_LENGTH*.90,BASE_WIDTH*.42,-1]){
                knob();
            }        
            translate([BASE_LENGTH*.40,BASE_WIDTH*.16,BASE_HEIGHT]){
                led_bargraph(length=160, width=15, depth=11, led_count=10);
            }
        }
    } else {
        translate([0,0,BASE_HEIGHT]){
            cover();        
            translate([BASE_LENGTH*.10,(BASE_WIDTH/2)-(SCREEN_WIDTH/2),WALL_THICKNESS]){
                screen_frame();
            }        
            translate([BASE_LENGTH*.40,BASE_WIDTH*.40,-WALL_THICKNESS]){
                large_panel();
                translate([0,0,WALL_THICKNESS+1.1]){
                    large_frame();
                }
            }
            translate([BASE_LENGTH*.60,BASE_WIDTH*.53,-WALL_THICKNESS]){
                small_panel();
                translate([0,0,WALL_THICKNESS+1.1]){
                    small_frame();
                }
            }
            translate([BASE_LENGTH*.80,BASE_WIDTH*.53,-WALL_THICKNESS]){
                small_panel();
                translate([0,0,WALL_THICKNESS+1.1]){
                    small_frame();
                }
            }
            translate([BASE_LENGTH*.80,BASE_WIDTH*.42,WALL_THICKNESS]){
                knob();
            }        
            translate([BASE_LENGTH*.90,BASE_WIDTH*.42,WALL_THICKNESS]){
                knob();
            }                
            translate([(BASE_LENGTH*.40)-FRAME_THICKNESS,(BASE_WIDTH*.16)-FRAME_THICKNESS,WALL_THICKNESS]){
                long_frame();
                translate([5,0,-11]){
                    led_bargraph(length=LONG_PANEL_LENGTH+(FRAME_THICKNESS*2), width=LONG_PANEL_WIDTH+(FRAME_THICKNESS*2), depth=11, led_count=10);
                }
            }
        }
    }
}