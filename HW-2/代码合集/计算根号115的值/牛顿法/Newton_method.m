function output = myFun(start_number)

    x = start_number ;
    x_k = ( x + 115 / x )/2 ;
    time = zeros(1,10) ;%记录时间
    error = zeros(1,10) ;%记录误差
    step = zeros(1,10);%记录步数
    for i = 1:1:10
        step(1,i) = i - 1 ;
    end
    for i = 1:1:10
        tic
        if( abs( x_k - x ) < 10e-6 )
            time(1,i) = time(1,i-1) + toc ;
            error(1,i) = abs(x_k - x) ;
            break ;
        end
        error(1,i) = abs(x_k - x) ;
        x = x_k ;
        x_k = ( x + 115 / x ) /2 ;
        %消除开始点时间的波动
        if( i == 1)
            time(1,i) = toc ;
        end
        if(i > 1)
            time(1,i) = time(1,i-1) + toc ;
        end
    end
    subplot(1,2,1);
    plot(time,log10(error),'o') ;
    title('运行时间与运算误差关系图')
    xlabel('Time');
    ylabel('Error');
    subplot(1,2,2);
    plot(step,log10(error),'o') ;
    title('迭代步数与运算误差关系图')
    xlabel('Step');
    ylabel('Error');
end