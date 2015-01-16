
boltA=4/2;
boltB=2.8/2;
boltC=2/2;

gearSD=2.5;
gearSFlat=1.85;

hoseSquished=2;



bearings=3;
bearingID=5.2;
bearingOD=10;
bearingR=gearSD/2+1+bearingOD/2;
gearR=bearingR+boltB+1;
gearOD=gearR*2;

ID=(bearingR+bearingOD/2+hoseSquished)*2;
ID2=gearOD+3;
OD=ID+boltA*4+4;

OX=32;
boltSep=31;


AB=2.6;
BC=9;

difference(){
	circle(gearOD/2,$fn=50);
	for(i=[0:3]){
		rotate([0,0,60+i*360/bearings]) translate([0,gearOD/2-boltB-1]) circle(boltC,$fn=50);

	circle(gearSD/2,$fn=6);


	}
}

translate([0,15]){
	difference(){
		circle(bearingID/2,$fn=30);
		circle(boltB,$fn=30);
	}
}
translate([0,-15]){
	difference(){
		circle(bearingID/2,$fn=30);
		circle(gearSD/2,$fn=6);
	}
}


translate([40,0]){
	difference(){
		circle(OD/2,$fn=100);
		circle(ID/2,$fn=100);
		translate([-OD/2,-OD/2]) square([OD,OD/2]);
		translate([0,ID/2+boltA+1])circle(boltA,$fn=30);
		rotate(75) translate([0,ID/2+boltA+1])circle(boltA,$fn=30);
		rotate(-75) translate([0,ID/2+boltA+1])circle(boltA,$fn=30);

	}

}
translate([85,0]){
	difference(){
		circle(OD/2,$fn=100);
		circle(ID2/2,$fn=100);
		translate([-OD/2,-OD/2]) square([OD,OD/2]);
		translate([0,ID/2+boltA+1])circle(boltA,$fn=30);
		rotate(75) translate([0,ID/2+boltA+1])circle(boltA,$fn=30);
		rotate(-75) translate([0,ID/2+boltA+1])circle(boltA,$fn=30);

	}
}
translate([130,0]){
	difference(){
		union(){
			circle(OD/2,$fn=100);

		}
		circle(bearingOD/2-.2,$fn=100);
		translate([-OD/2,-OD/2]) square([OD,OD/2-bearingOD/2]);
		difference(){
			circle(9);
			circle(8.7);
			translate([-5,3])square(10);
		}
		translate([0,ID/2+boltA+1])circle(boltA,$fn=30);
		rotate(75) translate([0,ID/2+boltA+1])circle(boltA,$fn=30);
		rotate(-75) translate([0,ID/2+boltA+1])circle(boltA,$fn=30);

	}
}


translate([-40,0]){
	difference(){
		union(){
			square(boltSep+boltB+4,center=true);
			difference(){
				circle(OD/2);
				translate([-OD/2,-OD/2]) square([OD,OD/2]);
			}

		}
		translate([-boltSep/2,-boltSep/2]) circle(boltB,$fn=30);
		translate([boltSep/2,-boltSep/2]) circle(boltB,$fn=30);
		translate([-boltSep/2,boltSep/2]) circle(boltB,$fn=30);
		translate([boltSep/2,boltSep/2]) circle(boltB,$fn=30);
		translate([0,17])circle(boltA,$fn=30);
		rotate(75) translate([0,17])circle(boltA,$fn=30);
		rotate(-75) translate([0,17])circle(boltA,$fn=30);
		circle(4);
	}	
}
