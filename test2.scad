
R = 1;
Rr = 0.25/2;
E = Rr/4;
echo(E);
N = 21;
f = 1/10;
$fn=500;
CH = 28/25.4;
Ro = 0.725;
Rro = 0.125/2;
ls = [ for (t = [0 : f : 360])[
    
(R*cos(t))-(Rr*cos(t+atan(sin((1-N)*t)/((R/(E*N))-cos((1-N)*t)))))-(E*cos(N*t)),
    
(-R*sin(t))+(Rr*sin(t+atan(sin((1-N)*t)/((R/(E*N))-cos((1-N)*t)))))+(E*sin(N*t))]

];

$t=0;
angle=$t*360;
ratio = N-1;
//scale(10000){
translate([cos(angle)*E,sin(angle)*E,0])
rotate([0,0,-angle/ratio])
difference(){
    linear_extrude(height=0.125,convexity=8){
        polygon(ls);
    }
    cylinder(d=CH,h=1000,center=true);
    for(i=[360/(N-1)/2:360/(N-1):360+360/(N-1)/2]){
        translate([cos(i)*Ro,sin(i)*Ro,0])
        cylinder(r=Rro+E/2,h=1000,center=true);
        }
//}
}
/*rotate([0,0,angle])
difference(){
    cylinder(d=8/25.4,h=0.125);
    translate([4/25.4,0,0])
    cube([0.125,0.125,1],center=true);
}*/
/*for(i=[0:360/(N):360]){
    color([1,0,0])translate([R*cos(i),R*sin(i),0])
    cylinder(r=Rr,h=1);
}
/*rotate([0,0,angle])
translate([0,0,-0.25])
color([0,0.7,0]){
    difference(){
    translate([E,0,0]){
        cylinder(d=CH,h=1);
    }
    cylinder(d=8/25.4,h=1000,center=true);
    translate([4/25.4,0,0])
    cube([0.125,0.125,10000],center=true);
    }
    
}
*/