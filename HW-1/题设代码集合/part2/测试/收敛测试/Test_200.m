error1 = zeros(1,1000); 
error2 = zeros(1,1000); 
error3 = zeros(1,1000); 
error4 = zeros(1,1000); 
for k = 1:1:100
    %����A
    V = diag(rand(200,1));
    M = orth(rand(200));
    A = M * V * M' ;
    %����ֵ����
    b = normrnd(0,1,200,1) ;

    %���A�ĶԽǾ���
    D = diag(diag(A)) ;
    %����������Ǿ���
    U = -triu(A,1) ;
    %����������Ǿ���
    L = -tril(A,-1) ;

    %�жϸ�˹���¶������Ƿ�����
    G = (D-L)\U ;
    if(vrho(G)>1)
        k = k - 1 ;
        continue ;
    end 
    %�ж��ſɱȵ������Ƿ�����
    if(vrho((D\(L+U)))>1)
        k = k - 1 ;
        continue ;
    end 
    error1 = error1 + Jacobi_function(A,b,200,1000);
    error2 = error2 + GaussSeidel_function(A,b,200,1000);
    error3 = error3 + SOR_function(A,b,200,1.5,1000);
    error4 = error4 + CG(A,b,200,1000);
end
error1 = error1 / 100 ; 
error2 = error2 / 100 ;
error3 = error3 / 100 ;
error4 = error4 / 100 ;
plot(1:1:1000,error1,'.:b');
hold on ;
plot(1:1:1000,error2,'.:k');
hold on ;
plot(1:1:1000,error3,'.:r');
hold on ;
plot(1:1:1000,error4,'.:m');
title('n = 200 �����㷨�Ա�')
xlabel('��������');
ylabel('������');
legend('Jacobi','G-Sdel','SOR','CG');