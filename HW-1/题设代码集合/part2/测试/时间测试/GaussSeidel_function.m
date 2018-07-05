function time = Gauss_Seider(A,b,n) 
%测试100次实验的总时间
tic
    %判断矩阵是否收敛
    Radius = vrho(A) ;
    if(Radius > 1)
        disp('Error , This matrix does not converge.');
        return 
    end 


    %求解答案与后面的算法进行对比
    x_1 = A\(b) ;

    %定义初始向量
    x_2 = zeros(n,1);

    %测试模块
        %保证Ax = B有唯一解
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
    %求出G矩阵
    G = inv(D-L)*U ;
    %求出f向量
    f = inv(D-L)*b ;
    %设置误差量
    Error_term = 1.0e-6;
    %求迭代值
    x_3 = G * x_2 + f ;
    %设置最大迭代次数
    Max_number = 10000000 ;
    %设置当前迭代次数
    Now_number = 1; 
    %迭代求值
    while norm(x_3 - x_2) >= Error_term
        x_2 = x_3 ;
        x_3 = G * x_2 + f ;
        Now_number = Now_number + 1 ;
        if( Now_number >= Max_number)
            disp('Error : The number of iterations reached the upper limit');
            break ;
        end
    end
time = toc ;
end