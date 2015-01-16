
boltA=4.9/2;


gearSD=4.6;
gearSFlat=1.85;

hoseSquished=2;



bearings=3;
bearingID=2.67;
bearingOD=10;
gearOD=bearingOD+gearSD+bearingID+4;

ID=((gearOD/2-bearingID/2-1)+bearingOD/2+hoseSquished)*2-1*2;
ID2=gearOD+4;
OX=57;
boltASep=47;

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

translate([25+25,0]){
	difference(){
		square(OX,center=true);
		circle(ID/2,$fn=100);
		translate([-ID/2,-OX/2]) polygon([[3,0],[0,OX/2],[ID,OX/2],[ID-3,0]],[[0,1,2,3]]);
		translate([-boltASep/2,-boltASep/2]) circle(boltA,$fn=30);
		translate([boltASep/2,-boltASep/2]) circle(boltA,$fn=30);
		translate([-boltASep/2,boltASep/2]) circle(boltA,$fn=30);
		translate([boltASep/2,boltASep/2]) circle(boltA,$fn=30);
	}
}

translate([125,0]){
	difference(){
		square(OX,center=true);
		circle(ID2/2,$fn=50);
		translate([-boltASep/2,-boltASep/2]) circle(boltA,$fn=30);
		translate([boltASep/2,-boltASep/2]) circle(boltA,$fn=30);
		translate([-boltASep/2,boltASep/2]) circle(boltA,$fn=30);
		translate([boltASep/2,boltASep/2]) circle(boltA,$fn=30);
	}
}

translate([60,0]){






}
