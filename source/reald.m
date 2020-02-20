function distance_r=reald(distancesquare)
distance_r=distancesquare;
route=[1 2;1 3;1 4;2 5;3 6;3 4;4 7;4 8;5 8;6 7;6 8;6 10;7 11;7 13;8 9;8 11;10 12;11 13;11 14;12 13;12 16;13 14;13 15;14 18;14 19;14 17;15 16;16 17;16 20;16 21;16 17;17 18;18 19;18 21;19 23;20 21;20 22;21 23;21 24;22 25;23 24;23 25;24 25];
for i=1:size(distancesquare)
    for j=1:size(distancesquare)
        if i~=j
            flag=0;
            for k=1:length(route)
                if ismember([i,j],route(k,:))==[1,1]
                   flag=1;
                   break
                end
            end
            switch flag
                case 0
                    distance_r(i,j)=9999;
                case 1
                    continue
            end
        end
    end
end
end