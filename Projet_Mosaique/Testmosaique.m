clc;
clear;
close all;

img1=imread('Img/immeuble.png');
%img1=imread('Img/coronair.tif')
img2=imread('Img/publicite1.jpg');
figure,
subplot(1,2,1)

imshow(img1)
[X1,Y1]=ginput(4);
subplot(1,2,1)

imshow(img2)
[X2,Y2]=ginput(4);


[h]=find_homographie_man(X1,Y1,X2,Y2);
[nimg1,M1,B1]=creation_triplet(img1);
[nimg2,M2,B2]=creation_triplet(img2);
[img3,M3,B3]=hom_triplet(nimg2,M2,B2,h);
[imgf,Mf,Bf]=fusion(img1,M1,B1,img3,M3,B3);

figure,
subplot(1,2,1)
imshow(imgf);
subplot(1,2,2)
plot(Mf);