height = 350;
width = 350;

tabSize = height / 40;
frontHeight = tabSize * 14;
materialThickness = 3;
crossBarWidth = max(width / 10, 20);

mountHoleX = materialThickness + 0.1;
mountHoleY = 8.35;
mountDistance = 27.0;

module tabs(vertical, offset = 0){
	for ( i = [ offset : tabSize * 2 : height - tabSize ] ) {
		translate([0,i]){
				square([materialThickness, tabSize]);
		}
	}
}

module wall(){
	difference(){
		square([width,height]);
		tabs(height);
		translate([width - materialThickness ,0]){
			tabs(height, offset = tabSize);
		}
		translate([width / 2 - materialThickness / 2, height - height / 4 - tabSize]){
			square([materialThickness, tabSize]);	
		}
		translate([width / 2 - crossBarWidth / 2, height - materialThickness]){
			square([crossBarWidth, materialThickness]);	
		}
	}
}

module front(){
	difference(){
		square([width,frontHeight]);
		tabs(frontHeight);
		translate([width - materialThickness ,0]){
			tabs(frontHeight, offset = tabSize);
		}
		translate([width / 2 - materialThickness / 2, frontHeight - height / 4 -tabSize]){
			square([materialThickness, tabSize]);	
		}
		translate([width / 2 - crossBarWidth / 2, frontHeight - materialThickness]){
			square([crossBarWidth, materialThickness]);
		}
	}
}

module mount(){
	square([mountHoleX,mountHoleY]);
	translate([mountDistance,0]){
		square([mountHoleX,mountHoleY]);
	}
}

module brace(){
	braceHeight = height / 4 - materialThickness;
	polygon([
		[materialThickness,         												0],
		[materialThickness,         												tabSize / 2],
		[0,                         												tabSize / 2],
		[0,                         												3 * tabSize / 2],
		[materialThickness,         												3 * tabSize / 2],
		[materialThickness,         												tabSize * 2],
		[materialThickness + braceHeight - tabSize / 2, 		braceHeight + tabSize / 2],
		[materialThickness + braceHeight,               		braceHeight + tabSize / 2],
		[materialThickness + braceHeight,               		braceHeight + tabSize / 2 + materialThickness],
		[materialThickness + braceHeight + tabSize,     		braceHeight + tabSize / 2 + materialThickness],
		[materialThickness + braceHeight + tabSize,     		braceHeight + tabSize / 2],
		[materialThickness + braceHeight + 3 * tabSize /2,  braceHeight + tabSize / 2]
		]);
	
}

module top(){
	difference(){
		union(){
			translate([0, (width / 2) - (crossBarWidth / 2)]) {
				square([width, crossBarWidth]);
				}
			translate([(width / 2) - (crossBarWidth / 2), 0]){
				square([crossBarWidth, width]);
			}
		}
		translate([width / 2 - materialThickness / 2, width - height / 4]){
			square([materialThickness, tabSize]);
		}
		translate([width / 2 - materialThickness / 2, height / 4 - tabSize]){
			square([materialThickness, tabSize]);
		}
		translate([ width - height / 4, width / 2 - materialThickness / 2 ]){
			square([tabSize, materialThickness]);
		}
		translate([ height / 4 - tabSize, width / 2 - materialThickness / 2 ]){
			square([tabSize, materialThickness]);
		}
		translate([width / 2 , width/ 2]){
			mount();
		}
				

		}
}


wall();

translate([0, width + crossBarWidth + 6 ]){
	wall();
}

translate([width + crossBarWidth + 6, width + crossBarWidth + 6 ]){
	wall();
}

translate([width + 1,0]){
	front();
}

translate([width - width / 2 + crossBarWidth / 2 + 3 ,width - width / 2 + crossBarWidth / 2 + 3]){
	top();
}

translate([width + crossBarWidth + (tabSize * 2 + 3),frontHeight + 3]){
	brace();
}
translate([width + crossBarWidth + 2 * (tabSize * 2 + 3) ,frontHeight + 3]){
	brace();
}
translate([width + crossBarWidth + 3 * (tabSize * 2 + 3) ,frontHeight + 3]){
	brace();
}
translate([width + crossBarWidth + 4 * (tabSize * 2 + 3) ,frontHeight + 3]){
	brace();
}