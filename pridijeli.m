for i=1:10
    subplot(4,3,i),imshow(1-reshape(mean(X(:,idx==i)')',28,28)/255)
end