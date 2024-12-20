// Ewok ear formers

HEIGHT = 62;
WIDTH = 75;
DEPTH = 10;
POST_HEIGHT = 25;
POST_WIDTH = 35;
POST_DEPTH = 2.5;

// Visible ear
cylinder(r=WIDTH/2,h=10);
translate([0,-WIDTH/2,0]){
    cube([HEIGHT, WIDTH, DEPTH]);
    
    // Mounting Post
    translate([HEIGHT,(WIDTH/2)-(POST_WIDTH/2),0]){
        cube([POST_HEIGHT, POST_WIDTH, POST_DEPTH]);
    }
}