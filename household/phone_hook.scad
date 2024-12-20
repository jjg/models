difference(){
	translate([-40,-20,0]){
		cube([80,45,20]);
	}
	translate([0,0,-20]){
		rotate([-30,0,0]){
			cylinder(r=30,h=60,$fn=100);
		}
	}

	// mounting holes
	translate([33,0,-1]){
		cylinder(r=2.5,h=30,$fn=50);
	}
	translate([-33,0,-1]){
		cylinder(r=2.5,h=30,$fn=50);
	}
}