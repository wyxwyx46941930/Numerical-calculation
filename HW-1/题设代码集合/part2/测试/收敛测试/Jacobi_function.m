function error = Jacibo(A,b,n,count) 
    error = zeros(1,count) ;
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
    %迭代求值
    for k = 1 : 1 : count 
        if(norm(x_3-x_2) < Error_term)
            return 
        end 
        x_2 = x_3 ;
        x_3 = B * x_2 + f ;
        error(1,k) = norm(x_3 - x_2) ;
    end
end
