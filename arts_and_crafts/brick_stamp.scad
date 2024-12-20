
// base
cube([50,40,25]);

// bricks
translate([(50/2)-(20/2),7,-10]){
    brick();
    
    translate([13,(40/2)-5,0]){
        brick();
    }
    translate([-25/2,(40/2)-5,0]){
        brick();
    }
}



module brick(){
    
    // OD 20x10x10
    
    difference(){
        cube([20,10,10]);
        translate([3/2,3/2,0]){
            cube([17,7,10]);
        }
        
        // sharpen the edge
        translate([10,0,0]){
            #polyhedron(
              points=[ [10,10,0],[10,-0,0],[-10,0,0],[-10,10,0], // the four points at base
                       [0,5,10]  ],                                 // the apex point 
              faces=[ [0,1,4],[1,2,4],[2,3,4],[3,0,4],              // each triangle side
                          [1,0,3],[2,1,3] ]                         // two triangles for square base
             );
        }
    }
}