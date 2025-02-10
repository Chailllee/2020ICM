clc
clear
a=[18.033,16.46,11.766,10.37,9.954,1.265,5.758,8.813,4.300,0.954];  % 人均排放量  
b=[59,6.1,17,8.6,5.14,12.47,4.71,5.86,60,12.9];  % 各国总排放量
v=[-0.0008853470.000261711 4.82294E-050 0.001514192 6.49173E-05 0 -0.010831663-0.007440761 -0.002527061]; % 森林覆盖减少率
s1=[33.930 33.1620 49.7590 32.6910 63.3550 68.4560 6.5640 13.066 22.3540 23.8330]; % 森林覆盖率
s2=ones(1,10)*100;
s=s2-s1; % 森林非覆盖率
data=[a;b;s;v];
data=data';
p_threshold=0.85; % 累计贡献率阈值
[m,n]=size(data);
normal_data=(data-repmat(mean(data),m,1))./repmat(std(data),m,1);
sigama=cov(normal_data);
[V,lamadas]=eig(sigama);
lamada=sum(lamadas);
[order_lamada,index]=sort(-lamada);
order_lamada=-order_lamada;
for i=1:length(lamada)
    P=sum(order_lamada(1:i))/sum(order_lamada);
    if P>p_threshold
        break
    end
end
num_pca=i;
V_main=V(:,index(1:i));
new_score=normal_data*V_main;
disp('特征向量、累计贡献率：')
V_main,P
disp('特征值与主成分个数：')
lamada,num_pca
c=sqrt((order_lamada.*order_lamada)./sum(order_lamada.*order_lamada));
for i=1:10
    score_sum(i)=sum(c.*[s(i),v(i),b(i),a(i)]);    
end
score_sum;
plot3(normal_data(:,1),normal_data(:,2),normal_data(:,3),'b*')
hold on
new_data=(V_main*V_main'*normal_data')';
plot3(new_data(:,1),new_data(:,2),new_data(:,3),'r--o')
xlabel('森林覆盖率减少速度');ylabel('森林非覆盖率');zlabel('人均排放量');
title('原数据与3个主成分得分对比')
legend('原数据','主成分得分');
hold on
h=quiver3(0,0,0,V_main(1,1),V_main(2,1),V_main(3,1),2,'k','LineWidth',1.5);
set(h,'maxheadsize',7);
hold on
h=quiver3(0,0,0,V_main(1,2),V_main(2,2),V_main(3,2),2,'k','LineWidth',1.5);
set(h,'maxheadsize',4);
hold off
view(-50,20)
grid on
