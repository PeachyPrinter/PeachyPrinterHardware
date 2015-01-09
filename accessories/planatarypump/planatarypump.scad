use <MCAD/involute_gears.scad>

3Dassembly();

outside_diameter=60;
material_thickness=4;
backlash=0.25;
pressure_angle=20;
outside_ring_diameter=0.85;
teeth_sun_gear=12;
teeth_planet_gear=18;
planet_bore = 3;
sun_bore = 3;

outside_gear_teeth=teeth_sun_gear+2*teeth_planet_gear;
pitch=outside_gear_teeth/(outside_diameter*outside_ring_diameter);
sun_planet_ratio= ((outside_gear_teeth / 2) / teeth_sun_gear) *2;
planet_ring_ratio=outside_gear_teeth/(teeth_sun_gear+teeth_planet_gear)*(1.1);
planet_planet_ratio=(teeth_planet_gear+teeth_sun_gear)/teeth_planet_gear;

module 3Dassembly(){
    color([0.5,0.5,0.5])
        outsideRing();
    translate([0,0,material_thickness])
        rotate([180,0,180/teeth_sun_gear+360*sun_planet_ratio*$t])
            color([1,0,0])
                sun();
    rotate([0,0,360*planet_ring_ratio*$t])
        translate([(teeth_sun_gear+teeth_planet_gear)/pitch/2,0,0])
            rotate([0,0,-360*planet_ring_ratio*(1+planet_planet_ratio)*$t])
                color([0,0,1])
                    planet();
    rotate([0,0,120+360*planet_ring_ratio*$t])
        translate([(teeth_sun_gear+teeth_planet_gear)/pitch/2,0,0])
            rotate([0,0,-120-360*planet_ring_ratio*(1+planet_planet_ratio)*$t])
                color([0,0,1])
                    planet();
    rotate([0,0,-120+360*planet_ring_ratio*$t])
        translate([(teeth_sun_gear+teeth_planet_gear)/pitch/2,0,0])
            rotate([0,0,120-360*planet_ring_ratio*(1+planet_planet_ratio)*$t])
                color([0,0,1])
                    planet();
}

module sun(){
    gear(number_of_teeth=teeth_sun_gear,
        diametral_pitch=pitch,
        gear_thickness=material_thickness,
        rim_thickness=material_thickness,
        hub_thickness=material_thickness,
        bore_diameter=sun_bore,
        backlash=backlash,
        clearance=0,
        pressure_angle=pressure_angle);
}

module planet() {
    gear(number_of_teeth=teeth_planet_gear,
        diametral_pitch=pitch,
        gear_thickness=material_thickness,
        rim_thickness=material_thickness,
        hub_thickness=material_thickness,
        bore_diameter=planet_bore,
        backlash=backlash,
        clearance=0,
        pressure_angle=pressure_angle);
}

module outsideRing() {
    insidegear(outside_gear_teeth);
}

module insidegear(n)
    rotate([180,0,0])
        translate([0,0,-material_thickness])
        difference(){
            cylinder(r=n/pitch/2/outside_ring_diameter,h=material_thickness);
                translate([0,0,-0.5])
                    gear(number_of_teeth=n,
                        diametral_pitch=pitch,
                        gear_thickness=material_thickness+1,
                        rim_thickness=material_thickness+1,
                        hub_thickness=material_thickness+1,
                        bore_diameter=0,
                        backlash=-backlash,
                        clearance=0,
                        pressure_angle=pressure_angle);
}