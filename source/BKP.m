function BKPresult=BKP(items,box)%items is the sequence of sorting
H=box(1);
W=box(2);
D=box(3);
n=length(items(:,1));
fang={};
Vitems=0;
cap=0.93;
I={[0,0,0]};
Lx=0;
Lz=0;    
i=1;
already=[];
while i<=n && Vitems/(H*W*D)<cap
    flag=0;
    for X=I
        X=X{1};
        x=X(1);
        y=X(2);
        z=X(3);
        if items(i,1)+x<=Lx  && items(i,3)+z<=Lz && items(i,2)+y<=W
            flag=1;
            break
        end
    end
    if flag==0
        if Lx==0
            if items(i,3)+Lz<=D
                x=0;
                y=0;
                z=Lz;
                flag=1;
                Lz=Lz+items(i,3);
                Lx=items(i,1);
                for j=1:length(I) 
                        X=I(j);
                        X=X{1};
                        if isequal(X,[x,y,z])
                            fang{length(fang)+1}=[x,y,z];
                            if x+items(i,1)<=H
                                I{j}=[x+items(i,1),y,z];
                            end
                            if y+items(i,2)<=W
                               I{length(I)+1}=[x,y+items(i,2),z];
                            end
                            if z+items(i,3)<=D
                               I{length(I)+1}=[x,y,z+items(i,3)];
                            end
                            %平移过程
                            Inew={};
                            for k=1:length(I) 
                                da=0;
                                for t=1:length(I)
                                    if k==t
                                        continue
                                    elseif ismember(0,I{k}>=I{t})==0
                                       da=1;
                                       break
                                    end
                                end
                                if da==0
                                    Inew{length(Inew)+1}=I{k};
                                end
                            end
                            I=Inew;
                            Vitems=Vitems+items(i,1)*items(i,2)*items(i,3);
                            already=[already,i];
                            break
                        end
                 end
            elseif Lz<D
                Lz=D;
                Lx=H;
                i=i-1;
            end
        elseif Lx~=H
            for X=I 
                X=X{1};
                x=X(1);
                y=X(2);
                z=X(3);
                if z+items(i,3)<=Lz && Lx+items(i,1)<=H && x==Lx && y==0
                    flag=1;
                    Lx=Lx+items(i,1);
                    for j=1:length(I) 
                        X=I(j);
                        X=X{1};
                        if isequal(X,[x,y,z])
                            fang{length(fang)+1}=[x,y,z];
                            if x+items(i,1)<=H
                                I{j}=[x+items(i,1),y,z];
                            end
                            if y+items(i,2)<=W
                               I{length(I)+1}=[x,y+items(i,2),z];
                            end
                            if z+items(i,3)<=D
                               I{length(I)+1}=[x,y,z+items(i,3)];
                            end
                            %平移过程
                            Inew={};
                            for k=1:length(I) 
                                da=0;
                                for t=1:length(I)
                                    if k==t
                                        continue
                                    elseif ismember(0,I{k}>=I{t})==0
                                      da=1;
                                      break
                                    end
                                end
                                if da==0
                                    Inew{length(Inew)+1}=I{k};
                                end
                            end
                            I=Inew;
                            Vitems=Vitems+items(i,1)*items(i,2)*items(i,3);
                            already=[already,i];
                            break
                        end
                    end
                    break 
                end
            end
            if flag==0
               Lx=H;
               i=i-1;
            end
        elseif Lx==H && Lz+items(i,3)<=D
            Lz=Lz+items(i,3);
            i=i-1;
        elseif Lx==H && Lz==D
            break %jump out of the while
        end
    elseif flag==1 %if flag=true we can fit the item in at the first time
        for j=1:length(I)
            X=I(j);
            X=X{1};
            if isequal(X,[x,y,z])
                fang{length(fang)+1}=[x,y,z];
                 if x+items(i,1)<=H
                     I{j}=[x+items(i,1),y,z];
                 end
                 if y+items(i,2)<=W
                     I{length(I)+1}=[x,y+items(i,2),z];
                 end
                 if z+items(i,3)<=D
                     I{length(I)+1}=[x,y,z+items(i,3)];
                 end
                %平移过程
                Inew={};
                for k=1:length(I) 
                    da=0;
                    for t=1:length(I)
                        if k==t
                            continue
                        elseif ismember(0,I{k}>=I{t})==0
                          da=1;
                          break
                        end
                    end
                     if da==0
                        Inew{length(Inew)+1}=I{k};
                     end
                end
                I=Inew;
                Vitems=Vitems+items(i,1)*items(i,2)*items(i,3);
                already=[already,i];
                break
            end
        end
    end
i=i+1;
end  
%这步开始删去用过的items
%disp('循环完了一次')
itemsnew=[];
for k=1:n
    if ismember(k,already)==0
        continue
    else
        itemsnew=[itemsnew;items(k,:)];
    end
end
items=itemsnew;
B=Vitems/(H*W*D);
BKPresult={B,length(items),items};
end