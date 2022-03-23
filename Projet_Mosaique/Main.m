clc;
clear;
close all;
beep off;

img1=imread('Img/immeuble.png');
%img1=imread('Img/coronair.tif')
img2=imread('Img/publicite1.jpg');

Y1=[1       1      size(img2,1) size(img2,1)];
X1=[1 size(img2,2) size(img2,2)     1       ];
figure,
imshow(img1)
[X2,Y2]=ginput(4);



[h]=find_homographie_man(X1,Y1,X2,Y2);
[imgtransforme,mask]=application_homographie2(img2,h,img1);

% nouvelle image homographie 
figure;
imshow(uint8(imgtransforme));title("Projection d'une image sur une autre");
figure;
imagesc(mask);
<<<<<<< HEAD
title("Projection d'une image sur une autre ");

=======
title("projection");
%{
>>>>>>> 0cb478af5bc34de2dec17d4be25a556bb5b7eb2f
% extraction image : 
Y1=[1       1      255 255];
X1=[1 255 255     1];
img=zeros(255,255,3);
figure,
imshow(img1)
[X2,Y2]=ginput(4);
[hbis]=find_homographie_man(X2,Y2,X1,Y1);
[imgtransformebis,maskbis]=application_homographie2(img1,hbis,img);

figure;
imshow(uint8(imgtransformebis));
title("Extraction d'une partie de l'image");
figure;
imagesc(maskbis);
title("extraction");

% creation mosaique : 
% exemple pour trois image : 
% imageref=img1 : 

img1=zeros(256,256,3);
img2=zeros(256,256,3);
img3=zeros(256,256,3);

% tableau contenant toutes les images
tabimg={img1, img2, img3};
% création du triplet pour l'image de reférence
[I, M, B]=creation_triplet(img1);

% on créer une matrice contenant les coordonnées de chaque points
nombreimage=3;
% on va stocker l'ensemble des coordonnées selon x en sortie de chaque
% gitput
coordonnesx=zeros(4,nombreimage);
% on va stocker l'ensemble des coordonnées selon y en sortie de chaque
% gitput
coordonnesy=zeros(4,nombreimage);
coordonnesx(:,1)=[1 1 size(img,1) size(img,1)]';
coordonnesy(:,1)=[1 size(img,2) size(img,2) 1 ]';
% on stockera l'ensemble des matrices d'homographie qui nous permet de se
% ramener à l'image de reférence
matriceh=zeros(3,3,nombreimage);

for h=2:nombreimage
    figure,
    imshow(tabimg{h})
    title("image n°"+h);
    [X2,Y2]=ginput(4);
    % on stocke l'ensemble des coordonnées en x dans notre matrice créee
    % precedemment
    coordonnesx(:,h)=X2';
     % on stocke l'ensemble des coordonnées en y dans notre matrice créee
    % precedemment
    coordonnesy(:,h)=Y2';
   
end


% dans la matrice h on va stocker l'ensemble des matrices h entre l'image
% courant et l'image de base. Par exemple sur l'indice 3, la matrice h sera
% celle du produit entre la matrice entre 1 et 2 et la matrice h entre 2 et
% 3 

% for k=2:nombreimage
    for i=2:nombreimage
        compteurinit=i-1; % même chose que compteur mais pour conserver la valeur de base.
        compteur=i-1;% nombre d'opérations à effectuer pour se ramener à l'image de ref qui est 1
        tabhtmp=zeros(3,3,compteur); % tableau temporaire contenant les matrices h 
        while(compteur ~=0)
            tabhtmp(:,:,compteur)=find_homographie_man(coordonnesx(:,compteur+1)',coordonnesy(:,compteur+1)',coordonnesx(:,compteur)',coordonnesy(:,compteur)');
            compteur=compteur-1;

        end
        for k=1:compteurinit
            if (sum(matriceh(:,:,i)) ~= 0)
                matriceh(:,:,i)=matriceh(:,:,i)*tabhtmp(:,:,k);
            else
                matriceh(:,:,i)=tabhtmp(:,:,k);
            end

        end
        % on obtient notre h; 

    end

 for p=2:nombreimage
     [Ibis,Mbis,Bbis]=creation_triplet(tabimg{p});% creation triplet image numéro p
     [imgbis Mbis2 Bbis2]=application_homographie(Ibis,Mbis,Bbis,matriceh(:,:,p));  % multiplication par h(p)
     % fusion avec image de base; 
     [I,M,B]=fusion(img1,Mbis,Bbis,imgbis,Mbis2,Bbis2)
 end
    
%end
    
%     figure,
%     imshow(img1)
%     [X2,Y2]=ginput(4);
%     coordonnesx(:,1)=X2';
%     coordonnesy(:,1)=Y2';
%     [I,M,B]=creation_mosaique(img1,img2,X1,Y1,X2,Y2)
%end


% faire l'homographie de l'image, calculer l'homographie des 4 points
% extrêmes, regarder min et max de chaque extremités pour avoir la taille
% de la nouvelle image 
% attention les coordonnées sont négatives

% fonction 1 : estimation homographie + projection + extraction
% fonction 2 : triplet I,M,B (hauteur largueur)
% fonction 3 : Application homographie à un triplet
% fonction 4 : fusion, diviser I3 par le masque, sommer I1 et I2 

% Il faut calculer les matrices d'homographies entre chaque image, il faut
% choisir un univers d'arrivée ensuite. 
% il faut ramener l'univers de la photo 2 vers la photo 1 si on suppose que
% l'univers de départ est 1
% On fait donc H12-1 pour ramener 2 vers 1
% Pour ramener 3 vers 1 on fait (H23H12)-1. On applique fonction 4. On fait
% une cascade d'appel. 
%}

