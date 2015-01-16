
boltA=4.9/2;
boltB=2.8/2;

gearSD=4.6;
gearSFlat=1.85;

hoseSquished=2;



bearings=3;
bearingID=2.67;
bearingOD=10;
gearOD=bearingOD+gearSD+bearingID+4;

ID=((gearOD/2-bearingID/2-1)+bearingOD/2+hoseSquished)*2-1*2;
ID2=gearOD+3;
OX=32;
boltASep=26;


AB=2.6;
BC=9;

difference(){
	circle(gearOD/2,$fn=50);
	for(i=[0:3]){
		rotate([0,0,60+i*360/bearings]) translate([0,gearOD/2-bearingID/2-1]) circle(bearingID/2,$fn=50);
		difference(){
			circle(gearSD/2, $fn=30);
			translate([-5,gearSFlat]) square(10);
		}
	}
}

translate([40,0]){
	difference(){
		circle(26,center=true);
		circle(ID/2,$fn=100);
		translate([-ID/2,-OX/2]) polygon([[5,-2],[0,OX/2],[ID,OX/2],[ID-5,-2]],[[0,1,2,3]]);
		translate([-26,-26]) square([52,8]);
		translate([0,22])circle(boltA,$fn=30);
		rotate(90) translate([0,22])circle(boltA,$fn=30);
		rotate(-90) translate([0,22])circle(boltA,$fn=30);
		translate([-boltASep/2,-boltASep/2]) circle(boltB,$fn=30);
		translate([boltASep/2,-boltASep/2]) circle(boltB,$fn=30);
		translate([-boltASep/2,boltASep/2]) circle(boltB,$fn=30);
		translate([boltASep/2,boltASep/2]) circle(boltB,$fn=30);
	}
}
translate([95,0]){
	difference(){
		circle(26,center=true);
		circle(ID2/2,$fn=100);

		translate([-26,-26]) square([52,8]);
		translate([0,22])circle(boltA,$fn=30);
		rotate(90) translate([0,22])circle(boltA,$fn=30);
		rotate(-90) translate([0,22])circle(boltA,$fn=30);
		translate([-boltASep/2,-boltASep/2]) circle(boltB,$fn=30);
		translate([boltASep/2,-boltASep/2]) circle(boltB,$fn=30);
		translate([-boltASep/2,boltASep/2]) circle(boltB,$fn=30);
		translate([boltASep/2,boltASep/2]) circle(boltB,$fn=30);
	}
}


translate([-20,0]){
	square([6,AB]);
	translate([0,AB+3]) square([6,BC]);
	translate([-3,-3]) square([3,AB+BC+9]);
}
