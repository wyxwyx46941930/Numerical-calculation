function output = myFun()
    x_a = 10 ; %左区间
    x_b = 11 ; %右区间
    time = zeros(1,20) ;%记录时间
    error = zeros(1,20) ;%记录误差
    step = zeros(1,20) ;%记录步数
    for k = 1 : 1 : 20 
        step(1,k) = k - 1 ;
    end
    for  i = 1:1:20
        tic
        x_b-x_a
        i
        if( x_b - x_a < 10e-6)
            error(1,i) = x_b - x_a ;
            time(1,i) = time(1,i-1) + toc ;
            break ;
        end
        error(1,i) = x_b - x_a ;
        x_c = ( x_a + x_b ) / 2 ;
        if( ( x_c * x_c - 115 ) * ( x_a * x_a - 115 ) < 0 )
            x_b = x_c ;
        end
        if( ( x_c * x_c - 115 ) * ( x_a * x_a - 115 ) > 0 )
            x_a = x_c ;
        end
        if( ( x_c * x_c - 115 ) * ( x_a * x_a - 115 ) == 0 )
            break
        end
        %去除开始点的时间浮动
        if ( i == 1 )
            time(1,i) = toc ;
        end
        if ( i > 1 )
            time(1,i) = time(1,i-1) + toc ;
        end
    end
    subplot(1,2,1);
    plot(time,log10(error),'o') ;
    title('运行时间与运算误差关系图');
    xlabel('Time');
    ylabel('Error');
    subplot(1,2,2);
    plot(step,log10(error),'o') ;
    title('迭代步数与运算误差关系图');
    xlabel('Step');
    ylabel('Error');
end