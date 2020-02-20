clear all
%Prepare data
%transform the whole system into a Euler graph
%Calulate the straight distance between the points
location_a=xlsread('地点经纬度.xlsx');
distancep=pdist(location_a(:,4:5));
distancep=111*cos(pi/10).*distancep;
distancesquare=squareform(distancep);
distance=reald(distancesquare);
%distance is the real distance


%list all the points attached with their medicine demand
demand=zeros(25,3);
demand(6,:)=[1,0,0];
demand(16,:)=[2,1,2];
demand(20,:)=[1,1,0];
demand(21,:)=[2,0,1];
demand(25,:)=[1,0,1];

box=[8,10,14;24,20,20];
Cargo=[231,92,94];

hospital = [6,16,20,21,25];
hospital_require=[
    1,0,0;
    2,1,2; 
    1,1,0; 
    2,0,1;
    1,0,1];

[distance_new,path]=dijkstra(distance);
chains=seekchains(distance_new);

pairs=Match(distance_new,chains,hospital);
planes=xlsread('飞机评价.xlsx');
[drone_result,path_to_drone] = selection_of_plane(distance_new,pairs,planes,hospital);
itemmat=xlsread('药物.xlsx');
packing;

%items=arritems([50,50,50]);%将a b c 个药品生成列表
%bestresult=SABPP(items,box2);  





               
         