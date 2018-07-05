function output = myFun()

    %生成n*n的随机矩阵   
    A = normrnd(10,1,10000,10) ;

    %生成n*1的随机矩矩阵
    b = normrnd(10,1,10000,1) ;

    %求解答案与后面的算法进行对比
    x_1 = A\(b) ;
    
    %定义临时变量用求算法的解
    x_2 = zeros(10 ,1) ;
    x_3 = zeros(10 ,1) ;
    %设定误差
    error = zeros(10000,1) ;
    step = zeros(10000,1) ;
    for i = 1 : 1 : 10000
        step(i,1) = i - 1 ;
    end
    p_0 = 10000 *  eye(10);
    for k = 1 : 1 : 10000
        Q_0 = ( p_0 * (A(k,:))' ) / (1 + A(k,:) * p_0 * (A(k,:))' ) ;
        p_1 = (eye(10) - Q_0*A(k,:))*p_0 ;   
        p_0 = p_1 ;
        x_3 = x_2 + Q_0*(b(k,1) - A(k,:)*x_2) ;
        x_2 = x_3 ;
        error(k,1) = norm(x_3 - x_1) ;
    end
    x_3
    x_1
    plot(step,log(error)) ;
    title('迭代步数与运算误差对比')
    xlabel('Step');
    ylabel('Error');
end