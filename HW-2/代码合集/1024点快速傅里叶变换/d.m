Fs = 1000 ; 
Len = 1024 ;
T = 1 / Fs ;
t = (0:Len-1) * T ;
S =  0.7 * sin (2 * pi * 50 * t ) +  sin (2 * pi * 120 * t ) ;
A = 0.7 * sin (2 * pi * 50 * t ) +  sin (2 * pi * 120 * t ) + 2*randn(size(t));
N = 1024 ;
L=length(A(:)); %输入序列长度
b=0;
%原序列
subplot(5,1,1); 
plot(0:1:Len - 1,A); 
title('含干扰信号的A序列'); 
%MATLAB自带函数fft对干扰信号求1024点FFT
subplot(5,1,2);
X1=fft(A,N);
X1
P2 = abs(X1/Len) ;
P1 = P2(1:Len) ;
P1(2:end-1) = 2 * P1(2:end-1);
f = Fs * (1:(Len)) / L ; 
plot(f,P1);
title('Matlab自带fft对夹杂干扰信号的序列处理'); 
%MATLAB自带函数fft对非干扰信号求1024点FFT
subplot(5,1,3);
X1=fft(S,N);
P2 = abs(X1/Len) ;
P1 = P2(1:Len) ;
P1(2:end-1) = 2 * P1(2:end-1);
f = Fs * (1:Len) / L ; 
plot(f,P1);
title('Matlab自带fft对未夹杂干扰信号的序列处理'); 
%MATLAB自带函数fft对非干扰信号求1024点FFT
subplot(5,1,4);
X1=myfft(A,10);
P2 = abs(X1/Len) ;
P1 = P2(1:Len) ;
P1(2:end-1) = 2 * P1(2:end-1);
f = Fs * (1:Len) / L ; 
plot(f,P1);
title('自定义fft对夹杂干扰信号的序列处理'); 
%MATLAB自带函数fft对非干扰信号求1024点FFT
subplot(5,1,5);
X1=myfft(S,10);
P2 = abs(X1/Len) ;
P1 = P2(1:Len) ;
P1(2:end-1) = 2 * P1(2:end-1);
f = Fs * (1:Len) / L ; 
plot(f,P1);
title('自定义fft对未夹杂干扰信号的序列处理'); 
