Program First;
Uses Crt;

VAR
i,j,k,cur_i,cur_j,hop_count:byte;
A:array[1..3,1..3] of byte;
Bom:Array[1..10000,1..5] of byte;
path_num,total,m,n:longint;


Procedure PATH(cur_i,cur_j:byte; k:byte);
VAR
i,j:byte;
m,n:integer;

begin

{We will calclate only path amount, but not detailed paths, because of
limitation to array size.
Actually you can make detailed path up to 5 hops. You just should uncomment
calculating of array 'Bom'}

A[cur_i,cur_j]:=1;
for i:=1 to 3 do
begin
    for j:=1 to 3 do
    begin

{        Bom[path_num,k]:=cur_i*10+cur_j;}
        if k<hop_count then
        begin

        {Checking possibility of doing next-hop}

             if (A[i,j]=0)and

             not(

             ((i=cur_i)and(abs(j-cur_j)>1)and(A[i,2]=0))
             or
             ((j=cur_j)and(abs(i-cur_i)>1)and(A[2,j]=0))
             or
             ( (abs(i-cur_i)>1) and (abs(j-cur_j)>1) and (A[2,2]=0))

             )
             then
                begin

                     {We will enlarge path number if hop amount in path is
                     qual to actual hop amount only}
                     if k=hop_count then
                     begin
                          path_num:=path_num+1;
{                          Bom[path_num,k+1]:=i*10+j;}
                     end;
                     A[i,j]:=1;
                     {Recursive running of path calculation}
                     PATH(i,j,k+1);
                     A[i,j]:=0;
                end;
        end
        else
        begin
             if (A[i,j]=0)and

             not(

             ((i=cur_i)and(abs(j-cur_j)>1)and(A[i,2]=0))
             or
             ((j=cur_j)and(abs(i-cur_i)>1)and(A[2,j]=0))
             or
             ( (abs(i-cur_i)>1) and (abs(j-cur_j)>1) and (A[2,2]=0))

             )
             then
             begin
             {Enlarge path number after exit out of procedure}
{                     Bom[path_num,k+1]:=i*10+j;}
                     path_num:=path_num+1;
             end;

        end;
    end;
end;
end;



begin

{A[x,y] - Array of 0 and 1.
0 - this point isn't in path yet. You can move here.
1 - this point is in path already. You can't move here.
}
ClrScr;
writeln ('Hello, Habrahabr. Let','''','s count amount of Android Graphical passwords.');
writeln;

i:=1;
j:=1;
k:=1;

for hop_count:=4 to 8 do
begin

     path_num:=1;
     for i:=1 to 3 do
         for j:=1 to 3 do
         begin
{            Bom[path_num,k]:=10*i+j;}

            PATH(i,j,k);
            a[i,j]:=0;
         end;
     writeln('Hops: ',hop_count,'. Path amount: ',path_num-1);
     total:=total+path_num-1;


end;

writeln('===========================');
writeln('Total amount:         ',total);


{Output of full list of paths.}

{for m:=1 to path_num do
begin
    write('Path ', m,': (');
    for n:=1 to hop_count+1 do
    begin
         write(Bom[m,n],' ');
    end;
    writeln(')');

    readln;
end;{}
readln;
end.
