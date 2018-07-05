function error = CG(A,b,n,count) 
    error = zeros(1,count) ;
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

    %记录运算时间
    tic
    %设定误差变量
    Error_term = 1.0e-6 ;

    %定义r(0)
    r = b - A * x_2 ;

    %设置测试变量
    test_random = zeros(1,100);

    %定义p(0)
    p = r ;

    %求值模块
    for k = 1 :1:count
        %定义a(k)
        a_k = (norm(r)^2)/( p' * A * p) ;
        x_2 = x_2 + a_k * p ;
        %定义r(k+1)
        rr = r - a_k * A * p  ;
        error(1,k) = norm(rr) ;
        %求出误差大小
        if( abs(rr) <= Error_term )
            break ;
        end 
        %定义β(k)
        B = (norm(rr)^2) / (norm(r)^2) ;
        %定义p(k+1)
        p = rr + B * p ;
        r = rr ;
    end
end

