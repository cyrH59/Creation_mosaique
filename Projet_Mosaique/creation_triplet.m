function [img,mask,B]=creation_triplet(img)
si=size(img);
mask=ones(si(1:2));
B=[1 ,si(1); si(2), 1];
end