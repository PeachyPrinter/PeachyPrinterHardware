sheet3=2.95;
sheet=sheet3;

magnet3=2.75;
magnet4=3.65;
magnet5=4.56;
magnet=magnet5;

magnetHold=.35;

wall=2;
IR=20/2-.45;
OR=IR+wall;

R1=.9;
//R1=6;
R2=R1+sheet+1;

damper=true;
//damper=false;

holders=damper;
noCut=damper;


magnetArm(R1);
mirror([0,1,0]) magnetArm(R2);

if(holders==true) holders();


module magnetArm(r1){
	difference(){
		union(){
			translate([-(magnet+2.5)/2,0]) square([magnet+2.5,max(r1+magnet+1.5,IR)]);
			ring(IR,OR);
		}
		translate([-(magnet)/2,r1]) square(magnet);
		translate([-(magnet)/2+magnet*1/4,r1-1]) square([magnet*1/2,1]);
		translate([.001,r1-magnet+.001])circle(magnet-magnetHold,$fn=60);
		translate([-magnet/2-1.25,0]) square([magnet+2.5,r1-magnet]);
		if(noCut==false) square([magnet+2.5,sheet+1], center=true);
		else translate([0,r1-3]) square([magnet+2.5,sheet+1], center=true);
		translate([-OR,-OR])square([OR*2,OR]);
	}
}

module ring(r1,r2){
	difference(){
		union(){
			circle(r2,$fn=r2*8);
		}
		circle(r1,$fn=r2*8);
	}
}

module holder(){
	translate([-IR,sheet/2]) square(2);
}

module holders(){
	holder();
	mirror([1,0,0]) holder();
	mirror([0,1,0]) holder();
	mirror([1,0,0]) mirror([0,1,0]) holder();
}