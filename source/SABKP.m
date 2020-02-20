function bestbkp=SABKP(itemsorg,box)
items=itemsorg(:,1:3);
St=1.0;
Et=0.01;
dt=0.5;
L=0;
dl=3;%this is the number of types of medicine
for i=1:length(items(:,1))
    X=items(i,:);
    items(i,:)=sort(X,'descend'); 
end
%initialize the choice
Bbest=items;
fbest=BKP(items,box);%best result
f=fbest;
%SA initialize
t=St;
Lt=L;
while t>=Et
    items2=items;%reset the items
    for j=1:Lt
        for s=1:length(items2(:,1))
            if rand<t
                randindex=randperm(3);
                itemnew=items2(s,randindex);
                items2(s,:)=itemnew;
            end
            if rand<t
                itemtemp=items2(s,:);
                Index=randi(length(items2(:,1)));
                items2(s,:)=items2(Index,:);
                items2(Index,:)=itemtemp;
            end
        end
            ftemp=BKP(items2,box);
            df=ftemp{1}-f{1};
            if df>0
                f=ftemp;
                B=items2;
                if f{1}>fbest{1}
                    fbest=f;
                    Bbest=B;
                end
            elseif rand<exp(10*df/t)
                f=ftemp;
                B=items2;
            end
    end
    Lt=Lt+dl;
    t=t*dt;
    
end
bestbkp={fbest,Bbest};
end