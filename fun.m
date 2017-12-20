function z=fun(name,x,t)
% name为函数名字，D为自变量维数    对应原来的f1函数
%静态函数中，t表示增加的变量个数
switch name
    %%
    case 'SHIYAN'
        n=numel(x);
        fitness1=x(1);
        g=1+x(2).^2+(x(3).*x(4)-0.5).^2;
        h=(1-sqrt(fitness1/g));
        fitness2=g*h;
        z=[fitness1
            fitness2];        
    %%
    case 'ZDT1'
        %nVar=numel(x);变量未增加前，目标函数的个数
        
        n=numel(x);
        fitness1=x(1);
        alpha=t;
%         n=nVar+t;
        G=1/(2+alpha);
        g=1+9/(n-1)*sum((x(2:end)-G).^2);
        h=(1-sqrt(fitness1/g)).^(1+alpha);
        fitness2=g*h;
        z=[fitness1
            fitness2];
        %%
    case 'ZDT2'
        alpha=t;
        n=numel(x);
        fitness1=x(1);
        G=1/(2+alpha);
        g=1+9/(n-1)*sum((x(2:end)-G).^2);
        h=1-(fitness1/g).^2;
        fitness2=g*h;
        z=[fitness1
            fitness2];
        
        %%
    case 'ZDT3'
        alpha=t;
        n=numel(x);
        fitness1=x(1);
        G=1/(2+alpha);
        g=1+9/(n-1)*sum((x(2:end)-G).^2);
        h=1-(fitness1/g).^0.5-(fitness1/g).*sin(10*pi.*fitness1);
        fitness2=g*h;
        z=[fitness1
            fitness2];
        %%
    case 'ZDT4'
        alpha=t;
        n=numel(x);
        fitness1=x(1);
        g=1+10*(n-1)+sum(x(2:end).^2-10*cos(4*pi*x(2:end)));
        h=(1-(fitness1/g).^0.5).^(1+alpha);
        fitness2=g*h;
        z=[fitness1
            fitness2];
        %%
    case 'ZDT6'
        
        n=numel(x);
        fitness1=1-exp(-4*x(1)).*(sin(6*pi*x(1))).^6;
        g=1+9*(sum(x(2:end))/(n-1)).^0.25;
        h=1-(fitness1/g).^2;
        fitness2=g*h;
        z=[fitness1
            fitness2];
        %%
    case 'DTLZ1'
        alpha=t;
        G=(1/(2+alpha));
        n=numel(x);
        g=1*(n-2+sum((x(3:end)-G).^2-cos(20*pi*(x(3:end)-G))));
        fitness1=0.5*x(1)*x(2)*(1+g);
        fitness2=0.5*x(1)*(1-x(2))*(1+g);
        fitness3=0.5*(1-x(1))*(1+g);
        z=[fitness1
           fitness2
           fitness3];
        
              %%
    case 'DTLZ2'  
        alpha=t;
        G=1/(2+alpha);
        g=G+sum((x(3:end)-0.5).^2);
        fitness1=(1+g)*cos(x(1)*(pi/2))*cos(x(2)*(pi/2));
        fitness2=(1+g)*cos(x(1)*(pi/2))*sin(x(2)*(pi/2));
        fitness3=(1+g)*sin(0.5*pi*x(1));
        z=[fitness1
           fitness2
           fitness3];  
        
        
                  %%
    case 'DTLZ3'  
        n=numel(x);
