function [h_fin]=find_homographie_man(X1,Y1,X2,Y2)

    A=zeros(8,8);
    B=zeros(8,1);
    for i=0:3
        A(2*i+1,:)=[X1(i+1) Y1(i+1) 1 0 0 0 -X1(i+1)*X2(i+1) -Y1(i+1)*X2(i+1)];
        A(2*i+2,:)= [0 0 0 X1(i+1) Y1(i+1) 1 -X1(i+1)*Y2(i+1) -Y1(i+1)*Y2(i+1)];
        B(2*i+1)=X2(i+1);
        B(2*i+2)=Y2(i+1);
    end
        
  
    h=(eye(8)/(transpose(A)*A))*transpose(A)*B;
    h_fin=ones(3);
    h_fin(1,:)=h(1:3);
    h_fin(2,:)=h(4:6);
    h_fin(3,1:2)=h(7:8);

  

end

    


