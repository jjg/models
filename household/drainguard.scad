union(){
// cover
difference(){
	cylinder(r=27.5,h=2,$fn=50);

	// center hole
	cylinder(r=2,h=5,$fn=15);

	// inner ring of holes
	for(i=[0:10]){
		rotate(i*360/10, [0,0,1]){
			translate([8,0,0]){
					cylinder(r=2,h=5,$fn=15);
			}
		}
	}

	// mid ring of holes
	for(i=[0:24]){
		rotate(i*360/15, [0,0,1]){
			translate([13,0,0]){
					cylinder(r=2,h=5,$fn=15);
			}
		}
	}

	// outer ring of holes
	for(i=[0:24]){
		rotate(i*360/15, [0,0,1]){
			translate([20,0,0]){
					cylinder(r=2,h=5,$fn=15);
			}
		}
	}
}

// drain tube
difference(){
	cylinder(r=17.5,h=15,$fn=50);
	cylinder(r=16,h=16,$fn=50);
	translate([-20,-5,0]){
		cube([50,10,16]);
	}
}
}