function [imgf,nM,Bf]=hom_triplet(img,M,B,hmat)
    Bf=calcul_fenetre(hmat,B);
    disp(Bf);
    disp(Bf(1,2));
    [imgf,nM]=application_homographie(img,M,Bf,hmat);

end