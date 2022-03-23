function[imgtransforme, mask]=application_homographie2(img2,hmat,img1)
hmat=inv(hmat);
[h,w,z ]=size(img1);
[h2,w2,z2]=size(img2);
imgtransforme=img1;
mask=zeros(h,w);

for i=1:h
    for j=1:w
        y=floor((hmat(1,1)*j+hmat(1,2)*i+hmat(1,3))/(hmat(3,1)*j+hmat(3,2)*i+hmat(3,3)));
        x=floor((hmat(2,1)*j+hmat(2,2)*i+hmat(2,3))/(hmat(3,1)*j+hmat(3,2)*i+hmat(3,3)));
        if (x>0 && x<h2+1 && y>0 && y<w2+1)
            imgtransforme(i,j,:)=img2(x,y,:);
            mask(i,j)=1;
        end
    end
end

