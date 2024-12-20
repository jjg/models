include <../components/led.scad>

/*
    Electronic "tiki torch" flame module
    
    TODO:
    * Revisit LED wire routing channel (tape isn't great)
    
    Standard canister measurements:
    
    can diameter: ~73mm
    can height: ~112mm
    top height: ~9.5mm
    top diameter: ~91mm
    second top height: ~9.8mm
    second top diameter: ~50mm
    third top height: 8.5mm
    third top di"../components/led.scad"ameter: ~30mm
    
    Wiring notes:
    * red: power in positive (90mm)
    * green: power in gnd (70mm)
    * yellow: motor + (note: wired to - terminal on my motors) (85mm)
    * black: motor - (60mm)
    * LED +/- connected in parallel with power in
*/

CAN_DIAMETER = 72; //73;
CAN_HEIGHT = 100;//112;
FLANGE_DIAMETER = 91;
FLANGE_HEIGHT = 12.5;//9.5;
THREAD_TOP_DIAMETER = 50;
THREAD_TOP_HEIGHT = 9.8;
TIP_DIAMETER = 30;
TIP_HEIGHT = 8.5;

FAN_DEPTH = 20;

MOTOR_DIAMETER = 24;
MOTOR_LENGTH = 30;

WALL_THICKNESS = 3;
TOLERANCE = 1;

// Rotates object around specified point
module rotate_about_pt(z, y, pt) {
    translate(pt)
        rotate([0, y, z])
            translate(-pt)
                children();   
}

// Basic replica of standard fuel canister (for referenece)
module stock_tiki(){
    cylinder(r=CAN_DIAMETER/2,h=CAN_HEIGHT);
    translate([0,0,CAN_HEIGHT]){
        cylinder(r=FLANGE_DIAMETER/2,h=FLANGE_HEIGHT);
        translate([0,0,FLANGE_HEIGHT]){
            cylinder(r=THREAD_TOP_DIAMETER/2,h=THREAD_TOP_HEIGHT);
            translate([0,0,THREAD_TOP_HEIGHT]){
                cylinder(r=TIP_DIAMETER/2,h=TIP_HEIGHT);
            }
        }
    }
}

module fan(){
    
    // A fan with the following constraints:
    // * Flow over pressure
    // * Fits into canister
    // * Works with an off-the-shelf motor (ideally ~3vdc)
    // * Prints without supports
    
    HUB_HEIGHT = 5;
    MOTOR_SHAFT_DIAMETER = 2;
    BLADE_LENGTH = (CAN_DIAMETER/2)-WALL_THICKNESS-TOLERANCE;
    
    $fn=25;
    
    difference(){
        union(){
            
            // hub
            translate([0,0,-.3]){
                cylinder(r=5,h=6);
            }
            
            // blades
            translate([0,0,2.5]){
                rotate([90,30,0]){
                    difference(){
                        resize([10,0,0]){
                            cylinder(r=3/2,h=BLADE_LENGTH);
                        }
                        translate([-2,-0.75,0]){
                            resize([14,0,0]){
                                cylinder(r=3/2,h=BLADE_LENGTH);
                            }
                        }
                    }
                }
            }
            
            translate([0,0,2.5]){
                rotate([90,30,90]){
                    difference(){
                        resize([10,0,0]){
                            cylinder(r=3/2,h=BLADE_LENGTH);
                        }
                        translate([-2,-0.75,0]){
                            resize([14,0,0]){
                                cylinder(r=3/2,h=BLADE_LENGTH);
                            }
                        }
                    }
                }
            }
            
            translate([0,0,2.5]){
                rotate([90,30,180]){
                    difference(){
                        resize([10,0,0]){
                            cylinder(r=3/2,h=BLADE_LENGTH);
                        }
                        translate([-2,-0.75,0]){
                            resize([14,0,0]){
                                cylinder(r=3/2,h=BLADE_LENGTH);
                            }
                        }
                    }
                }
            }
            
            translate([0,0,2.5]){
                rotate([90,30,270]){
                    difference(){
                        resize([10,0,0]){
                            cylinder(r=3/2,h=BLADE_LENGTH);
                        }
                        translate([-2,-0.75,0]){
                            resize([14,0,0]){
                                cylinder(r=3/2,h=BLADE_LENGTH);
                            }
                        }
                    }
                }
            }            
        }
        
        // motor shaft hole
        translate([0,0,-1]){
            cylinder(r=MOTOR_SHAFT_DIAMETER/2,h=HUB_HEIGHT*2);
        }
    }
}

// Fan test
//fan();

module flame_holder(){
    difference(){
        // top flange
        difference(){
            cylinder(r=FLANGE_DIAMETER/2,h=FLANGE_HEIGHT);
            cylinder(r=(CAN_DIAMETER-WALL_THICKNESS)/2,h=FLANGE_HEIGHT);
        }
        
        // Cloth holder mounts
        translate([-(FLANGE_DIAMETER/2)+(WALL_THICKNESS),-WALL_THICKNESS-(TOLERANCE/2),WALL_THICKNESS]){
            cube([FLANGE_DIAMETER-(WALL_THICKNESS*2),(WALL_THICKNESS*2)+TOLERANCE+0.5,FLANGE_HEIGHT]);
            
            rotate_about_pt(90,0,[(FLANGE_DIAMETER-(WALL_THICKNESS*2))/2,WALL_THICKNESS+(TOLERANCE/2)]){
                cube([FLANGE_DIAMETER-(WALL_THICKNESS*2),(WALL_THICKNESS*2)+TOLERANCE+0.5,FLANGE_HEIGHT]);
            }
        }
    }
}

