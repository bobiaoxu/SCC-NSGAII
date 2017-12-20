%平均世代距离GD的计算
%pknow为求出来的前沿，ptrue为真实前沿，做法：计算出真实前沿面上若干均匀的点。
%调用之前首先给出真实的前沿面
            %********计算函数2真实的pareto前沿函数值，并且按照f1轴1000等分***********%
%             Ht=1.25+0.75*sin(0.5*pi*environment_t(tt));
%             f1=[0:0.01:1]';
%             f2=1-f1.^Ht;
%             Ture_fitness=[f1,f2];
            %********end*******************% 
function GD_mean=GD(name,t,pknow)
%name为测试函数的名字，t环境变量， D自变量维数， a,b为变量上下界。

%% 真实前沿面的计算
       ptru=ptrue(name,t);
%pknow为求出的目标集B，Ptrue为真实前沿
switch name
    % IGD的计算，pknow为求出的目标集B，Ptrue为真实前沿
    case {'DTLZ1','DTLZ2','DTLZ3','DTLZ4','FDA4','FDA5'}
        dist_temp=zeros(size(ptru));
        dist=zeros(1,size(pknow,1));
        for k=1:size(pknow,1)
            for i=1:size(ptru,1)
                for j=1:size(ptru,1)
                    dist_temp(i,j)=norm((pknow(k,:)-ptru(i,j).Cost),2);
                end
            end
            dist(k)=min(min(dist_temp));
        end
        GD_mean=mean(dist);%二维矩阵求总的平均值
        
    otherwise
        dist_temp=zeros(1,size(ptru,1));
        dist=zeros(1,size(pknow,1));
        for i=1:size(pknow,1)
            for j=1:size(ptru,1)
                dist_temp(j)=norm((pknow(i,:)-ptru(j,:)),2);
            end
            dist(i)=min(dist_temp);
        end
        GD_mean=mean(dist);
        % GD_mean=sum(dist.^2).^0.5/size(pknow,1);%IGDd 程序此处将size(pknow,1)改为size(ptrue,1)
end

% ss1=size(pknow,1);
% ss2=size(ptrue,1);
% deep=[];
% for(i=1:ss1)
%     deep(i)=inf;
%     for(j=1:ss2)
%       aa=(pknow(i,k+1:k+M)-ptrue(j,k+1:k+M)).^2;
%       bb=sqrt(sum(aa));
%       if(bb<deep(i))
%           deep(i)=bb;
%       end
%     end
% end
% sum0=0;
% mean=sum(deep)/ss1;