include <../../components/led_bargraph.scad>
include <../../components/hua_5vdc_panel_meter.scad>

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
BUTTON_MOUNT_RADIUS = 10.5;

POT_RADIUS = 10.5;
SMALL_ILLUMINATED_BUTTON_RADIUS = 13;
LARGE_ILLUMINATED_BUTTON_RADIUS = 16;
LARGE_TOGGLE_RADIUS = 13;
SMALL_TOGGLE_RADIUS = 5;    // TODO
LARGE_LED_RADIUS = 10.5;
RED_TOGGLE_RADIUS = 6;

WALL_THICKNESS = 3;
FRAME_THICKNESS = 2;

// Render preview
//preview(explode=50);

// ***
// Call individual modules here to render them for printing
// ***
panel();
//screen_char_lcd_panel();
/*
difference(){
    cube([74,52,3]);
    translate([4,4,-1]){
        2_2_TFT_LCD();
    }
}
*/

// CCP1
LCD_MAX_SQUARE = 53;

//***
// module definitions
//***

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

module 2_2_TFT_LCD(){    
    // Measured with LCD facing forward, pins on the right.
    LENGTH=67.44;
    WIDTH=40.34;
    HEIGHT=1.62; //4.9;
    MOUNTING_HOLE_DIAMETER=3; // measured at 1.5, but we're using M2 bolts so...
    MOUNTING_HOLE_Z_OFFSET = -1;
        
    // mounting hole offsets
    // left, top
    TL = [1.45+(MOUNTING_HOLE_DIAMETER/2),WIDTH-(1.49+(MOUNTING_HOLE_DIAMETER/2)),MOUNTING_HOLE_Z_OFFSET];
    // left, bottom
    BL = [1.45+(MOUNTING_HOLE_DIAMETER/2),1.49+(MOUNTING_HOLE_DIAMETER/2),MOUNTING_HOLE_Z_OFFSET];
    // right, top
    TR = [LENGTH-(1.8+(MOUNTING_HOLE_DIAMETER/2)),WIDTH-(1.73+(MOUNTING_HOLE_DIAMETER/2)),MOUNTING_HOLE_Z_OFFSET];
    // right, bottom
    BR = [LENGTH-(1.8+(MOUNTING_HOLE_DIAMETER/2)),1.5+(MOUNTING_HOLE_DIAMETER/2),MOUNTING_HOLE_Z_OFFSET];
    
    // LCD screen itself
    LCD_MODULE_LENGTH=55.32;
    LCD_MODULE_WIDTH=40;
    LCD_MODULE_HEIGHT=4.50-HEIGHT;
        
    union(){
        // board
        color("green"){
            cube([LENGTH,WIDTH,HEIGHT]);
        }
        // screen
        translate([5.87,0,HEIGHT]){
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

module 2_16_char_LCD(){    
    // Measured with LCD facing forward, pins on the bottom.
    LENGTH=80;
    WIDTH=36.35;
    HEIGHT=1.56;
    MOUNTING_HOLE_DIAMETER=3; // measured at 1.5, but we're using M2 bolts so...
    MOUNTING_HOLE_Z_OFFSET = -1;
        
    // mounting hole offsets
    // left, top
    TL = [0.9+(MOUNTING_HOLE_DIAMETER/2),WIDTH-(0.9+(MOUNTING_HOLE_DIAMETER/2)),MOUNTING_HOLE_Z_OFFSET];
    // left, bottom
    BL = [0.9+(MOUNTING_HOLE_DIAMETER/2),0.9+(MOUNTING_HOLE_DIAMETER/2),MOUNTING_HOLE_Z_OFFSET];
    // right, top
    TR = [LENGTH-(0.9+(MOUNTING_HOLE_DIAMETER/2)),WIDTH-(0.9+(MOUNTING_HOLE_DIAMETER/2)),MOUNTING_HOLE_Z_OFFSET];
    // right, bottom
    BR = [LENGTH-(0.9+(MOUNTING_HOLE_DIAMETER/2)),0.9+(MOUNTING_HOLE_DIAMETER/2),MOUNTING_HOLE_Z_OFFSET];
    
    // LCD screen itself
    LCD_MODULE_LENGTH=71.52;
    LCD_MODULE_WIDTH=24.41;
    LCD_MODULE_HEIGHT=8.58-HEIGHT;
        
    union(){
        // board
        color("green"){
            cube([LENGTH,WIDTH,HEIGHT]);
        }
        // screen
        translate([4.2,6.66,HEIGHT]){
            color("black"){
                cube([LCD_MODULE_LENGTH,LCD_MODULE_WIDTH,LCD_MODULE_HEIGHT]);
            }
        }
    }
    
    // mounting holes
    translate(TL){
        cylinder(r=MOUNTING_HOLE_DIAMETER/2,h=LCD_MODULE_HEIGHT+0.6);
        translate([0,0,LCD_MODULE_HEIGHT+0.6]){
            cylinder(r=2,h=2);
        }
    }
    translate(BL){
        cylinder(r=MOUNTING_HOLE_DIAMETER/2,h=LCD_MODULE_HEIGHT+0.6);
        translate([0,0,LCD_MODULE_HEIGHT+0.6]){
            cylinder(r=2,h=2);
        }
    }
    translate(TR){
        cylinder(r=MOUNTING_HOLE_DIAMETER/2,h=LCD_MODULE_HEIGHT+0.6);
        translate([0,0,LCD_MODULE_HEIGHT+0.6]){
            cylinder(r=2,h=2);
        }
    }
    translate(BR){
        cylinder(r=MOUNTING_HOLE_DIAMETER/2,h=LCD_MODULE_HEIGHT+0.6);
        translate([0,0,LCD_MODULE_HEIGHT+0.6]){
            cylinder(r=2,h=2);
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
            translate([0,0,WALL_THICKNESS]){
                cube([SMALL_PANEL_LENGTH-(FRAME_THICKNESS*2),SMALL_PANEL_WIDTH-(FRAME_THICKNESS*2),WALL_THICKNESS+2]);
            }
            translate([subpanel_length/2,subpanel_width/2,-1]){
                cylinder(r=7/2,h=6);
            }
        }
        
        // small subpanel B
        translate([BASE_LENGTH*.80+FRAME_THICKNESS,BASE_WIDTH*.53+FRAME_THICKNESS,-1]){
            subpanel_length = SMALL_PANEL_LENGTH-(FRAME_THICKNESS*2);
            subpanel_width = SMALL_PANEL_WIDTH-(FRAME_THICKNESS*2);
            
            translate([subpanel_length-(subpanel_length/3),subpanel_width/2,-WALL_THICKNESS-1]){
                cylinder(r=13/2,h=(WALL_THICKNESS*2)+2);
            }
            translate([0,0,WALL_THICKNESS]){
                cube([SMALL_PANEL_LENGTH-(FRAME_THICKNESS*2),SMALL_PANEL_WIDTH-(FRAME_THICKNESS*2),WALL_THICKNESS+2]);
            }
        }
        
        // knob/button A
        translate([BASE_LENGTH*.80,BASE_WIDTH*.42,-1]){
            cylinder(r=RED_TOGGLE_RADIUS/2,h=(WALL_THICKNESS*2)+2);
        }
        
        // knob/button B
        translate([BASE_LENGTH*.90,BASE_WIDTH*.42,-1]){
            cylinder(r=SMALL_ILLUMINATED_BUTTON_RADIUS/2,h=(WALL_THICKNESS*2)+2);
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

// screen-sized panel with weird LED display
module screen_weird_led_panel(){
    difference(){
        cube([SCREEN_LENGTH,SCREEN_WIDTH,10]);
        translate([(SCREEN_LENGTH/2)-(26/2),(SCREEN_WIDTH/2)-(51/2),-1]){
            cube([26,51,12]);
        }
    }
}

// screen-sized panel with LCD character display & 2 pots
module screen_char_lcd_panel(){
    difference(){
        cube([SCREEN_LENGTH,SCREEN_WIDTH,4]);
        translate([(SCREEN_LENGTH*.68)-(26/2),(SCREEN_WIDTH/2)-(80/2),-4.5]){
            rotate([0,0,90]){
                2_16_char_LCD();
            }
        }
        // B10K pots
        translate([SCREEN_LENGTH-(SCREEN_LENGTH/4),SCREEN_WIDTH/4,-1]){
            cylinder(r=7/2,h=6);
        }
        translate([SCREEN_LENGTH-(SCREEN_LENGTH/4),SCREEN_WIDTH-(SCREEN_WIDTH/4),-1]){
            cylinder(r=7/2,h=6);
        }
    }
}


// screen-sized panel with cluster of 3 10mm LEDs
module screen_3_led_panel(){
    difference(){
        cube([SCREEN_LENGTH,SCREEN_WIDTH,12]);
        translate([(SCREEN_LENGTH/2),(SCREEN_WIDTH/2)+5,-2]){
            led_10();
        }
        translate([(SCREEN_LENGTH/2)-6,(SCREEN_WIDTH/2)-5,-2]){
            led_10();
        }
        translate([(SCREEN_LENGTH/2)+6,(SCREEN_WIDTH/2)-5,-2]){
            led_10();
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
module large_4_led_panel(){
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

module large_led_panel(){
    difference(){
        large_panel(10);
        translate([LARGE_PANEL_LENGTH/2,LARGE_PANEL_WIDTH/2,-5]){
            led_10(color="green");
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

// small panel with 1 large illuminated pushbutton
module small_panel_1_large_illuminated_button(){
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
module preview(explode=0){
    translate([BASE_LENGTH*.10,(BASE_WIDTH/2)-(SCREEN_WIDTH/2),0]){
        screen_char_lcd_panel();
    }
    translate([BASE_LENGTH*.40,BASE_WIDTH*.40,0]){
        // large panel goes here
    }
    translate([BASE_LENGTH*.60+FRAME_THICKNESS,BASE_WIDTH*.53+FRAME_THICKNESS,2]){
        subpanel_length = SMALL_PANEL_LENGTH-(FRAME_THICKNESS*2);
        subpanel_width = SMALL_PANEL_WIDTH-(FRAME_THICKNESS*2);
        // small subpanel 1 goes here
        translate([(subpanel_length/2)-(67.44/2),(subpanel_width/2)-(40.34/2),0]){
            //2_2_TFT_LCD();
        }
    }
    translate([BASE_LENGTH*.40,BASE_WIDTH*.16,0]){
        led_bargraph(length=160, width=15, depth=11, led_count=10);
    }
    translate([0,0,(WALL_THICKNESS*2)+explode]){
        // base panel
        panel();
        // panel meter
        translate([BASE_LENGTH*.10,(BASE_WIDTH/2)-(SCREEN_WIDTH/2),explode+(WALL_THICKNESS*2)]){
            screen_frame();
        }
    }        
}