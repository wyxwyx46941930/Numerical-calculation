function output = myFun()

    % 由于0.35位于0.34与0.36之间且接近0.33所以这里使用sin(0.33),sin(0.34)与sin(0.36)的值进行二次插值计算
    sin_34 = 0.333487 ;
    sin_36 = 0.352274 ;
    sin_32 = 0.314567 ;
    sin_38 = 0.370920 ;
    x_2 = 0.36 ;
    y_2 = sin_36 ;
    x_1 = 0.34 ;
    y_1 = sin_34 ;
    x_0 = 0.32 ;
    y_0 = sin_32 ;
    x = 0.35 ;
    sin_35 = y_0 * ((x - x_1) * (x - x_2) / ((x_0 - x_1)*( x_0 - x_2 )) ) + ( y_1 * (x - x_0) * (x - x_2) / ((x_1 - x_0)*( x_1 - x_2)) ) + ( y_2 * (x - x_0) * (x - x_1) / ((x_2 - x_0)*( x_2 - x_1 )) ) ;
    %真实计算值
    fprintf('\nThe computing value is %5.15f\n',sin_35);
    %实际值
    fprintf('\nThe true value is %5.15f\n',sin(0.35));
    %误差
    fprintf('\nThe error is %5.15f\n',abs(sin(0.35) - sin_35)); 
end