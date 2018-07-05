error = zeros(1,3) ;
error(1,1) = linear_interpolation ;
error(1,2) = quadratic_interpolation ;
error(1,3) = Cubic_interpolation ;

error

plot(1:1:3,log10(error),'o:');
xlabel('插值多项式的次数');
ylabel('误差项的次数')
