Fs = 1000 ; 
Len = 1024 ;
T = 1 / Fs ;
t = (0:Len-1) * T ;
S =  0.7 * sin (2 * pi * 50 * t ) +  sin (2 * pi * 120 * t ) ;
A = 0.7 * sin (2 * pi * 50 * t ) +  sin (2 * pi * 120 * t ) + 2*randn(size(t));
N = 1024 ;
L=length(A(:)); %�������г���
b=0;
%ԭ����
subplot(5,1,1); 
plot(0:1:Len - 1,A); 
title('�������źŵ�A����'); 
%MATLAB�Դ�����fft�Ը����ź���1024��FFT
subplot(5,1,2);
X1=fft(A,N);
X1
P2 = abs(X1/Len) ;
P1 = P2(1:Len) ;
P1(2:end-1) = 2 * P1(2:end-1);
f = Fs * (1:(Len)) / L ; 
plot(f,P1);
title('Matlab�Դ�fft�Լ��Ӹ����źŵ����д���'); 
%MATLAB�Դ�����fft�ԷǸ����ź���1024��FFT
subplot(5,1,3);
X1=fft(S,N);
P2 = abs(X1/Len) ;
P1 = P2(1:Len) ;
P1(2:end-1) = 2 * P1(2:end-1);
f = Fs * (1:Len) / L ; 
plot(f,P1);
title('Matlab�Դ�fft��δ���Ӹ����źŵ����д���'); 
%MATLAB�Դ�����fft�ԷǸ����ź���1024��FFT
subplot(5,1,4);
X1=myfft(A,10);
P2 = abs(X1/Len) ;
P1 = P2(1:Len) ;
P1(2:end-1) = 2 * P1(2:end-1);
f = Fs * (1:Len) / L ; 
plot(f,P1);
title('�Զ���fft�Լ��Ӹ����źŵ����д���'); 
%MATLAB�Դ�����fft�ԷǸ����ź���1024��FFT
subplot(5,1,5);
X1=myfft(S,10);
P2 = abs(X1/Len) ;
P1 = P2(1:Len) ;
P1(2:end-1) = 2 * P1(2:end-1);
f = Fs * (1:Len) / L ; 
plot(f,P1);
title('�Զ���fft��δ���Ӹ����źŵ����д���'); 
