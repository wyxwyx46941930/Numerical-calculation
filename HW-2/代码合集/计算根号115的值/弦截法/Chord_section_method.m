function output = myFun(first_number,second_number)
    x_1 = first_number ;
    x_2 = second_number ;
    x_k = x_2 - ( x_2 * x_2 - 115 ) /  (x_2 * x_2 - x_1 * x_1) * (x_2 - x_1) ;
    time = zeros(1,10) ;%��¼ʱ��
    error = zeros(1,10) ;%��¼���
    step = zeros(1,10);%��¼����
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
        %������ʼ��ʱ��Ĳ��� 
        if( i == 1)
            time(1,i) = toc ;
        end
        if(i > 1)
            time(1,i) = time(1,i-1) + toc ;
        end
    end
    subplot(1,2,1);
    plot(time,log10(error),'o') ;
    title('����ʱ�����������Ա�')
    xlabel('Time');
    ylabel('Error');
    subplot(1,2,2);
    plot(step,log10(error),'o') ;
    title('�����������������Ա�')
    xlabel('Step');
    ylabel('Error');
end