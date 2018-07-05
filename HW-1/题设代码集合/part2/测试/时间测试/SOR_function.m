function time = XOR(A,b,n,W)
%测量时间
tic
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

    %求出A的对角矩阵
    D = diag(diag(A)) ;
    %求出负上三角矩阵
    U = -triu(A,1) ;
    %求出负下三角矩阵
    L = -tril(A,-1) ;
    %取出松弛因子
    w = W ;
    %求出B矩阵
    B = (D - w * L) \ ( (1-w) * D + w * U) ;
    %求出f
    f = w * ( (D - w * L) \ b );
    %设定误差项
    Error_term = 1.0e-6;
    %求值
    for k = 1:1:10000000
        y = B * x_2 + f ;
        if(norm(y-x_2) < Error_term)
            break ;
        end 
        if( k >= 10000000 )
            disp('Error : The number of iterations reached the upper limit');
            break ;
        end
        x_2 = y ;
    end
%结束
time = toc;
end
