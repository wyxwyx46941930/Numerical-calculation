function output = myFun()
    x_a = 10 ; %������
    x_b = 11 ; %������
    time = zeros(1,20) ;%��¼ʱ��
    error = zeros(1,20) ;%��¼���
    step = zeros(1,20) ;%��¼����
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
        %ȥ����ʼ���ʱ�両��
        if ( i == 1 )
            time(1,i) = toc ;
        end
        if ( i > 1 )
            time(1,i) = time(1,i-1) + toc ;
        end
    end
    subplot(1,2,1);
    plot(time,log10(error),'o') ;
    title('����ʱ������������ϵͼ');
    xlabel('Time');
    ylabel('Error');
    subplot(1,2,2);
    plot(step,log10(error),'o') ;
    title('������������������ϵͼ');
    xlabel('Step');
    ylabel('Error');
end