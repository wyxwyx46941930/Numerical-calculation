function time = Jacibo(n) 
%测量100次程序运行的时间
tic
for count = 0 : 1 : 99
    %替换矩阵
    V = diag(rand(n,1));
    M = orth(rand(n));
    A = M * V * M' ;

    %正态分布待测向量
    b = normrnd(0,1,n,1) ;

    %系统求解真实值
    x_1 = A\(b) ;

    %定义求解值x
    x_2 = zeros(n,1);

    %判断矩阵是否收敛
    Radius = vrho(A) ;
    if(Radius > 1)
        disp('Error , This matrix does not converge.');
        return ;
    end 

    %测试模块
        %保证Ax = b有唯一解
        test = [A b] ;
        Rank_A = rank(A) ;
        Rank_test = rank(test) ;
        if( Rank_A ~= Rank_test )
            disp('Error , Rank_A != Rank_test') ;
            return ;
        end
    %模块结束

    %求出A矩阵的对角矩阵
    D = diag(diag(A)) ;
    %求出负下三角矩阵
    L = -tril(A,-1) ;
    %求出负上三角矩阵
    U = -triu(A,1) ;
    %求出B矩阵
    B = D\(L+U) ;
    %求出向量f
    f = D\b ;
    %设置误差量
    Error_term = 1.0e-6;
    %求迭代值
    x_3 = B * x_2 + f ;
    %设置最大迭代次数
    Max_number = 10000000 ;
    %设置当前迭代次数
    Now_number = 1;
    %迭代求值
    while norm(x_3 - x_2) >= Error_term
        x_2 = x_3 ;
        x_3 = B * x_2 + f ;
        Now_number = Now_number + 1 ;
        if( Now_number >= Max_number)
            disp('Error : The number of iterations reached the upper limit');
            break ;
        end
    end
end

%显示算法运算结果与应有结果对比
x_1
x_3
time = toc / 100 ;
end
