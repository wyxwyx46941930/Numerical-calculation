function output = myFun(first_number,second_number)
    x_1 = first_number ;
    x_2 = second_number ;
    x_k = x_2 - ( x_2 * x_2 - 115 ) /  (x_2 * x_2 - x_1 * x_1) * (x_2 - x_1) ;
    time = zeros(1,10) ;%记录时间
    error = zeros(1,10) ;%记录误差
    step = zeros(1,10);%记录步数
    for i = 1:1:10
        step(1,i) = i - 1 ;
    end
    for i = 1:1:10
        tic
        if( abs( x_k - x_2 ) < 10e-6 )
            error(1,i) = abs(x_k - x_2) ;
            time(1,i) = time(1,i-1) + toc ;
            break ;
        end
        error(1,i) = abs(x_k - x_2) ;
        x_1 = x_2 ;
        x_2 = x_k ;
        x_k = x_2 - ( x_2 * x_2 - 115 ) / (x_2 * x_2 - x_1 * x_1) * (x_2 - x_1)  ;
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
    title('运行时间与运算误差对比')
    xlabel('Time');
    ylabel('Error');
    subplot(1,2,2);
    plot(step,log10(error),'o') ;
    title('迭代步数与运算误差对比')
    xlabel('Step');
    ylabel('Error');
end