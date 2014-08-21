sheet_3mm = 3;
sheet = sheet_3mm;  //default sheet

nut_extraRadius = 4;
nut_length = 8.5;

belt_width = 156;
belt_grid = 2.81;
belt_guide = 8;

threadRod1_radius = 4.7; //originally 3.5/2
pipeWheel_peg_radius = threadRod1_radius;
pipeWheel_peg_distance = 19.2;
pipeWheel_disk_OD = 29.3+belt_guide;

startRoll_grabDisk_OD = 29.3*2;
startRoll_guideDisk_OD = 50;


printDisk_peg_radius = threadRod1_radius;
printDisk_peg_distance = (belt_width-nut_length)/1.2+printDisk_peg_radius;  


printDisk_gripper_slot_height = 6;  
printDisk_gripper_height = 1+printDisk_gripper_slot_height+1+nut_extraRadius;


build_Y= belt_width - nut_length;
build_Z= printDisk_peg_distance-printDisk_peg_radius+sin(45)*(printDisk_gripper_height+printDisk_peg_radius*2);
build_X= printDisk_peg_distance-printDisk_peg_radius;

printDisk_shaftD = 7.1;
startRoll_shaftD = 7.1;
pipeWheel_shaftD = 7.1;




printDisk_OD = (printDisk_peg_distance+printDisk_peg_radius+nut_extraRadius+1+printDisk_gripper_slot_height+1+belt_guide)*2;

printDisk_cam_width = 40;
printDisk_cam_height = 5.5;


circleResolution = 52;

after_printDisk_X=60;


module gripper(){
	union(){
		difference(){
			square([belt_width,printDisk_gripper_height]);
			translate([0,1+printDisk_gripper_slot_height+1])
				square([nut_length,nut_extraRadius]);
			translate([belt_width-nut_length,1+printDisk_gripper_slot_height+1])
				square([nut_length,nut_extraRadius]);
		}
		for(i = [2:belt_grid:belt_width]){
			translate([i,.2])
				rotate(45)
					square([belt_grid,belt_grid], center = true);
		}

		translate([-sheet,1])	
		square([belt_width + sheet * 2,printDisk_gripper_slot_height]);
	}
}


module printDisk(){
	difference(){
		circle(printDisk_OD/2, $fn = circleResolution);
		for (i = [0:90:360]) {	
			rotate(i)
				translate([printDisk_peg_distance,0]){
					circle(printDisk_peg_radius, $fn = circleResolution);
					translate([printDisk_peg_radius+nut_extraRadius+1+printDisk_gripper_slot_height/2,0])
						square([printDisk_gripper_slot_height,sheet],center= true);
				}
		}
		circle(printDisk_shaftD/2, $fn = circleResolution);
	}
	for(x = [0:90:360]){
		rotate(x + 45)
			translate([printDisk_OD/2,0])
				polygon(points=[[-4,-printDisk_cam_width/2-4],[printDisk_cam_height,0],[-4,printDisk_cam_width/2+4]],paths=[[0,1,2]]);
	
	}
}


module startRoll_guideDisk(){
	difference(){
		circle(startRoll_guideDisk_OD/2);

		circle(startRoll_shaftD/2, $fn = circleResolution);
	}		
}
module startRoll_grabDisk(){
	difference(){
		circle(startRoll_grabDisk_OD/2);

		circle(startRoll_shaftD/2, $fn = circleResolution);
	}		
}
module pipeWheel(){
	difference(){
		circle(pipeWheel_disk_OD, $fn = circleResolution);
		for (i = [0:120:360]) {
			rotate(i)translate([pipeWheel_peg_distance,0,0])circle(pipeWheel_peg_radius, $fn = circleResolution);
			}
		circle(pipeWheel_shaftD/2, $fn = circleResolution);
	}


}


module build(){

	translate([0,0,-20])
		color([0,0,1])
			difference(){
				square(printDisk_OD+printDisk_cam_height*2,center=true);	
				translate([130,-130])
					circle(threadRod1_radius);
				translate([-130,130])
					circle(threadRod1_radius);
				circle(printDisk_shaftD);
			}
	translate([printDisk_OD*1.5+printDisk_cam_height*3+after_printDisk_X-20,0,-20])
		color([0,0,1])
			square([40,printDisk_OD+printDisk_cam_height*2],center=true);
	
	

	rotate(45)
		printDisk();	
	translate([printDisk_OD+printDisk_cam_height*2+after_printDisk_X,-sin(45)*(printDisk_peg_distance+printDisk_peg_radius+printDisk_gripper_height)+build_Z+printDisk_OD/2+printDisk_cam_height]){
		printDisk();
		translate([0,0,-20])
			color([0,0,1])
				difference(){
					square(printDisk_OD+printDisk_cam_height*2,center=true);	
					translate([-130,-130])
						circle(threadRod1_radius);
					translate([130,130])
						circle(threadRod1_radius);
					circle(printDisk_shaftD);
				}
		translate([-230,-(printDisk_OD/2+printDisk_cam_height),-20])
			color([0,0,1])
				square([80,121.7]);
	}
	translate([-300,-sin(45)*(printDisk_peg_distance+printDisk_peg_radius+printDisk_gripper_height)+build_Z,-20]){
		color([0,0,1])
			difference(){
				square([150,121.6]);
				translate([10,60])
					circle(threadRod1_radius);
				translate([90,60])
					circle(startRoll_shaftD);
			}
		translate([90,60])
			startRoll_grabDisk();
	}

}


module cut(){
translate([-200,320])
	printDisk();
translate([-50,220])
	startRoll_guideDisk();
translate([20,220])
	startRoll_grabDisk();
translate([80,220])
	rotate(90)
		gripper();
}
build();
cut();