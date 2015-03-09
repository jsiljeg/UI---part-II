function [ label ] = knntest( y, X, idx_adj, k )

neighborIds = zeros(size(y,1),k);
neighborDistances = neighborIds;

numDataVectors = size(X,1);
    %euklidska udaljenost se gleda, a namjena kao i u knn fileu
    dist = sum((repmat(y,numDataVectors,1)-X).^2,2);
    [~, sortpos] = sort(dist,'ascend');
    neighborIds = sortpos(1:k);
	label = mode(idx_adj(neighborIds));

end

