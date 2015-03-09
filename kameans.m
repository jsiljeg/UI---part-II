function y = kameans ( m,k,isrand)

if nargin<2, k=1; end

[maxR,maxC]=size(m);
if maxR<=k
    y = [1:maxR]
else 
    %inicijalna vrijednost centroida
    if isrand
        p = randperm(size(m,1)); % random inicijalizacija
        for i=1:k
            c(i,:)=m(p(i),:);
        end
    else
        for i=1:k
            c(i,:)=m(i,:);  %sekvencijalna inicijalizacija
        end
    end
    
    temp = zeros(maxR,1);
    
    while 1
        d=distMatrix(m,c); % raèuna object-centroid dist
        [z,g]=min(d,[],2); % find group matrix g
        if g==temp
            break;
        else temp=g;
        end
        for i=1:k
            f=find(g==i);
            if f    %only compute centroid if f is not empty 
                c(i,:)=mean(m(find(g==i),:),1);
            end
        end
    end
    
    y=[g];
end
