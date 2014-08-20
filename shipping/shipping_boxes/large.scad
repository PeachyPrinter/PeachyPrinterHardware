//cardboard box
x=170;
y=220;
z=17;

s=.002;

cb=0;

a=[x,y];
b=[x,z];
c=[z,y];
aa=[x+cb,y+cb*2];
cc=[z,y+cb*2];

translate([0,z+s-cb]) square(cc);
translate([z+s,z+s]) square(a);
translate([z+s,z+s+y+s]) square(b);
translate([z+s,0]) square(b);
translate([z+s+x+s,z+s-cb]) square(cc);
translate([z+s+x+s+z+s,z+s-cb]) square(aa);
translate([z+s+x+s+z+s,0]) square([x+cb,z-cb]);
translate([z+s+x+s+z+s,z+s+y+cb+s]) square([x+cb,z-cb]);
translate([z+s+x+s+z+s+x+cb+s,z+s-cb]) square(cc);