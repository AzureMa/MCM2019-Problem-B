function items=arritems(proportion)
itemmat=xlsread('Ò©Îï.xlsx');
items=[];
itemnumber=1;
for i=1:3
    for j=1:proportion(i)
        items=[items;itemmat(i,:)];
        itemnumber=itemnumber+1;
    end
end
end