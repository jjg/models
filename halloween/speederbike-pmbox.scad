PM_LENGTH = 51;
PM_WIDTH = 22.8;
PM_HEIGHT = 12.2;

BATTERY_LENGTH = 50;
BATTERY_WIDTH = 34;
BATTERY_HEIGHT = 10;

BOLT_DIAMETER = 3;

WALL_THICKNESS = 2;
TOLERANCE = 1;
BUFFER = 3;
BOX_HEIGHT = PM_HEIGHT + BATTERY_HEIGHT + BUFFER + (WALL_THICKNESS*2) + (TOLERANCE*2);

difference(){
    // main box 
    cube([PM_LENGTH+(WALL_THICKNESS*2)+(TOLERANCE*2),
        BATTERY_WIDTH+(WALL_THICKNESS*2)+(TOLERANCE*2),
        BOX_HEIGHT
    ]);

    // opening for board
    translate([WALL_THICKNESS,WALL_THICKNESS,WALL_THICKNESS]){
        // Combined components outline
        cube([PM_LENGTH+(TOLERANCE*2),
            BATTERY_WIDTH+(TOLERANCE*2),
            BOX_HEIGHT
        ]);
    }
    
    /*
    // mounting bolt openings
    translate([6,6,0]){
        cylinder(r=2/2,h=PM_HEIGHT*2);
    }
    translate([6,PM_WIDTH+(WALL_THICKNESS*2)+(TOLERANCE*2)-5,0]){
        cylinder(r=2/2,h=PM_HEIGHT*2);
    }
    translate([(PM_LENGTH+(WALL_THICKNESS*2)+(TOLERANCE*2))-5,6,0]){
        cylinder(r=2/2,h=PM_HEIGHT*2);
    }
    translate([(PM_LENGTH+(WALL_THICKNESS*2)+(TOLERANCE*2))-5,PM_WIDTH+(WALL_THICKNESS*2)+(TOLERANCE*2)-5,0]){
        cylinder(r=2/2,h=PM_HEIGHT*2);
    }
    */
    
    // opening for wires
    translate([(PM_LENGTH+(WALL_THICKNESS*2)+(TOLERANCE*2))-(WALL_THICKNESS*2),(PM_WIDTH+(WALL_THICKNESS*2)+(TOLERANCE*2))/2-(18/2),6]){
        cube([WALL_THICKNESS*3, 18,5]);
    }
    
    // opening for USB-C
    translate([-1,(PM_WIDTH+(WALL_THICKNESS*2)+(TOLERANCE*2))/2-(15/2),4]){
        cube([WALL_THICKNESS*3, 15,9]);
    }
    
    /*
    // DEBUG: slice it in half 
    translate([-1,-1,16]){
    //translate([-1,-1,-1]){
        cube([PM_LENGTH+(WALL_THICKNESS*2)+(TOLERANCE*2)+2,PM_WIDTH+(WALL_THICKNESS*2)+(TOLERANCE*2)+2,PM_HEIGHT+(WALL_THICKNESS*2)+(TOLERANCE*2)]); 
        //cube([PM_LENGTH+(WALL_THICKNESS*2)+(TOLERANCE*2)+2,PM_WIDTH+(WALL_THICKNESS*2)+(TOLERANCE*2)+2,14]); 
    }
    */
}

// board mounting posts
translate([5.5,6,0]){
    difference(){
        cylinder(r=5/2,h=5);
        cylinder(r=1.5,h=6);
    }
}
translate([5.5,PM_WIDTH+(WALL_THICKNESS*2)+(TOLERANCE*2)-5,0]){
    difference(){
        cylinder(r=5/2,h=5);
        cylinder(r=1.5,h=6);
    }
}
translate([PM_LENGTH+0.2,6,0]){
    difference(){
        cylinder(r=5/2,h=5);
        cylinder(r=1.5,h=6);
    }
}
translate([PM_LENGTH+0.2,PM_WIDTH+(WALL_THICKNESS*2)+(TOLERANCE*2)-5,0]){
    difference(){
        cylinder(r=5/2,h=5);
        cylinder(r=1.5,h=6);
    }
}

// Cover mounting posts
translate([WALL_THICKNESS+1.5,WALL_THICKNESS+1.5,BOX_HEIGHT-5]){
    difference(){
        cylinder(r=5/2,h=5);
        cylinder(r=1.5,h=6);
    }
}
translate([PM_LENGTH+WALL_THICKNESS+0.5,WALL_THICKNESS+1.5,BOX_HEIGHT-5]){
    difference(){
        cylinder(r=5/2,h=5);
        cylinder(r=1.5,h=6);
    }
}
translate([WALL_THICKNESS+1.5,BATTERY_WIDTH+WALL_THICKNESS+WALL_THICKNESS-1.5,BOX_HEIGHT-5]){
    difference(){
        cylinder(r=5/2,h=5);
        cylinder(r=1.5,h=6);
    }
}
translate([PM_LENGTH+WALL_THICKNESS+0.5,BATTERY_WIDTH+WALL_THICKNESS+0.5,BOX_HEIGHT-5]){
    difference(){
        cylinder(r=5/2,h=5);
        cylinder(r=1.5,h=6);
    }
}


// cover
translate([0,0,BOX_HEIGHT+10]){
    difference(){
        cube([PM_LENGTH+(WALL_THICKNESS*2)+(TOLERANCE*2),
            BATTERY_WIDTH+(WALL_THICKNESS*2)+(TOLERANCE*2),
            WALL_THICKNESS
        ]);        
        translate([WALL_THICKNESS+1.5,WALL_THICKNESS+1.5,0]){
            cylinder(r=1.5,h=6);
        }
        translate([PM_LENGTH+WALL_THICKNESS+0.5,WALL_THICKNESS+1.5,0]){
            cylinder(r=1.5,h=6);
        }
        translate([WALL_THICKNESS+1.5,BATTERY_WIDTH+WALL_THICKNESS+WALL_THICKNESS-1.5,0]){
            cylinder(r=1.5,h=6);
        }
        translate([PM_LENGTH+WALL_THICKNESS+0.5,BATTERY_WIDTH+WALL_THICKNESS+0.5,0]){
            cylinder(r=1.5,h=6);
        }
    }
}
/*
// PM RP2040
translate([WALL_THICKNESS+TOLERANCE,WALL_THICKNESS+TOLERANCE+0.5,5]){
    color("blue"){
        import("5768 Feather RP2040 PropMaker.stl");
    }
}

// battery
translate([WALL_THICKNESS+TOLERANCE,
    WALL_THICKNESS+TOLERANCE,
    PM_HEIGHT + BUFFER]
){
    color("orange"){
        cube([50,34,10]);
    }
}
*/