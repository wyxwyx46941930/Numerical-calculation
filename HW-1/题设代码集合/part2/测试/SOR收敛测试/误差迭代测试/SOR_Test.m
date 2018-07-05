error1 = zeros(1,100); 
error2 = zeros(1,100); 
error3 = zeros(1,100); 
error4 = zeros(1,100); 
error5 = zeros(1,100);
%w = 0.4 
for k = 1 : 1 : 100
    %矩阵A
    V = diag(rand(100,1));
    M = orth(rand(100));
    A = M * V * M' ;
    %待测值向量
    b = normrnd(0,1,100,1) ;
    error1 = error1 + SOR_function(A,b,100,0.4,100);
    error2 = error2 + SOR_function(A,b,100,0.8,100);
    error3 = error3 + SOR_function(A,b,100,1.2,100);
    error4 = error4 + SOR_function(A,b,100,1.6,100);
    error5 = error5 + SOR_function(A,b,100,1.9,100);
end
error1 = error1 / 100 ; 
error2 = error2 / 100 ;
error3 = error3 / 100 ;
error4 = error4 / 100 ;
error5 = error5 / 100 ;

plot(1:1:100,error1,'.:b');
hold on ;
plot(1:1:100,error2,'.:m');
hold on ;
plot(1:1:100,error3,'.:r');
hold on ;
plot(1:1:100,error4,'.:k');
hold on ;
plot(1:1:100,error5,'.:g');
hold on ;
title('SOR松弛因子对比')
xlabel('迭代步数');
ylabel('相对误差');
legend('w = 0.4 ','w = 0.8 ','w = 1.2 ','w = 1.6 ', 'w = 1.9');
