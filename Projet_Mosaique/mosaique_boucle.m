clc;
clear;
close all;
disp("écrire 0 pour finire le programme")
var=input("Nom de l'image:");
im=['Img/' var];
img1=imread(im);
%img1=imread('Img/coronair.tif')
while(1)
    var=input("Nom de l'image:");
    if (var==0)
        break;
    end
    im=['Img/' var];
    img2=imread('Img/publicite1.jpg');

    imshow(img2)
    [X1,Y1]=ginput(4);

    imshow(img1)
    [X2,Y2]=ginput(4);

    [I3,M3,B3]=creation_mosaique(img1,img2,X1,Y1,X2,Y2);

    imshow(uint8(I3));
    img1=I3;
end