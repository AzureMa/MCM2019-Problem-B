function [Wnew,dijkpath] = Dijk(W)
%DIJK Summary of this function goes here
%   W  Ȩֵ����   st ���������   e �������յ�
n=length(W);%�ڵ���
Wnew=zeros(n);
dijkpath=cell(n);
for st=1:n
    D = W(st,:);
    visit= ones(1,n); visit(st)=0;
    parent = zeros(1,n);%��¼ÿ���ڵ����һ���ڵ�
    path =[];
    for i=1:n-1
        temp = [];
        %��������������̾������һ���㣬ÿ�β����ظ�ԭ���Ĺ켣������visit�жϽڵ��Ƿ����
        for j=1:n
           if visit(j)
               temp =[temp D(j)];
           else
               temp =[temp inf];
           end

        end
        [value,index] = min(temp);
        visit(index) = 0;
        %���� �������index�ڵ㣬����㵽ÿ���ڵ��·�����ȸ�С������£���¼ǰ���ڵ㣬����������ѭ��
        for k=1:n
            if D(k)>D(index)+W(index,k)
               D(k) = D(index)+W(index,k);
               parent(k) = index;
            end
        end

    end
    Wnew(st,:) = D;%��̾���
    %���ݷ�  ��β����ǰѰ������·��
    for e=1:n
        t = e;
        path=[];
        while t~=st && t>0
         path =[t,path];
          p=parent(t);t=p;
        end
        path =[st,path];%���·��
        dijkpath{st,e}=path;
    end
end

end


