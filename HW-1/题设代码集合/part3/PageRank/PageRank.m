function time = Page_Rank()
time = 0 ;
[i,j] = textread('C:\Users\dell\Desktop\Data.txt','%f%f','headerlines',2)
i = i + 1 ;
j = j + 1 ;
P = sparse(transpose(i),transpose(j),1,75890,75890);
%处理死点问题 
for k = 1:1:75890
    if(sum(P(:,i)) == 0)
        P(:,i) = 1 ;
    end
end

%限定阻尼系数
d = 0.85;
%统计矩阵的大小
n = size(P);
n = n(1,1);
%创建稀疏向量e
e = sparse(n,1);
%归一化处理将所有的列变为该列和的1/n
for i=1:n
    if(sum(P(i,:)))
        P(i,:)=P(i,:)/sum(P(i,:));
    end
end
disp('归一化计算完成');
error = 1.0e-6 ;
%将P'赋给P
P = P';
x = ones(n,1);
%创建迭代向量r
r = d*P*x+(1-d)*e*(e'*x)/n;
%迭代求r
while (norm(r-x)>error)
    x = r;
    r = d*P*x+(1-d)*e*(e'*x)/n;
end
%创建B矩阵用于输出序号
B = zeros(75890,2) ;
B(:,1) = r ;
for k = 1 : 1 : 75890
    B(k,2) = k ;
end 
%排序
C = -sortrows(-B,1);
%输出第一列数据大小
C(1:10,1)
%输出第二列序号
C(1:10,2) 
end
