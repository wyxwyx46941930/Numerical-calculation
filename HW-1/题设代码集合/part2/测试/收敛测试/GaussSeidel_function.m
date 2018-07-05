function error = Gauss_Seider(A,b,n,count) 
    error = zeros(1,count) ;
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
        %保证Ax = B有唯????
        test = [A b] ;
        Rank_A = rank(A) ;
        Rank_test = rank(test) ;
        if( Rank_A ~= Rank_test )
            disp('Error , Rank_A != Rank_test') ;
            return ;
        end
    %模块结束

    %求出A矩阵的对角矩??
    D = diag(diag(A)) ;
    %求出负下三角矩阵
    L = -tril(A,-1) ;
    %求出负上三角矩阵
    U = -triu(A,1) ;
    %求出G矩阵
    G = (D-L)\U ;
    %求出f向量
    f = (D-L)\b ;
    %设置误差??
    Error_term = 1.0e-6;
    %求迭代??
    x_3 = G * x_2 + f ;
    %迭代求??
    for k = 1 : 1 : count 
        x_2 = x_3 ;
        x_3 = G * x_2 + f ;
        error(1,k) = norm(x_3-x_2);
        if(norm(x_3 - x_2) <= Error_term)
            return 
        end 
    end
end