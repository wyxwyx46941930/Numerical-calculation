function output = myFun(n)

    x_1 = 0 ;
    x_2 = 1 ;
    h = ( x_2 - x_1 ) / n ;
    Sum = 0 ;
    for k = 1 : 1 : n - 1
        x_k = x_1 + h * k ;
        Sum = Sum + 2 * ( sin(x_k) / x_k ) ;
    end
    %由于sin(x) / x -> 无穷 所以使用洛必达法则求得改点极限为 1 
    integration =  ( h / 2 )  * ( 1 + Sum + ( sin( x_2 ) / x_2 ) ) ; 
    %下面求使用复合梯形公式的误差
    %误差公式为 Rn(f) = -(b-a)/12 * h ^ 2 * f(二阶导数)(ξk)
    %由课本P108知 sin(x) / x 的k阶导数可近似为 1/(k+1) 
    %所以误差可以理解为 Rn(g) = -(b-a)/12 * h ^ 2 * ( 1 / (1+k) )
    error = - ( x_2 - x_1 ) / 12 * h ^ 2 * ( 1 / (1 + 2) ) ;
    %显示积分结果
    integration 
    %显示结果
    error = abs(error) 
end