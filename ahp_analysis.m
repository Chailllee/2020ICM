
clc
clear

%%%%%%%%%%%%%%%%%%%% step1 求市场经济/法政/文化各因子权值（特征值）%%%%%%%%%%%%%%%%%%%%%%%
data1=xlsread('pro3_1.xlsx','H25:J34' ); %%
[m,n]=size(data1);

%step1-特征值
%数据的标准化处理
normal_data1=(data1-repmat(mean(data1),m,1))./repmat(std(data1),m,1);
sigama1=cov(normal_data1);%计算协方差矩阵
[~,lamadas1]=eig(sigama1);%计算协方差矩阵的特征值和特征向量
lamada1=sum(lamadas1);%将特征值保存在一个行向量中matrix 1*3


%step2-熵值法-权重
% 数据预处理
pre_data1=data1./repmat(sum(data1),m,1);
k=1/log(m);
e1=-k.*sum(pre_data1.*log(pre_data1),1)%信息熵
%引入信息熵冗余
d1=1-e1;
w1=d1./sum(d1);

%step3-score
score1=sum(lamada1.*w1);

our=[1.4736 1.4543 0.5847];
mul=[1.4171 1.4543 0.5876];
ori=[1.4171 1.5662 0.5816];

%%%%%%%准则矩阵B
A=[];%2×2matric
for i=1:3
    for j=1:3
        A=[A, ori(i)/ori(j)]; %a12=λ11/λ12
    end
end
A=reshape(A,3,3)';

a=[our;mul;ori]';
A11=[];%3*3matric
for i=1:3
    for j=1:3
        A11=[A11, a(1,i)/a(1,j)]; %a12=λ11/λ12
    end
end
A11=reshape(A11,3,3)';

A22=[];%3*3matric
for i=1:3
   for j=1:3
        A22=[A22, a(2,i)/a(2,j)]; %a12=λ11/λ12
    end
end
A22=reshape(A22,3,3)';

A33=[];%3*3matric
for i=1:3
   for j=1:3
        A33=[A33, a(3,i)/a(3,j)]; %a12=λ11/λ12
    end
end
A33=reshape(A33,3,3)';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% step2 准则层 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Az=[1 1 5;
    1 1 7;
    1/5 1/7 1]
[n,~]=size(A);%由于矩阵构造方法的原因，矩阵都是正方形的所以关于矩阵的大小只需要取一个参数
Asum=sum(A,1);%求每一列的和
Aprogress=A./(ones(n,1)*Asum);%计算每一列个元素在这一列占的比重
WA=sum(Aprogress,2)./n;%每一行元素相加取平均值，需要注意这里W是个列项量且所有值加起来等于1
w=A*WA;%如果A的矩阵是理想状况的话这里W=w
lam=sum(w./WA)/n;%通过这一步最大lam
RI=[0,0,0.58,0.9,1.12,1.24,1.32,1.41,1.45];
CI=(lam-n)/(n-1);
CR=CI/RI(n);%计算误差
if CR<0.10 %如果误差小于0.1则可以接受
    disp('此矩阵的一致性可以接受!');
    fprintf('Cl=');disp(CI);
    fprintf('CR=');disp(CR);
    fprintf('W=');disp(WA);
else
    disp('此矩阵的一致性不可以接受!');
end

%%%%%%%%%方案层
%A11=[1 1/2;2 1]
lam=[];
[n,~]=size(A11);%由于矩阵构造方法的原因，矩阵都是正方形的所以关于矩阵的大小只需要取一个参数
A1sum=sum(A11,1);%求每一列的和
Aprogress1=A11./(ones(n,1)*A1sum);%计算每一列个元素在这一列占的比重
WA1=sum(Aprogress1,2)./n;%每一行元素相加取平均值，需要注意这里W是个列项量且所有值加起来等于1
w=A11*WA1;%如果A的矩阵是理想状况的话这里W=w
lam=sum(w./WA1)/n;%通过这一步最大lam
RI=[0,0,0.58,0.9,1.12,1.24,1.32,1.41,1.45];
CI=(lam-n)/(n-1);
CR=CI/RI(n);%计算误差
if CR<0.10 %如果误差小于0.1则可以接受
    disp('此矩阵的一致性可以接受!');
    fprintf('Cl=');disp(CI);
    fprintf('CR=');disp(CR);
    fprintf('W=');disp(WA1);
else
    disp('此矩阵的一致性不可以接受!');
end

lam=[];
[n,~]=size(A22);%由于矩阵构造方法的原因，矩阵都是正方形的所以关于矩阵的大小只需要取一个参数
A2sum=sum(A22,1);%求每一列的和
Aprogress2=A22./(ones(n,1)*A2sum);%计算每一列个元素在这一列占的比重
WA2=sum(Aprogress2,2)./n;%每一行元素相加取平均值，需要注意这里W是个列项量且所有值加起来等于1
w=A22*WA2;%如果A的矩阵是理想状况的话这里W=w
lam=sum(w./WA2)/n;%通过这一步最大lam
RI=[0,0,0.58,0.9,1.12,1.24,1.32,1.41,1.45];
CI=(lam-n)/(n-1);
CR=CI/RI(n);%计算误差
if CR<0.10 %如果误差小于0.1则可以接受
    disp('此矩阵的一致性可以接受!');
    fprintf('Cl=');disp(CI);
    fprintf('CR=');disp(CR);
    fprintf('W=');disp(WA2);
else
    disp('此矩阵的一致性不可以接受!');
end

lam=[];
[n,~]=size(A33);%由于矩阵构造方法的原因，矩阵都是正方形的所以关于矩阵的大小只需要取一个参数
A3sum=sum(A33,1);%求每一列的和
Aprogress3=A33./(ones(n,1)*A3sum);%计算每一列个元素在这一列占的比重
WA3=sum(Aprogress3,2)./n;%每一行元素相加取平均值，需要注意这里W是个列项量且所有值加起来等于1
w=A33*WA3;%如果A的矩阵是理想状况的话这里W=w
lam=sum(w./WA3)/n;%通过这一步最大lam
RI=[0,0,0.58,0.9,1.12,1.24,1.32,1.41,1.45];
CI=(lam-n)/(n-1);
CR=CI/RI(n);%计算误差
if CR<0.10 %如果误差小于0.1则可以接受
    disp('此矩阵的一致性可以接受!');
    fprintf('Cl=');disp(CI);
    fprintf('CR=');disp(CR);
    fprintf('W=');disp(WA3);
else
    disp('此矩阵的一致性不可以接受!');
end

%%%%%%%%%%%%%%%%%%%%%%%% step3 比较各方案权重占比 %%%%%%%%%%%%%%%%%%%%%%%%%

scoreA1=sum(WA.*WA1);
scoreA2=sum(WA.*WA2);
scoreA3=sum(WA.*WA3);
