function chains=seekchains(distance_new)
chains={};
for i=1:length(distance_new)
    for j=i+1:length(distance_new)
        for k=j+1:length(distance_new)
            X=[i,j,k];
            Xreach=zeros(1,3);
            Y=[6,16,20,21,25];
            Yreach=zeros(1,5);
            for p=1:3
                for q=1:5
                    if distance_new(X(p),Y(q))<26.4
                       Yreach(q)= Yreach(q)+1;
                       Xreach(p)= Xreach(p)+1;
                    end
                for pp=1:3
                    if distance_new(X(p),X(pp))>0 && distance_new(X(p),X(pp))<52.6
                       Xreach(p)=Xreach(p)+1;
                    end
                end
            end
            if ismember(0,Yreach)==0 && ismember(0,Xreach)==0
                chains{length(chains)+1}=[i,j,k];
            end
            end
    end
end
end
end