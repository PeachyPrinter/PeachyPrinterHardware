//Based on device description in
//'A self-priming, roller-free, miniature, peristaltic pump operable with a single, reciprocating actuator'
//Sensors and Actuators A 160 (2010) 141�146
//Viktor Shkolnikov et. al.

//User parameters:

//Other part sizes:
couplingPlateSideLength = 11.5;
couplingPlateThickness = 0;
tubingOuterDiameter = 7.35-2.35; //edit
compressedTubingWidth = 10;
compressedTubingHeight = 1.7-.7;  //edit

//Mechanical Parameters
couplingMountBaseThickness = 5;
handleLengthOffset = 50;
handleThickness = 2;
upstreamCheckLengthOffset = 15; 
bottomUpstreamTabThickness = 3;
topUpstreamTabThickness = 3;
upstreamTabSpacing = 1-.5; //edit
upstreamTaperHeightRatio = 0.8; // starting height for taper
bottomUpstreamTabConstrictionRatio = 0.7;
topUpstreamTabConstrictionRatio = 0.2;
downstreamCheckLength = 21+7; //edit
downstreamCheckThickness = 3.5+2; //edit
baseThickness = 3;
handleDownstreamClearance = 2-1; //edit
downstreamTaperLength = 10;
taperStartConstrictionRatio = 0.35;
shorten=3; //editt

//Computed parameters
totalLengthA = 2*(couplingPlateThickness+couplingMountBaseThickness)+handleLengthOffset;
totalLengthB = handleDownstreamClearance+downstreamCheckLength;
totalLength = totalLengthA+totalLengthB;
totalWidth = max(couplingPlateSideLength,compressedTubingWidth);
holePrintAngle = 360/16;
constrictionLength2 = topUpstreamTabConstrictionRatio*(tubingOuterDiameter-compressedTubingHeight);
constrictionLength = bottomUpstreamTabConstrictionRatio*(tubingOuterDiameter-compressedTubingHeight);
upstreamCheckTabLength = constrictionLength+(couplingPlateSideLength-tubingOuterDiameter)/2;
upstreamCheckTabLength2 = constrictionLength2+(couplingPlateSideLength-tubingOuterDiameter)/2;
handleTubingOffset = tubingOuterDiameter-compressedTubingHeight-constrictionLength;
downstreamTaperStart = compressedTubingHeight+taperStartConstrictionRatio*(tubingOuterDiameter-compressedTubingHeight);

//Build it
//projection(cut = false) 
union ()
{
	//Base and coupling mounts
	difference ()
	{
		union ()
		{
			cube([totalLength,baseThickness,totalWidth]);
			translate([couplingPlateThickness,baseThickness,0])
			cube([couplingMountBaseThickness,couplingPlateSideLength+handleThickness,totalWidth]);
			translate([0,baseThickness+couplingPlateSideLength,0])
			cube([couplingPlateThickness,handleThickness,totalWidth]);
			translate([totalLength,0,0]) mirror([1,0,0])
			{
				translate([couplingPlateThickness,baseThickness,0])
				cube([couplingMountBaseThickness,couplingPlateSideLength+downstreamCheckThickness-shorten,totalWidth]);
				translate([0,baseThickness+couplingPlateSideLength,0])
				cube([couplingPlateThickness,downstreamCheckThickness,totalWidth]);
			}
		}

		union ()
		{
			translate([-0.01,baseThickness+couplingPlateSideLength/2,totalWidth/2])
			rotate(a=90,v=[0,1,0]) rotate(a=holePrintAngle,v=[0,0,1])
			cylinder(r=tubingOuterDiameter/2,h=totalLength+0.02,$fn=8);

		}
	}

	//Upstream Check Bottom and Bottom Contour
	translate([couplingPlateThickness+couplingMountBaseThickness+upstreamCheckLengthOffset,baseThickness,0])
	difference(){
		union ()
		{
			cube([bottomUpstreamTabThickness,upstreamCheckTabLength,totalWidth]);
			translate([bottomUpstreamTabThickness,0,0])
				linear_extrude (height=totalWidth)
					polygon([[0,0],[0,upstreamTaperHeightRatio*upstreamCheckTabLength],[handleLengthOffset-upstreamCheckLengthOffset-bottomUpstreamTabThickness,0]]);
		}
		linear_extrude (height=totalWidth+1) translate([5,2.2,0])  circle(1.5,$fn=20);
	}
	//Handle
	translate([couplingPlateThickness+couplingMountBaseThickness,baseThickness+couplingPlateSideLength,0])
	union ()
	{
		linear_extrude (height=totalWidth)
		polygon([[0,0],[upstreamCheckLengthOffset,0],[upstreamCheckLengthOffset,-(couplingPlateSideLength-tubingOuterDiameter)/2],
			[upstreamCheckLengthOffset+bottomUpstreamTabThickness+upstreamTabSpacing,-(couplingPlateSideLength-tubingOuterDiameter)/2],
			[upstreamCheckLengthOffset+bottomUpstreamTabThickness+upstreamTabSpacing,-(couplingPlateSideLength-tubingOuterDiameter)/2-constrictionLength2],
			[upstreamCheckLengthOffset+bottomUpstreamTabThickness+upstreamTabSpacing+topUpstreamTabThickness,-(couplingPlateSideLength-tubingOuterDiameter)/2-constrictionLength2],
			[upstreamCheckLengthOffset+bottomUpstreamTabThickness+upstreamTabSpacing+topUpstreamTabThickness,-(couplingPlateSideLength-tubingOuterDiameter)/2],
			[handleLengthOffset,-(couplingPlateSideLength-tubingOuterDiameter)/2],
			[handleLengthOffset,handleThickness-(couplingPlateSideLength-tubingOuterDiameter)/2],
			//[upstreamCheckLengthOffset+handleThickness,handleThickness-(couplingPlateSideLength-tubingOuterDiameter)/2],
			[upstreamCheckLengthOffset+handleThickness,handleThickness],
			[-couplingPlateThickness-couplingMountBaseThickness,handleThickness]]);

	}

	//Downstream check
	translate([totalLength-couplingPlateThickness-couplingMountBaseThickness,baseThickness,0])  mirror([1,0,0]) 
	difference(){
		union ()
		{
			translate([0,couplingPlateSideLength-shorten,0]) cube([downstreamCheckLength-downstreamCheckThickness,downstreamCheckThickness,totalWidth]);
			translate([downstreamCheckLength-downstreamTaperLength-downstreamCheckThickness,compressedTubingHeight,0])
				cube([downstreamCheckThickness,couplingPlateSideLength-compressedTubingHeight+0.01,totalWidth]);
//			translate([downstreamCheckLength-downstreamCheckThickness,downstreamTaperStart,0])
//				cube([downstreamCheckThickness,couplingPlateSideLength-downstreamTaperStart+0.01,totalWidth]);
			linear_extrude (height=totalWidth)
				polygon([[downstreamCheckLength-downstreamTaperLength,compressedTubingHeight],
					[downstreamCheckLength-downstreamTaperLength-downstreamCheckThickness,couplingPlateSideLength],
					[downstreamCheckLength-downstreamCheckThickness,couplingPlateSideLength],
					[downstreamCheckLength,downstreamTaperStart]]);

		}
		union()
		{
			linear_extrude (height=totalWidth+1) translate([downstreamCheckLength-downstreamTaperLength,compressedTubingHeight+2,0]) circle(1.5,$fn=20);
		}
	}
}