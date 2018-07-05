%初始化
%高斯消去
time1 = 0 ; 
time2 = 0 ;
time3 = 0 ;
time4 = 0 ;
%高斯列主元消去消元
time5 = 0 ;
time6 = 0 ;
time7 = 0 ;
time8 = 0 ;
%高斯赛德尔迭代
time9 = 0 ;
time10 = 0 ;
time11 = 0 ;
time12 = 0 ;
%雅可比迭代
time13 = 0 ;
time14 = 0 ;
time15 = 0 ;
time16 = 0 ;
%SOR
time17 = 0 ;
time18 = 0 ;
time19 = 0 ;
time20 = 0 ;
%CG
time21 = 0 ;
time22 = 0 ;
time23 = 0 ;
time24 = 0 ;

for k = 0 : 1 : 99
    %矩阵A
    V = diag(rand(10,1));
    M = orth(rand(10));
    A = M * V * M' ;
    %待测值向量
    b = normrnd(0,1,10,1) ;
    time1 = time1 + Gauss_function(A,b,10);
    time5 = time5 + Gauss_colfunction(A,b,10);
    time9 = time9 + Jacobi_function(A,b,10) ;
    time13 = time13 + GaussSeidel_function(A,b,10) ; 
    time17 = time17 +  SOR_function(A,b,10,1.5) ;
    time21 = time21 +  CG(A,b,10);
end

for k = 0 : 1 : 99 
    %矩阵A
    V = diag(rand(50,1));
    M = orth(rand(50));
    A = M * V * M' ;
    %待测值向量
    b = normrnd(0,1,50,1) ;
    time2 = time2 + Gauss_function(A,b,50);
    time6 = time6 + Gauss_colfunction(A,b,50);
    time10 = time10 + Jacobi_function(A,b,50) ;
    time14 = time14 + GaussSeidel_function(A,b,50) ; 
    time18 = time18 + SOR_function(A,b,50,1.5) ;
    time22 = time22 +  CG(A,b,50);

end

for k = 0 : 1 : 99
    %矩阵A
    V = diag(rand(100,1));
    M = orth(rand(100));
    A = M * V * M' ;
    %待测值向量
    b = normrnd(0,1,100,1) ;
    time3 = time3 + Gauss_function(A,b,100);
    time7 = time7 + Gauss_colfunction(A,b,100);
    time11 = time11 + Jacobi_function(A,b,100) ;
    time15 = time15 + GaussSeidel_function(A,b,100) ; 
    time19 = time19 + SOR_function(A,b,100,1.5) ;
    time23 = time23 +  CG(A,b,100);
end    

for k = 0 : 1 : 99 
    %矩阵A
    V = diag(rand(200,1));
    M = orth(rand(200));
    A = M * V * M' ;
    %待测值向量
    b = normrnd(0,1,200,1) ;
    time4 = time4 + Gauss_function(A,b,200);
    time8 = time8 + Gauss_colfunction(A,b,200);
    time12 = time12 + Jacobi_function(A,b,200) ;
    time16 = time16 + GaussSeidel_function(A,b,200) ; 
    time20 = time20 +  SOR_function(A,b,200,1.5) ;
    time24 = time24 +  CG(A,b,200);

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
hold on ;

%雅可比作图
X = [10,50,100,200];
Y = [time9/100,time10/100,time11/100,time12/100];
plot(X,Y,'-ro') ;
%模块结束
hold on ;

%高斯赛德尔作图
X = [10,50,100,200];
Y = [time13/100,time14/100,time15/100,time16/100];
plot(X,Y,'-co') ;
%模块结束
hold on ;

%SOR作图
X = [10,50,100,200];
Y = [time17/100,time18/100,time19/100,time20/100];
plot(X,Y,'-mo') ;
%模块结束
hold on ;

%CG作图
X = [10,50,100,200];
Y = [time21/100,time22/100,time23/100,time24/100];
plot(X,Y,'-yo') ;
%模块结束
hold on ;

title('Comparison of six algorithms')
xlabel('Number of column');
ylabel('Time');
legend('GaussFunc','GaussColFunc','Jacobi','Gauss-Seidel','SOR','CG');

