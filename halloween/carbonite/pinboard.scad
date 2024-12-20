/*

    A print-in-place "pinboard art toy".
    
    Muts be printed as shown.  Currently tested with .4 layer height, 15% rectilinear 
    infill and no brim or support.
    
    Ender 3 build envelope is 220x220x250.  220mm is about 8.66 inches.
    Doorframe is 3'x7'.
    
    We could safely print 8"x8" (203.2mmx203.2mm) panels on the Ender 3.  It would take 4.5 of these panels to make a row, and about 9 rows like this to fill the door.
    
    We could make 6"x6" (152.4mmx152.4mm) panels and it would take an even 6 panels to make a row, and 12 rows to fill the door (72 panels total)
    
    "normal" settings (15% infill): 2 days, 9 hours, 503.25g
    no infill:                      1 day 22 hours, 36 min, 374.84g
    "fast" (100mm/s)                1 day 22 hours 13 min, 374.84 ???
    
    we have 21 + 29 = 50 days = 1200 hours
    hours with "normal" and no fill: 47 (3384 total)
    two printers: 1692
    three printers: 1128
    


*/
TOLERANCE = 1.0;
X_OFFSET = 2;
Y_OFFSET = 0;

// 300x300x25 is roughly a foot square and an inch thick
// In order for panels to fit together properly, the length
// needs to be a specific multiple (for example, 24 seems to work).
// I'm not sure yet exactly what this is but until I figure it
// out this note is here to remind me to think about it.
// One possibility is that the "plug" should align on-center
// with the center of the adjacent pin...
PANEL_LENGTH = 152.4; //24; //24;  // min: 24
PANEL_WIDTH = 152.4; //; //24;   // min: 24
PANEL_THICKNESS = 25;

// we'll start with the shaft, but I have a better idea for the final form
PIN_DIAMETER = 5;
HOLE_DIAMETER = PIN_DIAMETER + TOLERANCE;

PIN_HOLES_LENGTH = PANEL_LENGTH/(HOLE_DIAMETER*2);
PIN_HOLES_WIDTH = PANEL_WIDTH/(HOLE_DIAMETER*2);

//$fn=20;

// TODO: Fix the pin placement/loops so we don't add loose pins.

// panel
difference(){
    cube([PANEL_LENGTH,PANEL_WIDTH,PANEL_THICKNESS]);
    // pin holes
    translate([X_OFFSET,0,0]){
        for (x=[0:PIN_HOLES_LENGTH]){
            // offset each row
            translate([0,HOLE_DIAMETER*(x%2),0]){
                for(y=[0:PIN_HOLES_WIDTH]){
                    translate([x*(HOLE_DIAMETER*2),y*(HOLE_DIAMETER*2),0]){
                        pin(HOLE_DIAMETER,PANEL_THICKNESS);
                    }
                }
            }
        }
    }
    // Add a row of "sockets" for connecting panels together.
    translate([1,HOLE_DIAMETER,5]){
        for(y=[0:PIN_HOLES_WIDTH]){
            translate([0,y*(HOLE_DIAMETER*2),0]){
                // Reduced tolerance to /4 for a tighter fit +(TOLERANCE/4)
                //cylinder(r=(HOLE_DIAMETER/4)+(TOLERANCE/32),PANEL_THICKNESS);
                #cylinder(r1=TOLERANCE,r2=HOLE_DIAMETER/4,PANEL_THICKNESS);
            }
        }
    }
}

// pins
translate([X_OFFSET,0,0]){
    for (x=[0:PIN_HOLES_LENGTH]){
        translate([0,HOLE_DIAMETER*(x%2),0]){
            for(y=[0:PIN_HOLES_WIDTH]){
                translate([x*(HOLE_DIAMETER*2),y*(HOLE_DIAMETER*2),0]){
                    pin(PIN_DIAMETER, PANEL_THICKNESS*2);
                }
            }
        }
    }
}

// Add a row of "plugs" for connecting panels together.
// TODO: add a "cone" to the bottom to improve unsupported printing
translate([PANEL_LENGTH+1,HOLE_DIAMETER,6]){
    for(y=[0:PIN_HOLES_WIDTH-1]){
        translate([0,y*(HOLE_DIAMETER*2),0]){
            //cylinder(r=HOLE_DIAMETER/4,PANEL_THICKNESS-11);
            #cylinder(r1=TOLERANCE,r2=HOLE_DIAMETER/4,PANEL_THICKNESS-11);
        }
    }
}

// pin
module pin(diameter, height){    
    cylinder(r=diameter/2,h=height);
    cylinder(r1=diameter,r2=diameter/2,h=6);
    translate([0,0,height-6]){
        // TODO: the h parameter should be dynamic, and ideally
        // the cone shape has a 45 degree angle.
        cylinder(r1=diameter/2,r2=diameter,h=6);
    }    
}