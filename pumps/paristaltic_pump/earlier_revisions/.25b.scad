
boltA=4.8/2;

gearOD=30;
gearSD=6+0.25;
gearSFlat=1.2+0.25;

hoseSquished=2;



points=3;
pointID=4;
pointOD=16;


ID=((gearOD/2-pointID/2-1)+pointOD/2+hoseSquished)*2-1*2;
ID2=ID-6;
OX=57;
boltASep=47;

difference(){
	circle(gearOD/2,$fn=50);
	for(i=[0:3]){
		rotate([0,0,60+i*360/points]) translate([0,gearOD/2-pointID/2-1]) circle(pointID/2,$fn=30);
		difference(){
			circle(gearSD/2, $fn=30);
			translate([-5,gearSFlat]) square(10);
		}
	}
}

translate([25+25,0]){
	difference(){
		square(OX,center=true);
		circle(ID/2,$fn=50);
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
		translate([-ID2/2,-OX/2]) polygon([[3,0],[0,OX/2],[ID2,OX/2],[ID2-3,0]],[[0,1,2,3]]);
		translate([-boltASep/2,-boltASep/2]) circle(boltA,$fn=30);
		translate([boltASep/2,-boltASep/2]) circle(boltA,$fn=30);
		translate([-boltASep/2,boltASep/2]) circle(boltA,$fn=30);
		translate([boltASep/2,boltASep/2]) circle(boltA,$fn=30);
	}
}
