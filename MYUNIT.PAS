unit
    MyUnit;
interface

procedure MyLine(x1,y1,x2,y2:integer; col:word);
procedure InGr;
procedure XoY(x,y:integer; dx:integer; co,cg:word);
procedure draw_graph(xs,ys:real;x,y,xn,xk,dx:integer; col:word);
function count(x:real):real;
procedure draw_init(x,y,xx,yy:integer;init:string;color:word);
procedure drawCube(x,y,s:integer; col:word);
procedure drawCirc(x,y,r:integer; color:word);
procedure draw_sphere(xx,yy,x,y:word);
procedure MyRect(x1,y1,x2,y2:integer; color:word);
procedure drawPolygon(x,y,r,color,n:word);
implementation
uses crt,graph;

 procedure MyRect(x1,y1,x2,y2:integer; color:word);
 begin
      MyLine(x1,y1,x2,y1,color);
      MyLine(x2,y1,x2,y2,color);
      MyLine(x2,y2,x1,y2,color);
      MyLine(x1,y2,x1,y1,color);
 end;

procedure drawPolygon(x,y,r,color,n:word);
  var i:integer;
      darg:real;
      arg:real;
      xn,yn,xs,ys:integer;
  begin
       darg:=(2*pi)/n;
       arg:=0;
       xs:=x+round(r*cos(arg));
       ys:=y+round(r*sin(arg));
       for i:=0 to n do
           begin
                arg:=arg+darg;
                xn:=x+round(r*cos(arg));
                yn:=y+round(r*sin(arg));
                MyLine(xs,ys,xn,yn,color);
                xs:=xn;
                ys:=yn;
           end;
  end;

procedure draw_sphere(xx,yy,x,y:word);
begin;
{1}
fillellipse (xx,yy,ROUND(x/4),ROUND(y/4));
{2}
Myline (xx,yy,xx,round(yy+y/2),13);
{3}
Myline (round(xx-x/4),yy,round(xx-x/8),round(yy+y/2),13);
{4}
Myline (round(xx+x/4),yy,round(xx+x/8),round(yy+y/2),13);
{5}
Myline (round(xx-x/4),yy,round(xx+x/4),yy,13);
{6}
MyRect(round(xx-x/8),round(yy+y/2),round(xx+x/8),round(yy+y/1.5),13);
end;
procedure drawCirc(x,y,r:integer; color:word);
             var
                i:integer;
                px,py:integer;
                arg:real;
             begin
                  for i:=0 to 360 do
                      begin
                           arg:=i/57.29577951;
                           px:=x+round(r*cos(arg));
                           py:=y+round(r*sin(arg));
                           PutPixel(px,py,color);
                      end;
             end;
procedure drawCube(x,y,s:integer; col:word);
                    var
                       c:integer;
                       len:integer;
                       v,vv,vvv:integer;
                    begin
                         len:=round(sqrt(s));
                         ClearDevice;
                         setcolor(red);
                         if(x>getmaxX) or (x<0) then outtextXY(round(GetMaxX/2),round(GetMaxY/2),'Error');
                         if(y>getmaxY) or (y<0) then outtextXY(round(GetMaxX/2),round(GetMaxY/2),'Error');
                         if(s<0) then s:=abs(s);
                         v:=round(len+len*sqrt(2)/4);
                         vv:=round(len*sqrt(2)/4);
                         vvv:=round(v/2);
                         MyLine(x+vvv-vv,y+vvv,x-vvv,y+vvv,col);
                         MyLine(x-vvv,y+vvv,x-vvv,y-vvv+vv,col);
                         MyLine(x-vvv,y-vvv+vv,x+vvv-vv,y-vvv+vv,col);
                         MyLine(x+vvv-vv,y-vvv+vv,x+vvv-vv,y+vvv,col);
                         MyLine(x-vvv,y-vvv+vv,x-vvv+vv,y-vvv,col);
                         MyLine(x+vvv-vv,y-vvv+vv,x+vvv,y-vvv,col);
                         MyLine(x+vvv,y-vvv,x-vvv+vv,y-vvv,col);
                         MyLine(x+vvv-vv,y+vvv,x+vvv,y+vvv-vv,col);
                         MyLine(x+vvv,y+vvv-vv,x+vvv,y-vvv,col);
                         setcolor(red);
                         if((x+vvv)>getmaxX) then outtextxy(x,y,'Error');
                         if((x-vvv)<0) then outtextxy(x,y,'Error');
                         if((y+vvv)>getmaxY) then outtextxy(x,y,'Error');
                         if((y-vvv)<0) then outtextxy(x,y,'Error');
                    end;

 procedure draw_init(x,y,xx,yy:integer;init:string;color:word);
                var
                   sprite:array[0..29,0..9] of word;
                   c,mx,my,i,j:integer;
                   kx,ky:real;
                   cd,cp:word;
                     begin
                     mx:=getMaxX;
                     my:=getmaxy;
                     ClearDevice;
                     SetColor(color);
                     OutTextXY(x,y,init);
                     for i:= 0 to 29 do
                         begin
                              for j:=0 to 9 do
                                  begin
                                       sprite[i,j]:=GetPixel(x+i,y+j);
                                  end;
                          end;
                          cleardevice;
                          kx:=xx/30;
                          ky:=xx/10;
                          cd:=GetPixel(x,y);
                          for i:= 0 to 29 do
                         begin
                          cd:=sprite[i,j];
                              for j:=0 to 9 do
                                  begin
                                      putPixel(x+round(i*kx),y+round(j*ky),sprite[i,j]);
                                  if(sprite[i,j-1]=sprite[i,j]) then begin
                                  cd:=sprite[i,j];
                                  MyLine(x+round(i*kx), y+round(j*ky),x+round(i*kx),y+round((j-1)*ky),cd);
                                   end;
                                   if(sprite[i-1,j]=sprite[i,j]) then begin
                                  cd:=sprite[i,j];
                                  MyLine(x+round(i*kx), y+round(j*ky),x+round((i-1)*kx),y+round(j*ky),cd);
                                   end;
                                  end;

                          end;
                end;

