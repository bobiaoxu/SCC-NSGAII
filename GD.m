%ƽ����������GD�ļ���
%pknowΪ�������ǰ�أ�ptrueΪ��ʵǰ�أ��������������ʵǰ���������ɾ��ȵĵ㡣
%����֮ǰ���ȸ�����ʵ��ǰ����
            %********���㺯��2��ʵ��paretoǰ�غ���ֵ�����Ұ���f1��1000�ȷ�***********%
%             Ht=1.25+0.75*sin(0.5*pi*environment_t(tt));
%             f1=[0:0.01:1]';
%             f2=1-f1.^Ht;
%             Ture_fitness=[f1,f2];
            %********end*******************% 
function GD_mean=GD(name,t,pknow)
%nameΪ���Ժ��������֣�t���������� D�Ա���ά���� a,bΪ�������½硣

%% ��ʵǰ����ļ���
       ptru=ptrue(name,t);
%pknowΪ�����Ŀ�꼯B��PtrueΪ��ʵǰ��
switch name
    % IGD�ļ��㣬pknowΪ�����Ŀ�꼯B��PtrueΪ��ʵǰ��
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
        GD_mean=mean(dist);%��ά�������ܵ�ƽ��ֵ
        
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
        % GD_mean=sum(dist.^2).^0.5/size(pknow,1);%IGDd ����˴���size(pknow,1)��Ϊsize(ptrue,1)
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