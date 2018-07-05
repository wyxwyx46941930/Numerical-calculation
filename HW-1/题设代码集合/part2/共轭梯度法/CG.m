function time = CG(n) 
%����100��ʵ���ʱ��
tic
for count = 0 : 1 : 99
    %�滻����
    V = diag(rand(n,1));
    M = orth(rand(n));
    A = M * V * M' ;

    %����ֵ��������
    b = normrnd(0,1,n,1) ;

    %�����������㷨���жԱ�
    x_1 = A\(b) ;

    %�����ʼ����
    x_2 = zeros(n,1);

    %����ģ��
        %��֤Ax = B��Ψһ��
        test = [A b] ;
        Rank_A = rank(A) ;
        Rank_test = rank(test) ;
        if( Rank_A ~= Rank_test )
            disp('Error , Rank_A != Rank_test') ;
            return ;
        end
    %ģ�����

    %��¼����ʱ��
    tic
    %�趨������
    Error_term = 1.0e-6 ;

    %����r(0)
    r = b - A * x_2 ;
    %���ò��Ա���
    test_random = zeros(1,100);
    %����p(0)
    p = r ;

    %��ֵģ��
    for k = 1 :1:10000000
        %����a(k)
        a_k = (norm(r)^2)/( p' * A * p) ;
        x_2 = x_2 + a_k * p ;
        %����r(k+1)
        rr = r - a_k * A * p  ;
        %�������С
        if( abs(rr) <= Error_term )
            break ;
        end 
        %�����(k)
        B = (norm(rr)^2) / (norm(r)^2) ;
        %����p(k+1)
        p = rr + B * p ;
        r = rr ;
        if( k >= 10000000 )
            disp('Error : The number of iterations reached the upper limit');
            break ;
        end
    end
end
%�������Ա�
    x_1
    x_2
time = toc / 100 ;
end

