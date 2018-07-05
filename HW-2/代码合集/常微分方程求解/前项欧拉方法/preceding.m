function output = myFun(input)

    h = 0.1 ;
    n = 10 ;
    y_0 = 1 ;
    y_n_1 = y_0 + h * ( y_0 ) ;
    y_n = y_n_1 ;
    y_true = zeros(1,10) ;
    y_compute = zeros(1,10) ;
    y_compute(1,1) = y_n_1 ;
    y_true(1,1) = sqrt(1+2*0.1) ; 
    for k = 1 : 1 : n - 1 
        y_n_1 = y_n +  h * (y_n - 2 * 0.1 * k / y_n ) ;
        y_n = y_n_1 ;
        y_compute(1,k + 1) = y_n_1 ;
        y_true(1,k + 1) = sqrt(1+2*0.1*(k+1)) ;
    end
    y_true
    y_compute
    plot(1:1:10,y_true,'o:b') ;
    hold on ;
    plot(1:1:10,y_compute,'o:r') ;
    legend('True','Compute');
    xlabel('N');
    ylabel('Value');
    title('真实值与计算值的对比');
    
end