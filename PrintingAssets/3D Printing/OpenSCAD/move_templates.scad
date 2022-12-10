// mode templates
include <variables.scad>;

translate([-tokenWidth*2,0,0]) templateStraight("1"); // Straight Template
translate([tokenWidth*3,0,0]) template45("2"); // Bank Template
template90("3"); // Turn Template
translate([-tokenWidth*4.5,0,0]) singleManeuver(); // All in one maneuver template

module templateStraight(theNum) {
    difference(){
        cube([tokenWidth,templateLength,tokenHeight]);
        
        translate([tokenWidth/2,-templateGapOffset,-1])
            rotate([0,0,135/2])
                cylinder(h=tokenHeight+2, d=tokenWidth, $fn=8);
        
        
        translate([tokenWidth/2,templateLength+templateGapOffset,-1])
            rotate([0,0,135/2])
                cylinder(h=tokenHeight+2, d=tokenWidth, $fn=8);
        
        translate([tokenWidth/7,templateLength/3,-1])
            linear_extrude(tokenHeight+2)
                text(theNum, size=25);
        
        
//        this just shows that the notches are exactly one token apart
//        translate([tokenWidth*1.35,tokenWidth*1.5,-1])
//            scale([1,1,1.5])
//                #token();
    }
}

module template45(theNum) {
    difference(){
        translate([-templateLength,0,0])
            rotate_extrude(angle = 45)
                translate([templateLength, 0, 0])
                square(size = [tokenWidth, tokenHeight]);
        
        
        translate([tokenWidth/2,-templateGapOffset,-1])
            rotate([0,0,135/2])
                cylinder(h=tokenHeight+2, d=tokenWidth, $fn=8);
        
        
        translate([-templateLength * sin(45/360)-(tokenWidth/1.6),-templateGapOffset+templateLength * cos(45/360)-tokenWidth/4,-1])
            rotate([0,0,135/2])
                    cylinder(h=tokenHeight+2, d=tokenWidth, $fn=8);
        
        
        translate([tokenWidth/8,templateLength/4,-1])
            rotate([0,0,30])
                linear_extrude(tokenHeight+2)
                    text(theNum, size=25);
        
        
    }
    
}

module template90(theNum) {
    difference(){
        translate([0,0,0])
            rotate_extrude(angle = 90)
                translate([templateLength/3, 0, 0])
                square(size = [tokenWidth, tokenHeight]);
        
        
        translate([tokenWidth*1.5,-templateGapOffset,-1])
            rotate([0,0,135/2])
                cylinder(h=tokenHeight+2, d=tokenWidth, $fn=8);
        
        
        translate([-templateGapOffset,templateLength/2,-1])
            rotate([0,0,135/2])
                cylinder(h=tokenHeight+2, d=tokenWidth, $fn=8);
        
        
        translate([tokenWidth/0.9,templateLength/6,-1])
            rotate([0,0,45])
                linear_extrude(tokenHeight+2)
                    text(theNum, size=25);
    }
}


// single maneuver template
module singleManeuver() {
    difference(){
        union() {
            translate([tokenWidth,0,0]) templateStraight();
            translate([tokenWidth,0,0]) template45();
            template90();
        }
        
        //scale([1,1,0.3]) translate([tokenWidth*1.3,tokenWidth*1.5,tokenWidth/2]) plane();
    
    
    //numbers
    
        translate([tokenWidth*1.33,templateLength/1.35,-1])
            linear_extrude(tokenHeight+2)
                text("1", size=10);
        
        translate([tokenWidth/1.1,templateLength/1.6,-1])
            rotate([0,0,45])
                linear_extrude(tokenHeight+2)
                    text("2", size=10);
        translate([tokenWidth/1.4,templateLength/2.25,-1])
            rotate([0,0,90])
                linear_extrude(tokenHeight+2)
                    text("3", size=10);
        
        translate([tokenWidth*1.45,tokenWidth*0.8,tokenHeight-0.9])
        rotate([0,0,90])
        linear_extrude(height = tokenHeight/4) {
            scale(0.065)
                import("plane-model.svg", center=true);
        }
        
  
    }
    
}