%SAKER SOM MÅSTE GÖRAS!!!!:

%ta bort habitat
%göra så att jelly och sea rör sig 
%Göra den stora matrisen med färger och sånt 


%% här testar vi 
clc
clear all
N =5;
v1=zeros(1,(N+2)); % a vector with zeros and size 1x(N+2)
v2=zeros(N,1); % e columnvector with N rows and one column 

A = 4*ones(5);
%Seaturtle =1
%Jellyfish=2
%Plastic=3
%Habitat = 4 
A(2,3) = 1;
A(4,3) = 1;
A(1,4) = 1;
A(5,3) = 3;
A(1,3) = 3;
A(5,5) = 2;
A(5,2) = 1;
A(4,4) = 2;
A(3,2) = 1;
A(3,1) = 2;
A(4,5) = 3;
A=[v1;v2 A v2;v1] % the matrix with a frame of zeros
n=5;
m=5;
Any = A;
A1 = A
for i=2:n
    for j=2:m
       
        if A(i,j)== 1 % & A(i,j)=1 is in habitat region
            for a=-1:1:1 %check the position around the seaturtule
                for b=-1:1:1
                    n1=a+i;
                    m1=b+j;
                   
                    if A1(n1,m1)== 3  %If there is plastic next to the seaturtle it will die and be replaced by habitat (4)
                        Any(i,j)= 4 %the seaturtle it will die and be replaced by habitat
                        Any(n1,m1)= 4 %the plastic will be replaced by habitat in the new matrix
                        A1(n1,m1)= 4 %the plastic will be replaced by habitat in the original matrix
                       
                    end
                    
                end
            end
            
            if  A(i,j+1)~= 3 & A(i,j-1)~=3 & A(i+1,j)~=3 & A(i-1,j)~=3 & A(i-1,j-1)~=3 & A(i-1,j+1)~=3 & A(i+1,j+1)~=3 & A(i+1,j-1)~=3  
                for a=-1:1:1
                    for b=-1:1:1
                        n1=a+i;
                        m1=b+j;
                        if A(n1,m1)== 2 %if there is a jelly fish in this positition it will be repleced by a seaturtle
                            Any(n1,m1) = 1
                        end
                    end
                    
                end
           
            end
        
        end
        
    end
end
 
for i=2:n
    for j=2:m
        if Any(i,j)== 2 %check where there are jellyfish
            for a=-1:1:1 %check the position around the jellyfish
                for b=-1:1:1
                    n1=a+i;
                    m1=b+j;
                    
                    if Any(n1,m1)== 3  %If there is plastic next to the jelly it will die and be replaced by habitat (4)
                        Any(i,j)= 4 %the jelly it will die and be replaced by habitat
                        Any(n1,m1)= 4 %the plastic will be replaced by habitat in the new matrix
                        
                        
                    end
                    
                end
            end
        end
    end
end


%%
%test på hur vi lägger till ex plast och jelly

N =5;
v1=zeros(1,(N+2)); % a vector with zeros and size 1x(N+2)
v2=zeros(N,1); % e columnvector with N rows and one column 

A = 4*ones(5);
%Seaturtle =1
%Jellyfish=2
%Plastic=3
%Habitat = 4 
A(2,3) = 1;
A(4,3) = 1;
A(1,4) = 1;
A(5,3) = 3;
A(1,3) = 3;
A(5,5) = 2;
A(5,2) = 1;
A(4,4) = 2;
A(3,2) = 1;
A(3,1) = 2;
A=[v1;v2 A v2;v1]; % the matrix with a frame of zeros


[row,col] = find(A==4); % find out the positions of 2 in matrix a
x = [row col];% save all the positions in a matrix, where the first column refers to the rows and second column refers to the columns of the positions of 2 in matrix a
q=randsample(1:length(x),????);% randomly extract ???? (can be any number) positions from x. This is done by randomly choosing one row fro the x matrix
subst=[];

for i=q
     subst =[subst; x(i,:)];
end

A(sub2ind(size(A),subst(:,1),subst(:,2))) = 2; %Substituera habitat till jelly

[row,col] = find(A==4); % find out the positions of 2 in matrix a
x = [row col];% save all the positions in a matrix, where the first column refers to the rows and second column refers to the columns of the positions of 2 in matrix a
q=randsample(1:length(x),????);% randomly extract ???? (can be any number) positions from x. This is done by randomly choosing one row fro the x matrix
subst=[];

for i=q
     subst =[subst; x(i,:)];
end

A(sub2ind(size(A),subst(:,1),subst(:,2))) = 3; %Substituera habitat till plast



