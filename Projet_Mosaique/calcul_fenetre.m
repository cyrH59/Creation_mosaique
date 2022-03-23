function [B2]=calcul_fenetre(hmat,B)

h=B(1,2);
w=B(2,1);
Y=zeros(4,1);
X=zeros(4,1);


Y(1)=floor((hmat(1,1)*1+hmat(1,2)*1+hmat(1,3))/(hmat(3,1)*1+hmat(3,2)*1+hmat(3,3)));
X(1)=floor((hmat(2,1)*1+hmat(2,2)*1+hmat(2,3))/(hmat(3,1)*1+hmat(3,2)*1+hmat(3,3)));
Y(3)=floor((hmat(1,1)*w+hmat(1,2)*h+hmat(1,3))/(hmat(3,1)*w+hmat(3,2)*h+hmat(3,3)));
Y(3)=floor((hmat(2,1)*w+hmat(2,2)*h+hmat(2,3))/(hmat(3,1)*w+hmat(3,2)*h+hmat(3,3)));
Y(2)=floor((hmat(1,1)*w+hmat(1,2)*1+hmat(1,3))/(hmat(3,1)*w+hmat(3,2)*1+hmat(3,3)));
Y(2)=floor((hmat(2,1)*w+hmat(2,2)*1+hmat(2,3))/(hmat(3,1)*w+hmat(3,2)*1+hmat(3,3)));
Y(4)=floor((hmat(1,1)*1+hmat(1,2)*h+hmat(1,3))/(hmat(3,1)*1+hmat(3,2)*h+hmat(3,3)));
X(4)=floor((hmat(2,1)*1+hmat(2,2)*h+hmat(2,3))/(hmat(3,1)*1+hmat(3,2)*h+hmat(3,3)));

B=zeros(4,2);

for k=1:4
    B(k,1)=X(k);
    B(k,2)=Y(k);
end

%dimension nouvelle image 
%h=max(y)-min(y);
%w=max(x)-min(x);

B2=zeros(2,2);
B2(1,1)=min(X);
B2(2,1)=max(Y);
B2(1,2)=max(X);
B2(2,2)=min(Y);
end