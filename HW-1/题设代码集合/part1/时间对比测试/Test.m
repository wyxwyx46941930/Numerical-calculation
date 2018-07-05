%初始化
time1 = 0 ; 
time2 = 0 ;
time3 = 0 ;
time4 = 0 ;
time5 = 0 ;
time6 = 0 ;
time7 = 0 ;
time8 = 0 ;

for k = 0 : 1 : 99
    %生成n*n的随机矩阵   
    A = normrnd(10,1,10,10) ;
    %生成n*1的随机矩矩阵
    b = normrnd(10,1,10,1) ;
    time1 = time1 + Gauss_function(A,b,10);
    time5 = time5 + Gauss_colfunction(A,b,10);
end

for k = 0 : 1 : 99 
    %生成n*n的随机矩阵   
    A = normrnd(10,1,50,50) ;
    %生成n*1的随机矩矩阵
    b = normrnd(10,1,50,1) ;
    time2 = time2 + Gauss_function(A,b,50);
    time6 = time6 + Gauss_colfunction(A,b,50);

end

for k = 0 : 1 : 99
    %生成n*n的随机矩阵   
    A = normrnd(10,1,100,100) ;
    %生成n*1的随机矩矩阵
    b = normrnd(10,1,100,1) ;
    
    time3 = time3 + Gauss_function(A,b,100);
    time7 = time7 + Gauss_colfunction(A,b,100);
end    

for k = 0 : 1 : 99 
    %生成n*n的随机矩阵   
    A = normrnd(10,1,200,200) ;
    %生成n*1的随机矩矩阵
    b = normrnd(10,1,200,1) ;

    time4 = time4 + Gauss_function(A,b,200);
    time8 = time8 + Gauss_colfunction(A,b,200);

end    
%高斯消元法输出
X = [10,50,100,200];
Y = [time1/100,time2/100,time3/100,time4/100];
plot(X,Y,'-bo') ;
%模块结束
hold on ;

%列高斯消去法作图
X = [10,50,100,200];
Y = [time5/100,time6/100,time7/100,time8/100];
plot(X,Y,'-go') ;
%模块结束
title('Comparison of two algorithms')
xlabel('Number of column');
ylabel('Time');
legend('GaussFunc','GaussColFunc');