%          g=sum((x(3:end)-0.5).^2);
        g=1*(n-2+sum((x(3:end)-0.5).^2)-sum(cos(20*pi*(x(3:end)-0.5))));
        fitness1=(1+g)*cos(x(1)*(pi/2))*cos(x(2)*(pi/2));
        fitness2=(1+g)*cos(x(1)*(pi/2))*sin(x(2)*(pi/2));
        fitness3=(1+g)*sin(0.5*pi*x(1));
        z=[fitness1
           fitness2
           fitness3]; 
       
                   %%
    case 'DTLZ4'  
        n=numel(x);
        a=t;G=1/(2+a);
        alpha=100;
        g=G+sum((x(3:end)-G).^2);
        fitness1=(1+g)*cos(0.5*pi*x(1)^alpha)*cos(0.5*pi*x(2)^alpha);
        fitness2=(1+g)*cos(0.5*pi*x(1)^alpha)*sin(0.5*pi*x(2)^alpha);
        fitness3=(1+g)*sin(0.5*pi*x(1)^alpha);
        z=[fitness1
           fitness2
           fitness3];       
        
        
        
        
        
        
        
        
        %%
    case 'mop4'
        alpha=0.8;
        b=3;
        fitness1=sum(-10*exp(-0.2*sqrt(x(1:end-1).^2+x(2:end).^2)));
        fitness2=sum(abs(x).^alpha+5*(sin(x)).^b);
        z=[fitness1
            fitness2];
        %%
    case 'FDA1'
        
        Gt=sin(0.5*pi*t);
        g=1+sum((x(2:end)-Gt).^2);
        h=1-sqrt(x(1)./g);
        fitness1=x(1);
        fitness2=g*h;
        z=[fitness1
            fitness2];
        %%
    case 'FDA2.1'
        
        fitness1=x(1);
        g=1+sum(x(2:end).^2);
        Ht=0.75+0.7*sin(0.5*pi*t);
        h=1-(fitness1/g)^((Ht)^(-1));
        fitness2=g*h;
        z=[fitness1
            fitness2];
        %%
    case 'FDA2'
        %          u1=2;   u2=10;%floor(D/2); %group1的变量位置上下界
        %          v1=11;%ceil(D/2);
        %          v2=20; %group2的变量位置上下界
        g=1+sum(x(2:16).^2);
        fitness1=x(1);
        Ht=0.75+0.7*sin(0.5*pi*t);
        %         H2t=(Ht+sum((x(17:31)-Ht).^2))^(-1);
        h=1-(fitness1/g)^(Ht^(-1));
        fitness2=g*h;
        z=[fitness1
            fitness2];
        %%
    case 'FDA3'
        %          Ft=10^(2*sin(0.5*pi*t));
        %          fitness1=sum((x(1:5).^Ft));
        fitness1=x(1);
        Gt=abs(sin(0.5*pi*t));
        g=1+Gt+sum((x(2:20)-Gt).^2);
        h=1-sqrt(fitness1/g);
        fitness2=g*h;
        z=[fitness1
            fitness2];
        
        %%
    case 'FDA4'
        
        Gt=abs(sin(0.5*pi*t));
        g=sum((x(3:end)-Gt).^2);
        fitness1=(1+g)*cos(x(1)*(pi/2))*cos(x(2)*(pi/2));
        fitness2=(1+g)*cos(x(1)*(pi/2))*sin(x(2)*(pi/2));
        fitness3=(1+g)*sin(0.5*pi*x(1));
        z=[fitness1
            fitness2
            fitness3];
        %%
        
    case 'FDA5'
        
        Gt=abs(sin(0.5*pi*t));
        g=Gt+sum((x(3:12)-Gt).^2);
        %
        %          F=1+100*(sin(0.5*pi*t))^4;
        fitness1=(1+g)*cos(0.5*pi*x(1))*cos(0.5*pi*x(2));
        fitness2=(1+g)*cos(0.5*pi*x(1))*sin(0.5*pi*x(2));
        fitness3=(1+g)*sin(0.5*pi*x(1));
        z=[fitness1
            fitness2
            fitness3];
        %%
    case 'DMOP1'
        fitness1=x(1);
        g=1+9*sum(x(2:end).^2);
        Ht=0.75*sin(0.5*pi*t)+1.25;
        h=1-(fitness1/g)^Ht;
        fitness2=g*h;
        z=[fitness1
            fitness2];
        %%
    case 'DMOP2'
        fitness1=x(1);
        Gt=sin(0.5*pi*t);
        g=1+9*sum((x(2:end)-Gt).^2);
        Ht=0.75*sin(0.5*pi*t)+1.25;
        h=1-(fitness1/g)^Ht;
        fitness2=g*h;
        z=[fitness1
            fitness2];
        %%
    case 'DMOP3'
        fitness1=x(1);
        Gt=sin(0.5*pi*t);
        g=1+9*sum((x(2:end)-Gt).^2);
        h=1-(fitness1/g)^(0.5);
        fitness2=g*h;
        z=[fitness1
            fitness2];
        %%
    case 'DSW1'
        
        %           a=[1 0;1 0];b=[1 1];
        Gt=2*t;
        fitness1=(x(1)-Gt)^2+sum(x(g1).^2)+sum((x(g2)-Gt).^2);
        fitness2=(x(1)-Gt-2)^2+sum(x(g1).^2)+sum((x(g2)-Gt).^2);
        z=[fitness1
            fitness2];
        %%
    case 'DSW2'
        Gt=2*t;
        %         a=[0 1;0 1];b=[1 1];
        fitness1=(abs(x(1))-Gt)^2+sum(x(g1).^2)+sum((x(g2)-Gt).^2);
        fitness2=(abs(x(1))-Gt-2)^2+sum(x(g1).^2)+sum((x(g2)-Gt).^2);
        z=[fitness1
            fitness2];
        
        %           fitness1=(abs(x(1))-Gt)^2+sum(x(2:end).^2);
        %           fitness2=(abs(x(1))-Gt-2)^2+sum(x(2:end).^2);
        %%
    case 'DSW3'
        Gt=2*t;
        %         a=[1 0;1 0];b=[0 1];
        fitness1=(x(1))^2+sum(x(g1).^2)+sum((x(g2)-Gt).^2);
        fitness2=(x(1)-Gt-2)^2+sum(x(g1).^2)+sum((x(g2)-Gt).^2);
        z=[fitness1
            fitness2];
        
        %           fitness1=(x(1))^2+sum(x(2:end).^2);
        %           fitness2=(x(1)-Gt-2)^2+sum(x(2:end).^2);
        
        
        
        
        
        
        
        
end

return