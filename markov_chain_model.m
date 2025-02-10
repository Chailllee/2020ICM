clc
clear
gas=[74.029696563176420,55.264818514064515,45.921046031906480,55.521458108917550,31.101013055716273,28.474478587938440,73.046676304035430,69.058489019300110,80.854081882604990,62.199547289536380];
rate_gas=gas./sum(gas);
gov=[21.3270 16.3193 4.1584 16.6278 11.4301 14.4842 2.0181 15.4726 3.7231 0.7774];
rate_gov=gov./sum(gov);
traff=xlsread('pro3_1.xlsx','sheet2','A1:J4');
traf=ones(4,10)./traff;
tra=traf./repmat(sum(traf,2),1,10);
W=[];
for i=1:4
    data=[]; pre_data=[]; w=[];
    rate_tra=tra(i,:);
    data=[rate_gas;rate_gov;rate_tra];
    [m,~]=size(data);
    pre_data=data./repmat(sum(data),m,1);
    k=1/log(m);
    e=-k.*sum(pre_data.*log(pre_data),1);
    d=1-e;
    w=d./sum(d);
    W=[W;w];
end
ratio=W';
p=[454915 162 112423 57439];
x=[];
for i=1:4
    x=[x,p(i)*ratio(:,i)];
end
