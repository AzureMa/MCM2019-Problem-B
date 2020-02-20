function [result,path_to_drone]=selection_of_plane(W,pairs,planes,hospital)

n=length(pairs(:,1));
result=cell(n,3);
path_to_drone=zeros(n,length(hospital));
for i=1:n
    for j=1:length(hospital)
        capa=[];
        p=find(pairs{i,1}==pairs{i,2}(j));
        for k=1:length(planes(:,1))
            if planes(k,6)*planes(k,5)/60/2>=W(hospital(j),pairs{i,2}(j))
                capa=[capa,k];
            end
        end
        %try to find the best plane for the hospital
        score = (planes(k,6)*planes(k,5)).^0.6.*(planes(capa,4)./planes(capa,1)./planes(capa,2)./planes(capa,3).*(8*planes(capa,9)-7)).^0.4;
        [temp ,temp_id] = max(score);
        best=capa(temp_id);
        result{i,p}=[result{i,p},best];
        path_to_drone(i,j)=best;
        
    end
    
end
end