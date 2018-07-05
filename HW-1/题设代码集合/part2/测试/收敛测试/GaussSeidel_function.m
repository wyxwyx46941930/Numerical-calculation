function error = Gauss_Seider(A,b,n,count) 
    error = zeros(1,count) ;
    %�жϾ����Ƿ�����
    Radius = vrho(A) ;
    if(Radius > 1)
        disp('Error , This matrix does not converge.');
        return 
    end 
    %�����������㷨���жԱ�
    x_1 = A\(b) ;

    %�����ʼ����
    x_2 = zeros(n,1);

    %����ģ��
        %��֤Ax = B��Ψ????
        test = [A b] ;
        Rank_A = rank(A) ;
        Rank_test = rank(test) ;
        if( Rank_A ~= Rank_test )
            disp('Error , Rank_A != Rank_test') ;
            return ;
        end
    %ģ�����

    %���A����ĶԽǾ�??
    D = diag(diag(A)) ;
    %����������Ǿ���
    L = -tril(A,-1) ;
    %����������Ǿ���
    U = -triu(A,1) ;
    %���G����
    G = (D-L)\U ;
    %���f����
    f = (D-L)\b ;
    %�������??
    Error_term = 1.0e-6;
    %�����??
    x_3 = G * x_2 + f ;
    %������??
    for k = 1 : 1 : count 
        x_2 = x_3 ;
        x_3 = G * x_2 + f ;
        error(1,k) = norm(x_3-x_2);
        if(norm(x_3 - x_2) <= Error_term)
            return 
        end 
    end
end