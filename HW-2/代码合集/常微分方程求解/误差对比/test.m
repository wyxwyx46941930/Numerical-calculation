step = zeros(1,10) ;
for k = 1 : 1 : 10
    step(1,k) = k ;
end
%前项欧拉方法
error_1 = preceding();
%后项欧拉方法
error_2 = Latter(); 
%梯形方法
error_3 = Trapezoidal_shape() ;
%改进欧拉方法
error_4 = Improved_Euler_formula() ;

plot(step,log(error_1),'o:b') ;
hold on ;
plot(step,log(error_2),'o:r') ;
hold on ;
plot(step,log(error_3),'o:c') ;
hold on ;
plot(step,log(error_4),'o:g') ;
hold on;
legend('Preceding','Latter','Trapezoidal','Improved');
xlabel('N');
ylabel('Value');
title('四种算法误差对比');