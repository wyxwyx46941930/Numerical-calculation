function error = Jacibo(A,b,n,count) 
    error = zeros(1,count) ;
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
    %������ֵ
    for k = 1 : 1 : count 
        if(norm(x_3-x_2) < Error_term)
            return 
        end 
        x_2 = x_3 ;
        x_3 = B * x_2 + f ;
        error(1,k) = norm(x_3 - x_2) ;
    end
end
