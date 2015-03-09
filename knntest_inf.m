function [ label ] = knntest_inf( y, X, idx_adj, k )

neighborIds = zeros(size(y,1),k);
neighborDistances = neighborIds;

numDataVectors = size(X,1);
    %samo se promijeni nacin na koji se metrika racuna
    dist = max(((repmat(y,numDataVectors,1)-X).^2).^0.5,[],2);
    [~, sortpos] = sort(dist,'ascend');
    neighborIds = sortpos(1:k);
	label = mode(idx_adj(neighborIds));

end

