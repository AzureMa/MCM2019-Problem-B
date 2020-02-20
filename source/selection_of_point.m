%after bin packing
%packing_med_result应形如{chain1的装箱结果，chain2的装箱结果，chain3的装箱结果;}
%装箱结果应形如[number_of_A,med1_in_A, med2_in_A, med3_in_A;]
function best_p=selection_of_point(W ,pairs,packing_med_result ,ratio)
%ratio ∈(0，1): to change the strategy between transportation and reconnaissance
max_D=26;
for i=1:length(pairs)
    point_of_transportation =0;
    point_of_reconnaissance =0;
    for j=pairs(i,1)
        for k=1:length(W)
            if W(j,k)<=max_D
                point_of_reconnaissance=point_of_reconnaissance+1; 
                if k~=j && ismember(k,hospital)
                    point_of_reconnaissance=point_of_reconnaissance+1;   %可以设置让连通的策略加分更多
                end
            end
        end
        tr=packing_med_result{i,:};
        temp=0
        for j=1:length(tr) 
            temp=temp+sum(tr{j});
        end
        point_of_transportation=point_of_transportation+temp;

        end
            
    end
    point=point_of_transportation^ratio*point_of_reconnaissance^(1-ratio);
    if point>best_p{2}
        best_p={pairs(i,1),point,i,packing_med_result(i,:)};
    end

end

end