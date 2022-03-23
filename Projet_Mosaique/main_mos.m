clc;
clear;
close all;

img1=imread('Img/i3.jpg');
%img1=imread('Img/coronair.tif')
img2=imread('Img/i4.jpg');
figure,
imshow(img2)
[X1,Y1]=ginput(4);

imshow(img1)
[X2,Y2]=ginput(4);

[I3,M3,B3]=creation_mosaique(img1,img2,X1,Y1,X2,Y2);

figure;
imshow(uint8(I3));