function output = myFun(n)

    x_1 = 0 ;
    x_2 = 1 ;
    h = ( x_2 - x_1 ) / n ;
    Sum_1 = 0 ;
    Sum_2 = 0 ;
    x_k = x_1 + h / 2 ;
    %计算第一个求和
    for k = 0 : 1 : n - 1
        Sum_1 = Sum_1 + 4 * ( sin(x_k) / x_k ) ;
        x_k = x_k + h ;
    end
    x_k2 = x_1 ;
    %计算第二个求和
    for k = 1 : 1 : n - 1
        x_k2 = x_1 + h * k ;
        Sum_2 = Sum_2 + 2 * ( sin(x_k2) / x_k2 ) ;
    end
    %由于sin(x) / x -> 无穷 所以使用洛必达法则求得改点极限为 1 
    integration =  ( h / 6 )  * ( 1 + Sum_1 + Sum_2  + ( sin( x_2 ) / x_2 ) ) ; 
    %下面求使用复合辛普森公式的误差
    %误差公式为 Rn(f) = -(b-a)/180 * ( h / 2 ) ^ 4 * f(四阶导数)(ξk)
    %由课本P108知 sin(x) / x 的k阶导数可近似为 1/(k+1) 
    %所以误差可以理解为 Rn(g) = -(b-a)/180 * ( h / 2 ) ^ 4 * ( 1 / (1+k) )
    error = - ( x_2 - x_1 ) / 180 * ( h / 2 ) ^ 4 * ( 1 / (1 + 4) ) ;
    %显示积分结果
    integration 
    %显示结果
    error = abs(error) 
end