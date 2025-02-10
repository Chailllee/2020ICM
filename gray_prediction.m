clc
clear
syms a b;
c=[a b]';
A=[22.5 15.3 38.3 13.9 31.7 20.3 17.4 14.7 23.5 18 16.1]; % 每年数据
B=cumsum(A);
n=length(A);
for i=1:(n-1)
    C(i)=(B(i)+B(i+1))/2;
end
D=A; D(1)=[]; D=D';
E=[-C;ones(1,n-1)];
c=inv(E*E')*E*D;
c=c';
a=c(1); b=c(2);
F=[];F(1)=A(1);
for i=2:(n + 2)
    F(i)=(A(1)-b/a)/exp(a*(i-1))+b/a;
end
G=[]; G(1)=A(1);
for i=2:(n+2)
    G(i)=F(i)-F(i-1);
end
t1=2008:2020;
t2=2008:2020;
G;a,b,G(2020-2008+1) 
% t=2008:2050;
x=[2008:2020];
t11=linspace(2008,2020);
A_G=[22.5 15.3 38.3 13.9 31.7 20.3 17.4 14.7 23.5 18 16.1 G(2019-2008+1) G(2020-2008+1)];
AA=spline(t1,A_G,t11);
plot(t11,AA,'b',t1,A_G,'ro')
grid on
title('Prediction of Risk Population')
