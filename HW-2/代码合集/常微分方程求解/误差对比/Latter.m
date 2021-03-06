function error = myFun()
    error = zeros(1,10);
    h = 0.1 ;
    n = 10 ;
    y_0 = 1 ;
    y_n_1 = ( y_0 + sqrt(y_0 * y_0 - 4 * (1 - h) * 2 * h * 0.1) ) / (2 * (1 - h)) ; 
    y_n = y_n_1 ;
    y_true = zeros(1,10) ;
    y_compute = zeros(1,10) ;
    y_compute(1,1) = y_n_1 ;
    y_true(1,1) = sqrt(1+2*0.1) ; 
    for k = 1 : 1 : n - 1 
        y_n_1 = ( y_n + sqrt(y_n * y_n - 4 * (1 - h) * 2 * h * (0.1*(k+1))) ) / (2 * (1 - h));
        y_n = y_n_1 ;
        y_compute(1,k + 1) = y_n_1 ;
        y_true(1,k + 1) = sqrt(1+2*0.1*(k+1)) ;
    end
    error = abs(y_compute - y_true) ;
    
end