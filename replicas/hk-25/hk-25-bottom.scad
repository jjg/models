speaker_diameter = 58;
terminal_width = 10.7;
terminal_height = 10.1;
terminal_depth = 7.6;

difference(){
	union(){
		difference(){
			// bottom bounding "box"
			cylinder(r=(speaker_diameter/2)+2,h=speaker_diameter,$fn=100);
			
			// center hole
			translate([0,0,1]){
				cylinder(r=speaker_diameter/2.2,h=speaker_diameter,$fn=100);
			}
		}

		// terminal holder
		translate([(speaker_diameter/2)-(terminal_depth+2),-(terminal_width+8)/2,0]){
			cube([terminal_depth+2, terminal_width+8, terminal_height+3]);
		}
	}

	// terminal hole
	translate([(speaker_diameter/2)-terminal_depth,-(terminal_width+2)/2,-1]){
		#cube([terminal_depth+2, terminal_width+2, terminal_height+3]);
	}
}