function time = Gauss(A,b,n)
%开始计时
tic
    
    
    %求解答案与后面的算法进行对比
    x_1 = A\(b) ;
    
    %定义临时变量用求算法的解
    x_2 = zeros(n,1);

    %这个模块用来保证Ax = B有唯一解
    B = [A b] ;
    Rank_A = rank(A) ;
    Rank_B = rank(B) ;
    if( Rank_A ~= Rank_B )
        disp('Error , Rank_A != Rank_B') ;
        return ;
    end
    %模块结束
    
    %顺序高斯消去
    for k = 1 : n - 1
        for i = k + 1: n
            %判断Akk是否为零
            if(A(k,k) == 0)
                disp('Error , A(k,k) is 0 !') ;
                return ; 
            end
            temp = A(i,k) / A(k,k) ;
            for j = k + 1 : n
                A(i,j) = A(i,j) - temp * A(k,j) ;
            end
            b(i) = b(i) - temp * b(k);
        end
    end 
    %求出解集
    x_2(n) = b(n) / A(n,n);
    for i = n - 1 : -1 : 1
        temp = 0 ;
        for j = i + 1 : n
            temp = temp + A(i,j) * x_2(j) ;
        end
        x_2(i) =( b(i) - temp ) / A(i,i);
    end    
%结束一百次实验取时间平均值
time = toc  ;
 
end