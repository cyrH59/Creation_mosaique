function [mosa]=create_mos(img1,img2,h)
    hinv=eye(3)/h;
    [l1,w1,n]=size(img1);
    [l2,w2,n]=size(img2);
    img1=[  zeros(size(img2)) zeros(l2,w1)  zeros(size(img2));
            zeros(l1,w2)      img1          zeros(l1,w2);
            zeros(size(img2)) zeros(l2,w1)  zeros(size(img2))];
        
    [le,w,n]=size(img1);
    mos=zeros(size(img1));
    
    for i=1:le
        for j=1:w
            k=round((h(1,1)*i+h(2,1)*j+h(3,1))/(h(1,3)*i+h(2,3)*j+h(3,3)));
            l=round((h(1,2)*i+h(2,2)*j+h(3,2))/(h(1,3)*i+h(2,3)*j+h(3,3)));
            if(0<k && 0<l && k<l2 && l<w2)
                if (w2<j && j<w1+w2 && l2<i && i<l2+l1)
                    mos(i,j,:)=(img1(i,j,:)+img2(k,l,:))/2;
                    disp('moyenne')
                else
                    mos(i,j,:)=img2(k,l,:);
                    disp('ajout')
                end
            else
                mos(i,j,:)=img1(i,j,:);
                %disp('dehors')
            end
        end
    end
    %%Avant de finir, on rogne les bords pour ne pas avoir une image trop
    figure,
    imshow(mos)
    %%grande
    for left=1:le
        if (sum(sum(mos(left,:,:)))~=0)
            break;
        end  
    end
    right=1;
    for i=le:-1:1
        if (sum(sum(mos(i,:,:)))~=0)
            break;
        end
        right=right+1;
    end
 
    for up=1:w
        if (sum(sum(mos(:,up+1,:)))~=0)
            break;
        end
    end
    down=1;
    for i=le:-1:1
        if (sum(sum(mos(:,i,:)))~=0)
            break;
        end
        down=down+1;
    end
    mosa=mos(left:right,up:down,:);
    
end