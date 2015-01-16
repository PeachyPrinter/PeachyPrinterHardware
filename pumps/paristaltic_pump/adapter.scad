

//adapter
difference(){
	circle(8);
	circle(1.25,$fn=6);
	translate([0,-6]) circle(2.9/2,$fn=30);
	translate([0,6]) circle(2.9/2,$fn=30);
}
translate([17,0]){
	difference(){
		circle(8);
		difference(){
			circle(2.45,$fn=30);
			translate([-4,1.7])square(8);
		}
		translate([0,-6]) circle(2.9/2,$fn=30);
		translate([0,6]) circle(2.9/2,$fn=30);
	}
}
//adapter


