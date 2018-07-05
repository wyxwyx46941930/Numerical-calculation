function time = Jacibo(n) 
%����100�γ������е�ʱ��
tic
for count = 0 : 1 : 99
    %�滻����
    V = diag(rand(n,1));
    M = orth(rand(n));
    A = M * V * M' ;

    %��̬�ֲ���������
    b = normrnd(0,1,n,1) ;

    %ϵͳ�����ʵֵ
    x_1 = A\(b) ;

    %�������ֵx
    x_2 = zeros(n,1);

    %�жϾ����Ƿ�����
    Radius = vrho(A) ;
    if(Radius > 1)
        disp('Error , This matrix does not converge.');
        return ;
    end 

    %����ģ��
        %��֤Ax = b��Ψһ��
        test = [A b] ;
        Rank_A = rank(A) ;
        Rank_test = rank(test) ;
        if( Rank_A ~= Rank_test )
            disp('Error , Rank_A != Rank_test') ;
            return ;
        end
    %ģ�����

    %���A����ĶԽǾ���
    D = diag(diag(A)) ;
    %����������Ǿ���
    L = -tril(A,-1) ;
    %����������Ǿ���
    U = -triu(A,1) ;
    %���B����
    B = D\(L+U) ;
    %�������f
    f = D\b ;
    %���������
    Error_term = 1.0e-6;
    %�����ֵ
    x_3 = B * x_2 + f ;
    %��������������
    Max_number = 10000000 ;
    %���õ�ǰ��������
    Now_number = 1;
    %������ֵ
    while norm(x_3 - x_2) >= Error_term
        x_2 = x_3 ;
        x_3 = B * x_2 + f ;
        Now_number = Now_number + 1 ;
        if( Now_number >= Max_number)
            disp('Error : The number of iterations reached the upper limit');
            break ;
        end
    end
end

%��ʾ�㷨��������Ӧ�н���Ա�
x_1
x_3
time = toc / 100 ;
end
