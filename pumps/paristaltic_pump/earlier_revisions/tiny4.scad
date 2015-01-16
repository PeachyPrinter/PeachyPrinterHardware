
boltA=4.9/2;
boltB=2.8/2;

gearSD=2.5;
gearSFlat=1.85;

hoseSquished=2;



bearings=3;
bearingID=2.67;
bearingOD=10;
gearOD=bearingOD+gearSD+bearingID+4;

ID=((gearOD/2-bearingID/2-1)+bearingOD/2+hoseSquished)*2-1*2;
ID2=gearOD+3;
OX=32;
boltASep=31;


AB=2.6;
BC=9;

difference(){
	circle(gearOD/2,$fn=50);
	for(i=[0:3]){
		rotate([0,0,60+i*360/bearings]) translate([0,gearOD/2-bearingID/2-1]) circle(bearingID/2,$fn=50);

	circle(gearSD/2,$fn=6);


	}
}

translate([40,0]){
	difference(){
		circle(21,center=true);
		circle(ID/2,$fn=100);
		translate([-21,-21]) square([42,21]);
		translate([-26,-26]) square([52,8]);
		translate([0,17])circle(boltA,$fn=30);
		rotate(75) translate([0,17])circle(boltA,$fn=30);
		rotate(-75) translate([0,17])circle(boltA,$fn=30);

	}
}
translate([85,0]){
	difference(){
		circle(21,center=true);
		circle(ID2/2,$fn=100);
		translate([-21,-21]) square([42,21]);
		translate([-26,-26]) square([52,8]);
		translate([0,17])circle(boltA,$fn=30);
		rotate(75) translate([0,17])circle(boltA,$fn=30);
		rotate(-75) translate([0,17])circle(boltA,$fn=30);

	}
}
translate([130,0]){
	difference(){
		circle(21,center=true);
		circle(bearingOD/2,$fn=100);
		translate([-21,-21]) square([42,21-bearingOD/2]);
		difference(){
			circle(8);
			circle(7.7);
			translate([-5,3])square(10);
		}
		translate([-26,-26]) square([52,8]);
		translate([0,17])circle(boltA,$fn=30);
		rotate(75) translate([0,17])circle(boltA,$fn=30);
		rotate(-75) translate([0,17])circle(boltA,$fn=30);

	}
}

translate([-20,0]){
	
}
