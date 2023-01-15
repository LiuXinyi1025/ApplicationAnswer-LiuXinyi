clear;
clc;
timespan=[0,1.5];
x0=[1,10,0,0];
[time,X]=ode45(@f1,timespan,x0);%MATLAB's own function

% Concentration of E, S, ES and P
figure;
plot(time, X(:,1),'linewidth',1);
ylim([0,14])
hold on;
title('Concentration of E, S, ES and P');
ylabel('Concentration(uM)'); xlabel('Time(s)');
plot(time,X(:,2),'linewidth',1)
plot(time,X(:,3),'linewidth',1)
plot(time,X(:,4),'linewidth',1)
legend('E','S', 'ES','P')

V=X(:,3);    
figure;
plot(X(:,2),V,'linewidth', 1)
xlim([0,15])
ylim([0,0.8])
title('Relationship between S and V')
xlabel('Concentration of S (uM)'); ylabel('Velocity(uM/s)')

% Function definition
function f=f1(t, x)
    f=zeros(4,1);
    f(1)=750*x(3)-100*x(1)*x(2);
    f(2)=600*x(3)-100*x(1)*x(2);
    f(3)=100*x(1)*x(2)-750*x(3);
    f(4)=150*x(3);    
end