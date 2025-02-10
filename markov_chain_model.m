clc
clear
%求温室效应各自的占比贡献率
gas=[74.029696563176420,55.264818514064515,45.921046031906480,55.521458108917550,31.101013055716273,28.474478587938440,73.046676304035430,69.058489019300110,80.854081882604990,62.199547289536380];
rate_gas=gas./sum(gas);
%拟政下EDP生活适应率
gov=[21.3270 16.3193 4.1584 16.6278 11.4301 14.4842 2.0181 15.4726 3.7231 0.7774];
rate_gov=gov./sum(gov);

%交通距离选择率
traff=xlsread('F:\All tasks in BFU\学科竞赛类\2020.1数学建模赛\Model in matlab\pro3_1.xlsx','sheet2','A1:J4');
traf=ones(4,10)./traff;
tra=traf./repmat(sum(traf,2),1,10);
W=[];
for i=1:4
    data=[];pre_data=[];w=[];
    rate_tra=tra(i,:);
    data=[rate_gas;rate_gov;rate_tra];%10*4
    
%熵值法-权重
    % 数据预处理
    [m,~]=size(data);
    pre_data=data./repmat(sum(data),m,1);
    k=1/log(m);
    e=-k.*sum(pre_data.*log(pre_data),1)%信息熵
    %引入信息熵冗余
    d=1-e;
    w=d./sum(d);%一行数列
    W=[W;w];  %最后matrix4*10
end


%%%概率矩阵
ratio=W';% 10*4
% %%%对其主成分分析
% %数据的标准化处理
% [m,~]=size(ratio);
% normal_ratio=(ratio-repmat(mean(ratio),m,1))./repmat(std(ratio),m,1);
% sigama=cov(normal_ratio);%计算协方差矩阵
% [V,lamadas]=eig(sigama);%计算协方差矩阵的特征向量matrix10*4和特征值
% lamada=sum(lamadas);%将特征值保存在一个行向量中matrix 1
% 
% %%特征向量化为权重向量
% ratio_lamd=lamada./sum(lamada);

% %%特征向量化为权重向量
% [n,~]=size(V);
% wei=V./repmat(sum(V),n,1);%matric10*4

%4国人数
p=[454915 162 112423 57439];%%
x=[];
for i=1:4
    x=[x,p(i)*ratio(:,i)];%matrix10*4 上列岛国去左列国家的人数
end
