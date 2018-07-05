function [A] = myfft(A,M) 
    N=2^M;  % M 表示层数
    LH=N/2; 
    J=LH; 
    N1=N-2; 
    %倒序程序
    A = bitrevorder(A) ;
    W = exp(-j*2*pi/N) ;
    for L=1:1:M    
        B=2^(L-1);
        K = N / (2 ^ L) ;      
        for k = 0 : 1 : K -1
            for J = 0 : 1 : B -1
                p = J * 2 ^ (M - L) ;
                q = A(k*2^L+J+1) ;
                A(k*2^L+J+1) = q + W ^ p * A(k*2^L+J+B+1) ;
                A(k*2^L+J+B+1) = q - W ^ p * A(k*2^L+J+B+1) ;
            end
        end 
    end
    B=(0);
    for i=1:2^M
        B(i)=A(i);
    end
    A=B;
end