// Flame holder test
//flame_holder();

module flame_clamp(){
        
    // Cloth holder
    difference(){
        union(){
            cube([FLANGE_DIAMETER-(WALL_THICKNESS*3),(WALL_THICKNESS*2)+1,FLANGE_HEIGHT-WALL_THICKNESS]);
            
            // LED mount
            translate([((FLANGE_DIAMETER-(WALL_THICKNESS*3))/2)-10,-2.5,0]){
                cylinder(r=12/2,h=9.5);
            }
        }
        
        // Groove for fabric
        translate([WALL_THICKNESS,WALL_THICKNESS-((WALL_THICKNESS/4)-1),0]){
            cube([FLANGE_DIAMETER-(WALL_THICKNESS*2),WALL_THICKNESS/4,FLANGE_HEIGHT]);
        }
        
        // Hole for LED mount
        translate([((FLANGE_DIAMETER-(WALL_THICKNESS*3))/2)-10,-2.5,0]){
            cylinder(r=10/2,h=10);
        }
        
        // Notch the center so two can overlap
        translate([((FLANGE_DIAMETER-(WALL_THICKNESS*3))/2)-WALL_THICKNESS,0,FLANGE_HEIGHT/2]){
            cube([(WALL_THICKNESS*2)+1,(WALL_THICKNESS*2)+1,FLANGE_HEIGHT/2]);
        }
    }
}

// Flame clamps test
//flame_clamp();


module motor_mount(){    
    difference(){
        union(){
            translate([-(CAN_DIAMETER/2),-WALL_THICKNESS-(TOLERANCE/2),0]){
                cube([CAN_DIAMETER,(WALL_THICKNESS*2)+TOLERANCE,FLANGE_HEIGHT]);
                
                rotate_about_pt(90,0,[CAN_DIAMETER/2,WALL_THICKNESS+(TOLERANCE/2)]){
                    cube([CAN_DIAMETER,(WALL_THICKNESS*2)+TOLERANCE,FLANGE_HEIGHT]);
                }
            }
            cylinder(r=(MOTOR_DIAMETER+WALL_THICKNESS)/2,h=MOTOR_LENGTH*0.80);
        }        
        
        translate([0,0,WALL_THICKNESS*2]){
            cylinder(r=(MOTOR_DIAMETER+TOLERANCE)/2,h=MOTOR_LENGTH);
        }
        
        // Hole for wires
        translate([-MOTOR_DIAMETER/2,-10/2,0]){
            cube([MOTOR_DIAMETER,10,WALL_THICKNESS*2]);
        }        
    }
    
    // TODO: Move all these magic numbers up into constants
    
    // DC jack mount
    // depth: 3mm, diameter: 8mm
    translate([(MOTOR_DIAMETER/2)+1.5,(MOTOR_DIAMETER/2)+1.5,0]){
        difference(){
            union(){
                cylinder(r=(10+WALL_THICKNESS)/2,h=3);
                translate([5,-15,0]){
                    rotate_about_pt(45,0,[5,5]){
                        cube([8,38,3]);
                    }
                }
            }
            cylinder(r=(8+TOLERANCE)/2,h=3);
        }
    }
    
    // Speed control mount
    // depth: 2.5mm, diameter: 7mm
    translate([-(MOTOR_DIAMETER/2)-1,-(MOTOR_DIAMETER/2)-1,0]){
        difference(){
            union(){
                cylinder(r=(10+WALL_THICKNESS)/2,h=2.5);
                translate([5,-15,0]){
                    rotate_about_pt(45,0,[5,5]){
                        cube([8,38,2.5]);
                    }
                }
            }
            cylinder(r=(7+TOLERANCE)/2,h=3);
        }
    }    
}

// Motor mount test
//motor_mount();


// Assemble!
// TODO: Can should be a specific module or perhaps grouped with flame holder
union(){
    difference(){
        union(){
            cylinder(r=CAN_DIAMETER/2,h=CAN_HEIGHT);
            translate([0,0,CAN_HEIGHT-10]){
                cylinder(r1=CAN_DIAMETER/2,r2=FLANGE_DIAMETER/2,h=10);
            }
        }

        translate([0,0,0]){
            cylinder(r=(CAN_DIAMETER-WALL_THICKNESS)/2,h=CAN_HEIGHT+WALL_THICKNESS);
        }
        
        // Add a channel for LED wires
       translate([-CAN_DIAMETER/2.8,-CAN_DIAMETER/2.9,0]){
            cylinder(r=2.5,h=CAN_HEIGHT-12);
        }

    }

    motor_mount();

    translate([0,0,CAN_HEIGHT]){
        flame_holder();
    }
}
/*
translate([0,0,MOTOR_LENGTH]){
    fan();
}
*/
/*
translate([-(CAN_DIAMETER/2)-(WALL_THICKNESS*1.5),-WALL_THICKNESS,CAN_HEIGHT+3]){
    flame_clamp();
    translate([0,0,10]){
        rotate_about_pt(90,0,[(FLANGE_DIAMETER-(WALL_THICKNESS*3))/2,WALL_THICKNESS]){
            // TODO: Figure out how to get this to rotate 180 around Y
            flame_clamp();          
        }
    }
}
*/