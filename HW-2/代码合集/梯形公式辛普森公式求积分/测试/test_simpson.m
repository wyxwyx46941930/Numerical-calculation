[error1,intergration1] = Simpson_formula(5);
[error2,intergration2] = Simpson_formula(9);
[error3,intergration3] = Simpson_formula(17);
[error4,intergration4] = Simpson_formula(33);

error = zeros(1,4) ;
error(1,1) = error1 ;
error(1,2) = error2 ;
error(1,3) = error3 ;
error(1,4) = error4 ;

intergration = zeros(1,4) ;
intergration(1,1) = intergration1 ;
intergration(1,2) = intergration2 ;
intergration(1,3) = intergration3 ;
intergration(1,4) = intergration4 ;

x = zeros(1,4) ;
x(1,1) = 5 ;
x(1,2) = 9 ;
x(1,3) = 17 ;
x(1,4) = 33 ;

intergration
error

subplot(2,1,2) ;
stem(x,log(error));
xlabel('N') ;
ylabel('Error') ;
subplot(2,1,1) ;
plot(x,(intergration),':o');
xlabel('N') ;
ylabel('Intergration') ;