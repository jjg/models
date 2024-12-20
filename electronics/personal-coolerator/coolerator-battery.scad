BATTERY_DIAMETER = 21;

cylinder(r=(BATTERY_DIAMETER/2)+3,h=50);

module battery(){
  BATTERY_DIAMETER = 22;
  BATTERY_LENGTH = 102;
  USB_OFFSET = 5;
  USB_LENGTH = 12;
  USB_WIDTH = 5;

  difference(){
    union(){
      cylinder(r=BATTERY_DIAMETER/2, h=BATTERY_LENGTH);
      
      // clip
      translate([-9.5/2,-(BATTERY_DIAMETER/2)-1,0]){
        cube([9.5,BATTERY_DIAMETER/2,39]);
      }
    }
    // USB input
    translate([-USB_LENGTH/2, (BATTERY_DIAMETER/2)-USB_OFFSET-USB_WIDTH,-1]){
      cube([USB_LENGTH,USB_WIDTH,10]);
    }
  }
}