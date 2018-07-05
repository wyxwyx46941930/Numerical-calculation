error1 = zeros(1,100); 
error2 = zeros(1,100); 
error3 = zeros(1,100); 
error4 = zeros(1,100); 
for k = 1:1:100
    %矩阵A
    V = diag(rand(50,1));
    M = orth(rand(50));
    A = M * V * M' ;
    %待测值向量
    b = normrnd(0,1,50,1) ;

    %求出A的对角矩�?
    D = diag(diag(A)) ;
    %求出负上三角矩阵
    U = -triu(A,1) ;
    %求出负下三角矩阵
    L = -tril(A,-1) ;

    %判断高斯赛德尔迭代是否收敛
    G = (D-L)\U ;
    if(vrho(G)>1)
        k = k - 1 ;
        continue ;
    end 
    %判断雅可比迭代法是否收敛
    if(vrho((D\(L+U)))>1)
        k = k - 1 ;
        continue ;
    end 
    error1 = error1 + Jacobi_function(A,b,50,100);
    error2 = error2 + GaussSeidel_function(A,b,50,100);
    error3 = error3 + SOR_function(A,b,50,1.5,100);
    error4 = error4 + CG(A,b,50,100);
end
error1 = error1 / 100 ; 
error2 = error2 / 100 ;
error3 = error3 / 100 ;
error4 = error4 / 100 ;
plot(1:1:100,error1,'.:b');
hold on ;
plot(1:1:100,error2,'.:k');
hold on ;
plot(1:1:100,error3,'.:r');
hold on ;
plot(1:1:100,error4,'.:m');
title('n = 50 四种算法对比')
xlabel('迭代步数');
ylabel('相对误差');
legend('Jacobi','G-Sdel','SOR','CG');