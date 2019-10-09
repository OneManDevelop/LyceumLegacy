program tipovik;
uses crt;
const
fldr='D:\tp7\';
type
nz=(ort,rus,tvz,tv6,mtv);
cont=record
p1:byte;
p2:nz;
p3:string;
p4:byte;{in minutes}
p5:string;
end;
ptr=^channel;
channel=record
inf:cont;
next:ptr;
end;
myFile= file of cont;

var
f:myfile;
inpoint,midpoint:ptr;
{}

function getP2(fieldID:nz):string;
var res:string;
begin
 case fieldID of
  ort:res:='ort';
  rus:res:='russia';
  tvz:res:='tvz';
  tv6:res:='tv6';
  mtv:res:='mtv';
 end;
getP2:=res;
end;

procedure inpElem(var inFile:MyFile);
var id:byte;
a:cont;
begin
write('num: ');
readln(a.p1);
writeln('nazvanie(1-ort,2-russia,3-tvz,4-tv6,5-mtv):');
readln(id);
a.p2:=nz(id);
write('nazv peredachi: ');
readln(a.p5);
write('length(minutes): ');
readln(a.p4);
write('leading man: ');
readln(a.p5);
write(inFile,a);
end;

procedure inpSingle(var a:cont);
var id:byte;
begin
write('num: ');
readln(a.p1);
writeln('nazvanie(1-ort,2-russia,3-tvz,4-tv6,5-mtv):');
readln(id);
a.p2:=nz(id);
write('nazv peredachi: ');
readln(a.p5);
write('length(minutes): ');
readln(a.p4);
write('leading man: ');
readln(a.p5);
end;

procedure inpFile(var inFile:myFile);
var sz,i:byte;
begin
writeln('enter size of file');
readln(sz);
rewrite(inFile);
for i:=1 to sz do
inpElem(inFile);
end;


procedure OutpElem(a:channel);
begin
write('num: ');
writeln(a.inf.p1);
writeln('nazvanie(1-ort,2-russia,3-tvz,4-tv6,5-mtv):');
writeln(getP2(a.inf.p2));
writeln('nazv peredachi: ');
writeln(a.inf.p3);
write('length(minutes): ');
write(a.inf.p4);
write(' leading man: ');
writeln(a.inf.p5);
end;

procedure AddBeg(var FirstPtr:ptr; val:cont;var inFile:myFile);
var k:ptr;
begin
new(k);
k^.next:=firstPtr;
read(inFile,val);
k^.inf:=val;
firstptr:=k;
end;

procedure CreateBeg(var firstptr:ptr;{sz:byte;}var  infile:myfile);
var {k:ptr;}
v:cont;
i:byte;
begin
{}reset(infile);
firstPtr:=nil;
while not eof(infile) do{for i:=1 to sz do}
begin
 {inpElem(v);}{read from file}
 {read(infile,v);}
 addbeg(firstptr,v,infile);
end;
end;

procedure count(first:ptr; var last:ptr; var lg:byte);
var i:byte;
k:ptr;
begin
lg:=0;
k:=first;
while k<>nil do
 begin
 lg:=lg+1;
 last:=k;
 k:=k^.next;
 end;
end;


{second is larger in case of length= 3,5,7, etc}
procedure ripMid(frst:ptr; var middle:ptr);
var md,i:byte;
tr:ptr;
begin
count(frst,tr,md);
md:=(md div 2);
tr:=frst;
for i:=1 to (md-1) do
begin
tr:=tr^.next;
end;
middle:=tr^.next;{in case of 3,5,7 aim on 1,2,3}
tr^.next:=nil;
end;

procedure AddEnd(frst:ptr);
var val:cont;
h,last:ptr;
md:byte;
i,lng:byte;
begin
count(frst,last,md);
writeln('enter how many to add');
readln(lng);
{}for i:=1 to lng do
begin
 new(h);
 last^.next:=h;
 inpSingle(val);
 h^.inf:=val;
 h^.next:=nil;
end;
end;

procedure uvolit(frst:ptr);
var k:ptr;
s:string;
begin
k:=frst;
writeln('Enter surname to remove: ');
readln(s);

if k^.inf.p5<>s then
{where is touble}while (k^.next^.inf.p5 <> s) and (k^.next<>nil) do
 k:=k^.next;

if k^.next<>nil then {perestrahovalsya}
 k^.next:=k^.next^.next;
end;

procedure sort(frst:ptr);
var fl:boolean;
k:ptr;
dub:cont;
begin
fl:=false;
while not fl do
 begin
 k:=frst;
 fl:=true;
 while k^.next<>nil do
  begin
  if (k^.inf.p3)>(k^.next^.inf.p3) then
   begin
   fl:=false;
   dub:=k^.inf;
   k^.inf:=k^.next^.inf;
   k^.next^.inf:=dub;
   end;
  k:=k^.next;
  end;
 end;
end;

procedure outp(firstptr:ptr);
var k:ptr;
begin
k:=firstptr;
writeln;
writeln('list: ');
while  k<>nil do
begin
writeln;
outpElem(k^);
k:=k^.next;
end;
end;

BEGIN
clrscr;
assign(f,fldr+'dtipf.pas');
{inpFile(f);}
createBeg(inpoint,f);
ripMid(inpoint,midpoint);
addEnd(midpoint);
sort(inpoint);
uvolit(midpoint);

outp(inpoint);
{writeln('______________');
outp(midpoint); }

close(f);
release(heaporg);
readln;
END.