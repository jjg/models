LENGTH = 25;

union(){

	// clamp
	difference(){
		cylinder(r=13,h=LENGTH,$fn=100);

		// hole
		translate([0,0,-1]){
			cylinder(r=(22/2),h=LENGTH+2,$fn=100);
		}

		// slot
		translate([-8,0,-1]){
			cube([17,20,LENGTH+2]);
		}
	}

	// blower screw mount
	translate([0,-15,0]){
		difference(){

			// body
			cylinder(r=4,h=LENGTH,$fn=100);
	
			// hole
			translate([0,0,-1]){
				cylinder(r=2,h=LENGTH+2,$fn=100);
			}
		}
	}
}