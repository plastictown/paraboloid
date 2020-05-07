program
       pset3d;
uses
    crt,graph,MyUnit;
var
   c,i,j,k,f:integer;
   p,q:real;
   color:word;
   ang:integer;
procedure Pset3(x,y,z:integer; color:word);
          var
             xn,yn,zn:word;
             k:real;
          begin
               k:=sqrt(2)/2;
               xn:=320+y-round(k*x);
               yn:=getMaxY-(240+(z-round(k*x)));
               PutPixel(xn,yn,color);
          end;
begin
clrscr;
InGr;
cleardevice;
{for k:=-100 to 100 do
    begin
         Pset3(0,0,k,green);
         pset3(0,k,0,red);
         pset3(k,0,0,blue);
    end;}
p:=2;
q:=3;
for ang:= -50 to 100 do begin

for i:=-100 to 100 do
    begin
    if (i mod 5)=0 then begin
         for j:=-100 to 10 do
             begin
                  k:=round(((sqr(i)/p - sqr(j)/q))/30);
                 { j:=round(sqrt(abs(5-sqr(i)/100-sqr(k)/100)));
                  k:=round(sqrt(abs(sqr(i)/10+sqr(j)/10)));}
                  if(k>0) then
                  begin
                       if(i>0) then color:=brown;
                       if(i<=0) then color:=green;
                  end else
                          begin
                           if(i>0) then color:=blue;
                           if(i>0) then color:=yellow;
                          end;

                  Pset3(round(cos(ang/20)*i),round(sin(ang/20)*j),-k,color);

             end;
             end;
             {Pset3(round(240*cos(i/300)),round(240*sin(i/300)),round(i/30*10/(2*pi)),yellow);}

    end;
     clearDevice;
end;
readln;
closegraph
end.