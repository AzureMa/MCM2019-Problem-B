
function plan=scheduling(best_p)
%flight plan
%packing_med_result
%We are now trying to generate a flighting schedule for our previous selection of position and packing  
%������ҽԺ����ʣ�µ�ȥ��� transportation reconnaissance
best_point=[]
pairs=best_p(3)ÿ��ҽԺ���ӵ����ӱ��
path_to_drone=[]ÿ��ҽԺѡ��ķɻ�����,����
group=[]ÿ��point��group����
best_packing=[]ÿ��������ķɻ��ͺź����� %pairs+path_to_droneΪ�˻�schedule
temp=bestpacking;
schedule=[best_point,group,pairs��]
for i=1:length(hospital)
    temp(pairs(i),:)= temp(pairs(i),:)-path_to_drone(i,:) ;    
end

%��ʼ�滮����\̽·:
for i=best_point
    for j=best_point
        if i~=j && W(i,j)<=Lmax
            %����ͨ
            if bestpacking(i,2)>0
                temp(i,2)=temp(i,2)-1
                schedule=[schedule;i,2,j]
            end
        end
           
    end          
end
for i=best_point
    for j=1:n
        if find(best_point==j)==0 && W(i,j)<=Lmax/2
            temp(i,2)=temp(i,2)-1
                schedule=[schedule;i,2,j]
        end
    end
end
end