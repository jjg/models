include <fan_40mm.scad>
include <coolerator-lid.scad>
include <coolerator-handle.scad>
include <coolerator-duct.scad>

CUP_DIAMETER = 86;

// cup lid
color("red")
lid(CUP_DIAMETER+3, CUP_DIAMETER);

// fan
color("green")
translate([-20,-10,35]){
    rotate([-90,0,0]){
        fan();
    }
}

// handle
color("blue")
translate([0,10,40]){
    handle();
}

// duct
color("orange")
translate([-20/2, -CUP_DIAMETER/3, 5]){
  duct(40,25);
}