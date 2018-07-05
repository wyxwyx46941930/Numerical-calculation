step1 = zeros(9,1) ;
step2 = zeros(9,1) ;
step3 = zeros(9,1) ;
step4 = zeros(9,1) ;
%矩阵A
V = diag(rand(10,1));
M = orth(rand(10));
A = M * V * M' ;
%待测值向量
b = normrnd(0,1,10,1) ;
for  i = 10 : 1 : 19
    step1(i - 9 , :) = SOR_function(A,b,10,i/10,1.0e-6) 
end
subplot(2,2,1);
plot(1:0.1:1.9,step1) ;
title('SOR不同松弛因子对比')
xlabel('W');
ylabel('迭代步数');
legend('n = 10');


%矩阵A
V = diag(rand(50,1));
M = orth(rand(50));
A = M * V * M' ;
%待测值向量
b = normrnd(0,1,50,1) ;
for  i = 10 : 1 : 19
    step2(i - 9 , :) = SOR_function(A,b,50,i/10,1.0e-6) 
end
subplot(2,2,2);
plot(1:0.1:1.9,step2) ;
title('SOR不同松弛因子对比')
xlabel('W');
ylabel('迭代步数');
legend('n = 50');




%矩阵A
V = diag(rand(100,1));
M = orth(rand(100));
A = M * V * M' ;
%待测值向量
b = normrnd(0,1,100,1) ;
for  i = 10 : 1 : 19
    step3(i - 9 , :) = SOR_function(A,b,100,i/10,1.0e-6) 
end
subplot(2,2,3);
plot(1:0.1:1.9,step3) ;
title('SOR不同松弛因子对比')
xlabel('W');
ylabel('迭代步数');
legend('n = 100');


%矩阵A
V = diag(rand(200,1));
M = orth(rand(200));
A = M * V * M' ;
%待测值向量
b = normrnd(0,1,200,1) ;
for  i = 10 : 1 : 19
    step4(i - 9 , :) = SOR_function(A,b,200,i/10,1.0e-6) 
end
subplot(2,2,4);
plot(1:0.1:1.9,step4) ;
title('SOR不同松弛因子对比')
xlabel('W');
ylabel('迭代步数');
legend('n = 200');


