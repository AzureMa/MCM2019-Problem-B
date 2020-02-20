%packing_med_result应形如{chain1的装箱结果，chain2的装箱结果，chain3的装箱结果;}
%装箱结果应形如[number_of_A,med1_in_A, med2_in_A, med3_in_A;]
packing_med_result= cell(length(pairs(:,1)),3);
group_of_drones=cell(length(pairs(:,1)),3);
for j=1:length(pairs(:,1))
    item_of_point_in_Agroup=zeros(3);
    for i=1:length(hospital)
        drone=path_to_drone(j,i);
        select_box=box(planes(drone,9),:);
        p=find(pairs{j,1}==pairs{j,2}(i));
        item_list=[];
        item_of_point_in_Agroup(p,:)=item_of_point_in_Agroup(p,:)+hospital_require(i,:);
        for k=1:3
            
            for s=1:hospital_require(i,k)     
                item_list=[item_list;itemmat(k,:)] ;
            end
        end
        bestbpp=SABPP(item_list,select_box);
        %药品装进1or2,判断有几个1or2 ，将其换算成携带1or2的飞机 然后根据planes进行二次装箱
        %i医院对应的点为pairs{j,2}(i),p=find(pairs{j,1}==pairs{j,2}(2)) 
        
        for l=1:bestbpp{1, 1}{1, 2} 
            group_of_drones{j,p} =[group_of_drones{j,p},drone];
        end
        
        %list_of_containers{i}=itemlist;
       
    end
    item_of_point_in_Agroup;
    for i=1:3
        list_of_a_group=[];
        for s=group_of_drones{j,i}
            for k=s
                list_of_a_group=[list_of_a_group;planes(k,:)];
            end
        end
        list_of_groups=list_of_a_group;
        item_of_point_in_groups=item_of_point_in_Agroup(i,:);
        count=0
        while length(bestbkp{1}{3}(:,1))>=length(list_of_groups(:,1))
                list_of_groups=[list_of_groups;list_of_a_group];
                item_of_point_in_groups=item_of_point_in_groups+item_of_point_in_Agroup(i,:);
                bestbkp=SABKP(list_of_groups,Cargo);
                count=count+1
        end
        item_of_point_in_groups=item_of_point_in_groups-item_of_point_in_Agroup(i,:);
        packing_med_result{j,i}=item_of_point_in_groups
            
    end

   % list_of_groups=list_of_a_group;
  %  item_of_point_in_groups=item_of_point_in_Agroup;
   % bestbkp=SABKP(list_of_groups,Cargo);
   % while length(bestbkp{2}(:,1))>=length(list_of_groups(:,1))
   % list_of_groups=[list_of_groups;list_of_a_group];
    %item_of_point_in_groups=item_of_point_in_groups+item_of_point_in_Agroup
   % bestbkp=SABKP(list_of_groups,Cargo);
   % end
   % item_of_point_in_groups=item_of_point_in_groups-item_of_point_in_Agroup;
   % packing_med_result{j}=item_of_point_in_groups;
        %item_of_point_in_groups=item_of_point_in_groups+item_of_point_in_Agroup
        
   
                
end