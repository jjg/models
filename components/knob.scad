module knob(diameter=10,height=10,shaft_diameter=6,shaft_d=false,skirt=0,uncut_height=3,knurls=5,position=-1,topper=false,tolerance=1,scale_start=-1,scale_end=-1){
    difference(){
        union(){
            hull(){
                cylinder(r=diameter/2,h=height);
                
                // positive position indicator
                if(position > 0){
                    // NOTE: if there's no knurls to align with, default to 5
                    indicator_pos = 5;
                    if(knurls > 0){
                        indicator_pos = knurls;
                    }
                    rotate([0,0,(360/indicator_pos)*1.5]){
                        translate([diameter/2.5,-0.25,0]){
                            cube([4,0.5,height]);
                        }
                    }
                }
                
                // topper
                if(topper){
                    translate([0,0,height]){
                        sphere(r=diameter/2);
                    }
                }
            }
            
            // skirt
            if(skirt > 0){
                difference(){
                    cylinder(r=skirt/2,h=uncut_height);
                    
                    // add scale
                    if(scale_start > -1 && scale_end > -1){
                        
                        // TODO: calculate text size dynamically
                        text_size = 3;
                        scale_count = scale_end - scale_start+1;
                        for(i=[scale_start:scale_end]){
                            rotate([0,0,(360/scale_count)*i]){
                                
                                // TODO: adjust y offset based on character count
                                // TODO: adjust z rotation to orient scale correctly
                                translate([skirt/2.8,-text_size/2,uncut_height/2]){
                                    linear_extrude(uncut_height){
                                        text(str(i),size=text_size);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        
        translate([0,0,-uncut_height]){
            
            // pot post opening
            cylinder(r=(shaft_diameter+(tolerance/2))/2,h=height);
            
            // knurls
            if(knurls > 0){
                for(i=[1:knurls]){
                    rotate([0,0,(360/knurls)*i]){
                        translate([diameter/1.5,0,uncut_height*2]){
                            cylinder(r=diameter/4,h=height+uncut_height);
                        }
                    }
                }
            }
            // negative position indicator
            if(position < 0){
                indicator_pos = 5;
                if(knurls > 0){
                    indicator_pos = knurls;
                }
                rotate([0,0,(360/indicator_pos)*1.5]){
                    translate([diameter/3,-0.5,uncut_height*2]){
                        cube([4,1,height]);
                    }
                }
            }
        }
    }
    
    // make the shaft hole D-shaped
    if(shaft_d){
        translate([-(shaft_diameter/2)-1,0,0]){
            cube([shaft_diameter+2,shaft_diameter,height]);
        }
    }
    
    // TODO: Make it possible for numbers to be raised instead of just inset
}

//knob(diameter=20,shaft_d=true,skirt=30,position=0,knurls=0,scale_start=1,scale_end=12);