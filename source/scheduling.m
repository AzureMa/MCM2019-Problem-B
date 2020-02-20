
function plan=scheduling(best_p)
%flight plan
%packing_med_result
%We are now trying to generate a flighting schedule for our previous selection of position and packing  
%先满足医院需求，剩下的去侦察 transportation reconnaissance
best_point=[]
pairs=best_p(3)每个医院连接的箱子编号
path_to_drone=[]每个医院选择的飞机种类,数量
group=[]每个point的group构成
best_packing=[]每个箱子里的飞机型号和数量 %pairs+path_to_drone为运货schedule
temp=bestpacking;
schedule=[best_point,group,pairs反]
for i=1:length(hospital)
    temp(pairs(i),:)= temp(pairs(i),:)-path_to_drone(i,:) ;    
end

%开始规划相连\探路:
for i=best_point
    for j=best_point
        if i~=j && W(i,j)<=Lmax
            %可联通
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