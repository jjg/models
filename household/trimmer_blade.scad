LENGTH = 78;
WIDTH = 13;
HEIGHT = 2;
MOUNTING_HOLE_DIAMETER = 6;

// TODO: Round corners

difference(){
    cube([LENGTH, WIDTH, HEIGHT]);
    
    // Mounting hole
    translate([(MOUNTING_HOLE_DIAMETER/2)+4, (WIDTH/2),0]){
        cylinder(r=MOUNTING_HOLE_DIAMETER/2, h=HEIGHT);
    }
    
    // TODO: Cutter scallops
}