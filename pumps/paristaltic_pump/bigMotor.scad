
boltA=4.9/2;
boltB=2.8/2;
boltC=4.8/2;

gearSD=6.2;
gearSFlat=2.08;

hoseSquished=1.5;



bearings=3;
bearingID=5.2;
bearingOD=11;
bearingR=gearSD/2+.5+bearingOD/2;
gearR=bearingR+boltB+1;
gearOD=gearR*2;

ID=(bearingR+bearingOD/2+hoseSquished)*2;
ID2=(bearingR+bearingOD/2+0.25)*2;
OD=76;

OX=32;
boltSep=31;


AB=2.6;
BC=9;

difference(){
	circle(gearOD/2,$fn=50);
	for(i=[0:3]){
		rotate([0,0,60+i*360/bearings]) translate([0,gearOD/2-boltB-1]) circle(boltC,$fn=50);

	difference(){
		circle(gearSD/2,$fn=20);
		translate([-gearSD/2,gearSFlat]) square(gearSD);
	}


	}
}




translate([50,0]){
	difference(){
		circle(OD/2,$fn=100);
		circle(ID/2,$fn=100);
		translate([-OD/2,-OD/2-15]) square([OD,OD/2]);
		translate([-ID/2,-20]) square([ID,20]);
		threeHoles();

	}

}
translate([130,0]){
	difference(){
		circle(OD/2,$fn=100);
		circle(ID2/2,$fn=100);
		translate([-OD/2,-OD/2-15]) square([OD,OD/2]);
		threeHoles();

	}
}




module threeHoles(){
		//translate([0,ID/2+boltA+1])circle(boltA,$fn=30);
		translate([0,67/2])circle(boltA,$fn=30);
		rotate(90) 		translate([0,67/2])circle(boltA,$fn=30);
		rotate(-90)		translate([0,67/2])circle(boltA,$fn=30);

}