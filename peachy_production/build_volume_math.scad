


translate([0,0]){
	difference(){
		circle(100);
		square(100*sqrt(2),center=true);
	}
	translate([-100/2*sqrt(2),-100/2*sqrt(2)])
		difference(){
			circle(100*sqrt(2));
			square(100);
		}
}