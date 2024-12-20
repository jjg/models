BELT_LOOP_OPENING = 45;
BUCKLE_LENGTH = 150;
BUCKLE_WIDTH = 90;
BUCKLE_DEPTH = 10;


// Uncomment the part you want to render:
//buckle_front();
buckle_back();
//belt_hole_post();


// buckles
module buckle_front(){
    difference(){
        color("silver"){
            union(){
                // base
                linear_extrude(BUCKLE_DEPTH){
                    polygon(points=[
                        [0,BUCKLE_WIDTH/2],
                        [BUCKLE_LENGTH/4,BUCKLE_WIDTH],
                        [BUCKLE_LENGTH-(BUCKLE_LENGTH/4),BUCKLE_WIDTH],
                        [BUCKLE_LENGTH,BUCKLE_WIDTH/2],
                        [BUCKLE_LENGTH-(BUCKLE_LENGTH/4),0],
                        [BUCKLE_LENGTH/4,0]
                    ]);
                }

                // holster strap loop
                color("silver"){
                    translate([BUCKLE_LENGTH*0.490,20,0]){
                        rotate([0,0,-45]){
                            difference(){
                                cube([BELT_LOOP_OPENING*1.25,BELT_LOOP_OPENING*1.25,BUCKLE_DEPTH]);
                                translate([(BELT_LOOP_OPENING*0.25)/2,(BELT_LOOP_OPENING*0.25)/2,-1]){
                                    cube([BELT_LOOP_OPENING,BELT_LOOP_OPENING,BUCKLE_DEPTH+2]);
                                }
                            }
                        }
                    }
                }
                
                // left "wing"
                translate([-BUCKLE_WIDTH*0.20,BUCKLE_WIDTH*0.40,BUCKLE_DEPTH/2]){
                    rotate([0,0,-10]){
                        color("silver"){
                            cube([BELT_LOOP_OPENING,BUCKLE_WIDTH*0.6,BUCKLE_DEPTH/2]);
                        }
                        color("gray"){
                            translate([BELT_LOOP_OPENING*0.25,(BUCKLE_WIDTH*0.6)*0.25,-BUCKLE_DEPTH/2]){
                                cylinder(r=3,h=BUCKLE_DEPTH/2);
                            }
                            translate([BELT_LOOP_OPENING*0.25,(BUCKLE_WIDTH*0.6)*0.75,-BUCKLE_DEPTH/2]){
                                cylinder(r=3,h=BUCKLE_DEPTH/2);
                            }
                        }
                    }
                }

                // right "wing"
                translate([BUCKLE_WIDTH*1.8,BUCKLE_WIDTH,BUCKLE_DEPTH/2]){
                    rotate([0,0,187]){
                        color("silver"){
                            cube([BELT_LOOP_OPENING,BUCKLE_WIDTH*0.6,BUCKLE_DEPTH/2]);
                        }
                        color("gray"){
                            translate([BELT_LOOP_OPENING*0.25,(BUCKLE_WIDTH*0.6)*0.25,-BUCKLE_DEPTH/2]){
                                cylinder(r=3,h=BUCKLE_DEPTH/2);
                            }
                            translate([BELT_LOOP_OPENING*0.25,(BUCKLE_WIDTH*0.6)*0.75,-BUCKLE_DEPTH/2]){
                                cylinder(r=3,h=BUCKLE_DEPTH/2);
                            }
                        }
                    }
                }                
                
            }
        }
        
        // Holes for belt posts
        translate([BUCKLE_LENGTH*0.1,BUCKLE_WIDTH*0.65,BUCKLE_DEPTH*0.4]){
            belt_hole_post();
        }
        translate([BUCKLE_LENGTH*0.9,BUCKLE_WIDTH*0.65,BUCKLE_DEPTH*0.4]){
            rotate([0,0,180]){
                belt_hole_post();
            }
        }
    }
}

module buckle_back(){
    difference(){
        color("silver"){
            union(){
                // base
                linear_extrude(BUCKLE_DEPTH){
                    polygon(points=[
                        [0,BUCKLE_WIDTH/2],
                        [BUCKLE_LENGTH/4,BUCKLE_WIDTH],
                        [BUCKLE_LENGTH-(BUCKLE_LENGTH/4),BUCKLE_WIDTH],
                        [BUCKLE_LENGTH,BUCKLE_WIDTH/2],
                        [BUCKLE_LENGTH-(BUCKLE_LENGTH/4),0],
                        [BUCKLE_LENGTH/4,0]
                    ]);
                }

                // holster strap loop
                translate([BUCKLE_LENGTH*0.490,20,0]){
                    rotate([0,0,-45]){
                        difference(){
                            cube([BELT_LOOP_OPENING*1.25,BELT_LOOP_OPENING*1.25,BUCKLE_DEPTH]);
                            translate([(BELT_LOOP_OPENING*0.25)/2,(BELT_LOOP_OPENING*0.25)/2,-1]){
                                cube([BELT_LOOP_OPENING,BELT_LOOP_OPENING,BUCKLE_DEPTH+2]);
                            }
                        }
                    }
                }
                
                // belt loop
                loop_height = 12;
                translate([(BUCKLE_LENGTH/2)-(20/2),(BUCKLE_WIDTH/2)-((BELT_LOOP_OPENING*1.25)/2),-loop_height]){
                    difference(){
                        cube([20,BELT_LOOP_OPENING*1.25,loop_height]);
                        translate([-1,(BELT_LOOP_OPENING*1.25)/2-(BELT_LOOP_OPENING/2),3]){
                            cube([22,BELT_LOOP_OPENING,loop_height]);
                        }
                    }
                }
            }
        }
    }
}

// belt post
module belt_hole_post(tolerance=0){
    $fn=25;
    union(){
        base = (4.75+tolerance)/2;
        top = (6+tolerance)/2;
        cylinder(r=base,h=BUCKLE_DEPTH);
        translate([-0.15,0,BUCKLE_DEPTH-1]){
            rotate([0,20,0]){
                cylinder(r1=base,r2=base,h=BUCKLE_DEPTH/2);
            }
        }
    }
}