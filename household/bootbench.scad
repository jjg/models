// top
cube([40,1.5,10]);

// legs
translate([3.5,1.5,0]){
	difference(){
		cube([1.5, 18.5, 10]);
			translate([-1,21,-2.5]){
			rotate([45,0,0]){
				cube([3,10,10]);
			}
		}
	}
}

translate([35,1.5,0]){
	difference(){
		cube([1.5, 18.5, 10]);
			translate([-1,21,-2.5]){
			rotate([45,0,0]){
				cube([3,10,10]);
			}
		}
	}
}

// shelf
translate([5,8.5,0]){
	cube([30,1.5,10]);
}

// shelf brace
translate([3.5,7.5,-1.5]){
	cube([33,3.5,1.5]);
}

// leg braces
translate([0,0,-1.5]){
	difference(){
		cube([40,3.5,1.5]);
		translate([0,1.5,-.25]){
			rotate([0,0,45]){
				cube([3,3,2]);
			}
		}
		translate([40,1.5,-.25]){
			rotate([0,0,45]){
				cube([3,3,2]);
			}
		}
	}
}
translate([0,0,10]){
	difference(){
		cube([40,3.5,1.5]);
		translate([0,1.5,-.25]){
			rotate([0,0,45]){
				cube([3,3,2]);
			}
		}
		translate([40,1.5,-.25]){
			rotate([0,0,45]){
				cube([3,3,2]);
			}
		}
	}
}