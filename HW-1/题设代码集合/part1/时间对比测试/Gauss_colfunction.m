function time = Gauss_col(A,b,n)
%计时1000次实验的时间
tic
    %求解答案与后面的算法进行对比
    x_1 = A\(b) ;

    %定义临时变量用求算法的解
    x_2 = zeros(n,1);

    %测试模块
        %保证Ax = B有唯一解
        B = [A b] ;
        Rank_A = rank(A) ;
        Rank_B = rank(B) ;
        if( Rank_A ~= Rank_B )
            disp('Error , Rank_A != Rank_B') ;
            return ;
        end
    %模块结束

    %测试模块
        %列主元变换
        for p=1:n-1
            %找出某一列主元最大的行
            t=find(abs(B(p:end,p))==max(abs(B(p:end,p))))+p-1;
            %如果该行不是最大主元所在的行
            if abs(B(t,p))~=abs(B(p,p))
                %完成当前行与最大的行交换
                l=B(t,:);
                if(t==5)
                    B(t,:)=B(p,:);
                    B(p,:)=l;
                end
            end  
            %列主元判断
            for k=p+1:n
                if(B(p,p) == 0)
                    disp('Error , A(k,k) is 0 !') ;
                    return ;
                end 
                temp = B(k,p) / B(p,p);
                %完成消元变化过程
                B(k,p:n+1) = B(k,p:n+1) - temp * B(p,p:n+1);
            end
        end
    %模块结束

    %将简化后的B的最后一列赋给b
    b=B(1:n,n+1);

    %将变换后的B的前N-1列赋给A
    A=B(1:n,1:n);

    %求值模块
        x_2(n) = b(n) / A(n,n);
        for i = n - 1 : -1 : 1
            temp = 0 ;
            for j = i + 1 : n
                temp = temp + A(i,j) * x_2(j) ;
            end
            x_2(i) =( b(i) - temp ) / A(i,i);
        end
    %模块结束
%结束计时取一百次实验平均值
time = toc ;

end