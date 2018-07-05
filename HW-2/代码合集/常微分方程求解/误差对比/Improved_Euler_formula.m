function error = myFun()
    error = zeros(1,10);
    h = 0.1 ;
    n = 10 ;
    y_0 = 1 ;
    y_true = zeros(1,10) ;
    y_compute = zeros(1,10) ;
    y_true(1,1) = sqrt(1+2*0.1);

    y_p = y_0 + h * (y_0) ;
    y_c = y_0 + h * (y_p - 2 * 0.1 / y_p) ;
    y_p_1 = (y_p + y_c) / 2 ;
    y_n = y_p_1 ;
    
    y_compute(1,1) = y_n ;
    for k = 1 : 1 : n - 1
        
        y_p = y_n + h * (y_n - 2 * 0.1 * k / y_n ) ;
        y_c = y_n + h * (y_p - 2 * 0.1 * ( k + 1 ) / y_p) ;
        y_p_1 = (y_p + y_c) / 2 ;
        y_n = y_p_1 ;

        y_compute(1,k + 1) = y_p_1 ;
        y_true(1,k + 1) = sqrt(1+2*0.1*(k+1)) ;
    end
    error = abs(y_compute - y_true) ;
end