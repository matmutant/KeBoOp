fn=100;

module rawBody() {
	cube([42.5,25,2]);
	translate([42.5,12.5,0]) cylinder(d=25, h=2, $fn=fn);
	}


module fullBody() {
	difference() {
		rawBody();
		// main hole
		translate([42.5,12.5,0]) cylinder(d=15, h=3, $fn=fn);	
		// rounded edge
		translate([-5,20,0]) difference() {
			cube([10,10,3]);
			translate([10,0,0]) cylinder(d=10, h=3, $fn=fn);
		}
		// box opener
		translate([]) rotate([10,-10,0]) translate([-5,0,0])cube([20,10,5]);
		
		//wire stripper and bender
		translate([30,25,0]) cylinder(d=2, h=3, $fn=fn);
		// belt cutter
		translate([20,27,0]) rotate([75,0,-45]) {
			hull() {
				cylinder(h=30, d=5, $fn=fn);
				translate([0,10,0]) cylinder(h=30, d=5, $fn=fn);
				}
			}
		//cap lifter
		translate([10,3.5,0]) {
			union() {
				translate([10,0,0]) cylinder(d=6, h=3, $fn=fn);
				translate([10,-7,0]) difference() {
					cylinder(d=20, h=3, $fn=fn);
					translate([0,-15,0]) cube([15,30,3]);
					}
				}
			}
			
			
			
	}
}
	
	
fullBody();
		


