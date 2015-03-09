labels = loadMNISTLabels('train-labels.idx1-ubyte');
sum = 0;
for i=1:60000
    if a(i)==labels(i)
        sum=sum+1;
    end
end
sum/60000