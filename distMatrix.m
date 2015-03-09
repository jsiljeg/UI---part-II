function d=distMatrix(A,B)

[hA,wA]=size(A);
[hB,wB]=size(B);
REZ = [];
for i=1:hA
    rez=[];
    a=A(i,:);
    for k=1:hB
	% ovdje funkcija udaljenost moze varirati
        rez = [rez,udaljenost(a,B(k,:))];
    end
    REZ = [REZ;rez];
end
d = REZ;