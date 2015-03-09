function idx = mykmeans( X, n )

    [r, c] = size(X);
    idx = zeros(1, c);
    
    p = randperm(c);
    C = X(:, p(1:n));
    
    for i=1:c
        l = zeros(1,n);
        
        for j=1:n
			%%ovdje isto moze varirati funkcija udaljenost
            l(j) = udaljenost(X(:,i),C(:,j));
        end
        
        [~, m] = min(l);
        idx(i) = m;
    end
    
    promjena = 1;
    
    while promjena,
        if promjena
            for i=1:n
                br = 0;
                prosjek = zeros(r,1);
                for j=1:c
                    if idx(j) == i
                        prosjek = prosjek + X(:,j);
                        br = br + 1;
                    end
                end
				%po tockama
                C(:,i) = prosjek./br;
            end
        end
        
        promjena = 0;
        
        for i=1:c
            l = zeros(1,n);
            
            for j=1:n
                l(j) = udaljenost(X(:,i),C(:,j));
            end
        
            [~, m] = min(l);
        
            if m ~= idx(i)
                idx(i) = m;
                promjena = 1;
            end
        end
    end
end
                
        
