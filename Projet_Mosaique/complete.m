function [nimg1,nimg2,nM1,nM2]=complete(img1,img2,M1,M2)
[h1,w1,z1]=size(img1);
[h2,w2,z2]=size(img2);

if h1<h2
    rimg1=[img1; zeros(h2-h1,w1,z1)];
    rimg2=img2;
    rM1=[M1; zeros(h2-h1,w1)];
    rM2=M2;
elseif h2<h1
    rimg2=[img2; zeros(h1-h2,w2,z2)];
    rimg1=img1;
    rM2=[M2; zeros(h1-h2,w2)];
    rM1=M1;
else
    rimg1=img1;
    rimg2=img2;
    rM1=M1;
    rM2=M2;
end


if w1<w2
    nimg1=[rimg1,zeros(max(h1,h2),w2-w1,z1)];
    nimg2=rimg2;
    nM1=[rM1,zeros(max(h1,h2),w2-w1)];
    nM2=rM2;
elseif w2<w1
    nimg2=[rimg2,zeros(max(h1,h2),w1-w2,z2)];
    nimg1=rimg1;
    nM2=[rM2,zeros(max(h1,h2),w1-w2)];
    nM1=rM1;
else
    nimg1=rimg1;
    nimg2=rimg2;
    nM1=rM1;
    nM2=rM2;
end
