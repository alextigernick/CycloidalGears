d = 1.5;
ratio = 9;
b=(d/2)/(1+2/ratio);
a=b/(2*ratio);
$fn=30;
f = 1/5;
ls = [ for (i = [0 : f : 360])if((floor(i/(360/(b/a))) % 2) == 0)[ (b+a)*cos(i)-a*cos((b+a)*i/a), (b+a)*sin(i)-a*sin((b+a)*i/a) ]else [(b-a)*cos(i)+a*cos((b-a)*i/a),(b-a)*sin(i)-a*sin((b-a)*i/a)] ];
angle=$t*360;

translate([sin(angle)*a*2,cos(angle)*a*2,0])
rotate([0,0,angle/ratio])
difference(){
    linear_extrude(height=1,center = true){
        polygon(ls);
    }
    cylinder(r=0.125,h=1000);
}
fact = 1.65*a;
for(i=[0:360/(ratio+1):360]){
    color([1,0,0])translate([(d/2-fact)*cos(i),(d/2-fact)*sin(i),0])
    cylinder(r=b/ratio,h=1);
}

echo(a*8);