function count(x:real):real;
          var
             y:real;
          begin
          if x=3 then y:=0 else
             begin
             y:=10+((2-x)*x*x)/(3-x);
             end;
             count:=y;
          end;

procedure draw_graph(xs,ys:real;x,y,xn,xk,dx:integer; col:word);
               var
                  c,d:integer;
                  n:integer;
               begin
               d:=xn;
               n:=trunc((xk-xn)/dx + 1);
               XoY(x,y,round(10*xs),blue,blue);
               for c:=1 to n do
                   begin
                        PutPixel(round(xs*d)+x,-round(count(d)*ys)+y,col);
                        d:=d+dx;
                   end;
               end;

procedure XoY(x,y:integer; dx:integer; co,cg:word);
                 var
                      maxX,MaxY:Integer;
                      ErMes:string;
                      nx,ny,i:real;
                      c,cc:integer;
                 begin
                      maxX:=GetMaxX;
                      maxY:=GetMaxY;
                      ErMes:='';
                      if(x<0) then
                              begin
                                   ErMes:=ErMes + (' x<0; ');
                                   x:=0;
                              end;
                      if(y<0) then
                              begin
                                   ErMes:=ErMes + (' y<0; ');
                                   y:=0;
                              end;
                      if x>maxX then
                         begin
                              ErMes:=ErMes+(' x>xMax; ');
                              x:=maxX;
                         end;
                      if y>maxY then
                         begin
                              ErMes:=ErMes+(' y>Ymax; ');
                              y:=maxY;
                         end;
                       if dx<=0 then
                         begin
                              if dx=0 then
                                 begin
                                      ErMes:=ErMes+(' dx=0; ');
                                      dx:=10;
                                 end else if dx<0 then
                                     begin
                                     ErMes:=ErMes+(' dx<0; ');
                                     dx:=abs(dx);
                                     end;
                         end;
                    setcolor(white);
                    Outtextxy(10,10,ErMes); {Errors}
                    Myline(0,y,maxX,y,co);
                    myline(x,0,x,maxY,co);
                    nx:=maxX/dx+1;
                    ny:=maxY/dx+1;
                    cc:=0;
                    c:=x;
                    while c<maxX do
                        begin
                            Myline(c, y+2,c, y-2,cg);
                            c:=c+dx;
                        end;
                    c:=y;
                    while c<maxY do
                          begin
                           Myline(x-2, c,x+2, c,cg);
                            c:=c+dx;
                        end;
                     c:=x;
                     while c>0 do
                          begin
                           Myline(c, y+2,c, y-2,cg);
                            c:=c-dx;
                        end;
                     c:=y;
                     while c>0 do
                          begin
                            Myline(x-2, c,x+2, c,cg);
                            c:=c-dx;
                        end;
                 end;

procedure InGr;
             var
                h,k,l:integer;

             begin

                  DetectGraph(k,l);
                  InitGraph(k,l,'');
                  h:=GraphResult;

                if h<>0 then writeln(graphErrorMsg(h));
                  setgraphmode(2);{ {VGA, 640X480, 16 colors}
             end;

procedure MyLine(x1,y1,x2,y2:integer; col:word);
             var
                y,k:real;
                c,x,yy,px:integer;
             begin
              if x2<x1 then
                begin
                  x1:=x1+x2;
                  x2:=x1-x2;
                  x1:=x1-x2;
                  y1:=y1+y2;
                  y2:=y1-y2;
                  y1:=y1-y2;
                end;
             if x2>x1 then
                begin
                k:=(y2-y1)/(x2-x1);
                     for x:=x1 to x2 do
                         begin
                              y:=k*(x-x1)+y1;
                              putpixel(x,round(y),col);
                         end;
                end;

            if (x1=x2) and (y1=y2) then PutPixel(x1,y1,col);
            if (x1=x2) and (y1<>y2) then
               begin
                    if (y1<y2) then
                       begin
                            for yy:=y1 to y2 do putpixel(x1,yy,col);
                       end;
                    if (y2< y1) then
                       begin
                            for yy:=y2 to y1 do putpixel(x1, yy,col);
                       end;
               end;
             end;
end.