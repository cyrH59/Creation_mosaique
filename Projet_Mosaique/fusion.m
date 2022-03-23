function [img,M,B]=fusion(img1,M1,B1,img2,M2,B2)
[h1,w1,z1]=size(img1);
[h2,w2,z2]=size(img2);
if (z1~=z2)
    disp('erreur, les deux images ne sont pas de même tailles en z')
end

B(1,1)=1;
B(1,2)=max(B1(1,2),B2(1,2))-min(B1(1,1),B2(1,1))+1;
B(2,1)=max(B1(2,1),B2(2,1))-min(B1(2,2),B2(2,2))+1;
B(2,2)=1;

%%Gestion du décalage sur x
val1=B1(2,2);
val2=B2(2,2);

[mini]=min(val1,val2);
if mini==val1
    i=1;
    mini=val2-val1;
else
    i=2;
    mini=val1-val2;
end
if (mini >0)
    if (i==1)
        tnimg1=img1;
        tnM1=M1;
        A=zeros(size(img2,1),mini,z2);
        
        tnimg2=[A img2];
        tnM2=[zeros(size(M2,1),mini), M2];
    else
        tnimg2=img2;
        tnM2=M2;
        
        tnimg1=[zeros(size(img1,1),mini,z1), img1];
        tnM1=[zeros(size(M1,1),mini), M1];
    end
else
    tnM1=M1;
    tnimg1=img1;
    tnimg2=img2;
    tnM2=M2;
end


%%Gestion du décalage sur y

val1=B1(1,1);
val2=B2(1,1);

[mini]=min(val1,val2);
if mini==val1
    i=1;
    mini=val2-val1;
    else
    i=2;
    mini=val1-val2;
end

if (mini >0)
    if (i==1)
        nimg1=tnimg1;
        nM1=tnM1;
        nimg2=[zeros(mini,size(tnimg2,2),z2); tnimg2];
        nM2=[zeros(mini,size(tnM2,2)); tnM2];
    else
        nimg2=tnimg2;
        nM2=tnM2;

        

        nimg1=[zeros(mini,size(tnimg1,2),z1); tnimg1];
        nM1=[zeros(mini,size(tnM1,2)); tnM1];
    end
else
    nM1=tnM1;
    nimg1=tnimg1;
    nimg2=tnimg2;
    nM2=tnM2;
end

disp('sizes')
disp(size(nimg2))
disp(size(nimg1))

[nimg1,nimg2,nM1,nM2]=complete(nimg1,nimg2,nM1,nM2);

figure,
subplot(2,2,1)
imshow(nimg1)
subplot(2,2,2)
imshow(uint8(nimg2))
title('img2')
subplot(2,2,3)
imshow(nM1)
subplot(2,2,4)
imshow(nM2)

%%Fusion
img=zeros(B(2,1),B(1,2),z1);
M=zeros(B(2,1),B(1,2));

disp('sizes')
disp(size(nimg2))
disp(size(nimg1))

for x=1:B(2,1)
    for y=1:B(1,2)
        if (nM2(y,x)==1)
            img(y,x,:)=nimg2(y,x,:);
            M(y,x)=1;
        elseif (nM1(y,x)==1)
            img(y,x,:)=nimg1(y,x,:);
            M(y,x)=1;
        else
            M(y,x)=0;
        end
    end
end

end
        