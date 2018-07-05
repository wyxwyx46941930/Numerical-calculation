function error = CG(A,b,n,count) 
    error = zeros(1,count) ;
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
    for k = 1 :1:count
        %����a(k)
        a_k = (norm(r)^2)/( p' * A * p) ;
        x_2 = x_2 + a_k * p ;
        %����r(k+1)
        rr = r - a_k * A * p  ;
        error(1,k) = norm(rr) ;
        %�������С
        if( abs(rr) <= Error_term )
            break ;
        end 
        %�����(k)
        B = (norm(rr)^2) / (norm(r)^2) ;
        %����p(k+1)
        p = rr + B * p ;
        r = rr ;
    end
end

