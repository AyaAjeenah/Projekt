%saker som måste göras:

%göra så att jelly och sea rör sig/ göra reflekterande ram

%% här testar vi 
clc
clear all

N =50;
v1=zeros(1,(N+2)); % a vector with zeros and size 1x(N+2)
v2=zeros(N,1); % e columnvector with N rows and one column 

A = 4*ones(N);
%Seaturtle =1
%Jellyfish=2
%Plastic=3
%Habitat = 4 

[row,col] = find(A==4); % find out the positions of 3 in matrix A
x = [row col];% save all the positions in a matrix, where the first column refers to the rows and second column refers to the columns of the positions of 2 in matrix a
q=randsample(1:length(x),6);% randomly extract ???? (can be any number) positions from x. This is done by randomly choosing one row fro the x matrix
subst=[];

for i=q
     subst =[subst; x(i,:)];
end

A(sub2ind(size(A),subst(:,1),subst(:,2))) = 1; %Substituera habitat till seaturtle

[row,col] = find(A==4); % find out the positions of 3 in matrix A
x = [row col];% save all the positions in a matrix, where the first column refers to the rows and second column refers to the columns of the positions of 2 in matrix a
q=randsample(1:length(x),4);% randomly extract ???? (can be any number) positions from x. This is done by randomly choosing one row fro the x matrix
subst=[];

for i=q
     subst =[subst; x(i,:)];
end

A(sub2ind(size(A),subst(:,1),subst(:,2))) = 3; %Substituera habitat till plast

[row,col] = find(A==4); % find out the positions of 3 in matrix A
x = [row col];% save all the positions in a matrix, where the first column refers to the rows and second column refers to the columns of the positions of 2 in matrix a
q=randsample(1:length(x),7);% randomly extract ???? (can be any number) positions from x. This is done by randomly choosing one row fro the x matrix
subst=[];

for i=q
     subst =[subst; x(i,:)];
end

A(sub2ind(size(A),subst(:,1),subst(:,2))) = 2; %Substituera habitat till plast
% A(2,3) = 1;
% A(4,3) = 1;
% A(1,4) = 1;
% A(5,3) = 3;
% A(1,3) = 3;
% A(5,5) = 2;
% A(5,2) = 1;
% A(4,4) = 2;
% A(3,2) = 1;
% A(3,1) = 2;
% A(4,5) = 3;
A=[v1;v2 A v2;v1] % the matrix with a frame of zeros
n=50;
m=50;
Any = A;
A1 = A;

r = 3; % detta är hur många rutor som försvinner från varje kolumn

figure (1)
imagesc(A)

yourColorMap = winter(256);
yourColorMap(1, :) = [1,1,1];
colormap (yourColorMap);
colorbar;

% colormap winter
% colorbar
axis off

for z=1:30
A1 = A;

for i=2:n %check (row) where there are seaturtule
    for j=2:m %check (column) where there are seaturtule
     
        if A(i,j)== 1 % & A(i,j)=1 is in habitat region
            for a=-1:1:1 %check the position around the seaturtule
                for b=-1:1:1
                    n1=a+i;
                    m1=b+j;
                    
                    if A1(n1,m1)== 3  %If there is plastic next to the seaturtle it will die and be replaced by habitat (4)
                        Any(i,j)= 4; %the seaturtle it will die and be replaced by habitat
                        Any(n1,m1)= 4; %the plastic will be replaced by habitat in the new matrix
                        A1(n1,m1)= 4; %the plastic will be replaced by habitat in the original matrix
                       
                    end
                    
                end
            end
            % If there is no plastic around the the seaturtule check if there are jellyfish around 
            if  A(i,j+1)~= 3 & A(i,j-1)~=3 & A(i+1,j)~=3 & A(i-1,j)~=3 & A(i-1,j-1)~=3 & A(i-1,j+1)~=3 & A(i+1,j+1)~=3 & A(i+1,j-1)~=3  
                for a=-1:1:1
                    for b=-1:1:1
                        n1=a+i;
                        m1=b+j;
                        if A(n1,m1)== 2 %if there is a jelly fish in this positition it will be repleced by a seaturtle
                            Any(n1,m1) = 1;
                        end
                    end
                    
                end
           
            end
        
        end
        
    end
end
 
for i=2:n %check where there are jellyfish
    for j=2:m
        if Any(i,j)== 2 
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

A=Any;
[row,col] = find(A==4); % find out the positions of 2 in matrix a
x = [row col];% save all the positions in a matrix, where the first column refers to the rows and second column refers to the columns of the positions of 2 in matrix a
q=randsample(1:length(x),2);% randomly extract ???? (can be any number) positions from x. This is done by randomly choosing one row fro the x matrix
subst=[];

for i=q
     subst =[subst; x(i,:)];
end

A(sub2ind(size(A),subst(:,1),subst(:,2))) = 2; %Substituera habitat till jelly

[row,col] = find(A==4); % find out the positions of 2 in matrix a
x = [row col];% save all the positions in a matrix, where the first column refers to the rows and second column refers to the columns of the positions of 2 in matrix a
q=randsample(1:length(x),2);% randomly extract ???? (can be any number) positions from x. This is done by randomly choosing one row fro the x matrix
subst=[];

for i=q
     subst =[subst; x(i,:)];
end

A(sub2ind(size(A),subst(:,1),subst(:,2))) = 3; %Substituera habitat till plast

[row,col] = find(A==3); % find out the positions of 3 in matrix A
x = [row col];% save all the positions in a matrix, where the first column refers to the rows and second column refers to the columns of the positions of 2 in matrix a
q=randsample(1:length(x),1);% randomly extract ???? (can be any number) positions from x. This is done by randomly choosing one row fro the x matrix
subst=[];

for i=q
     subst =[subst; x(i,:)];
end

A(sub2ind(size(A),subst(:,1),subst(:,2))) = 4; %Substituera plast till habitat

O = size(A);
g =[];
for e=2:O-1
    for d=2:O-1     
g = [g ; d e];

    end 
end 

     
y = g(1:r,:);
y1 = y(:,1);
y2= y(:,2);

A(sub2ind(size(A),y1,y2)) = 0;

r = r + 3; %varje gång så går det bort ytterligare 3
 
clf
imagesc(A)
colormap (yourColorMap)
colorbar
axis off

pause(0.5)

end 
    
%% hur de ska röra sig 
% 
% for i=2:n
%     for j=2:n
%     if A(i,j) = 2
%         
%         newposition = position + moving_value
% if newposition > last_position
%     do something if you have passed the end
% else
%     position = newposition
% end
% if position == last_position
%     do something when you reach the end
% end
%         
%     end 
% 
%     end
% 
% end
% 
% 
 %%
%test på hur vi lägger till ex plast och jelly
% 
% N =5;
% v1=zeros(1,(N+2)); % a vector with zeros and size 1x(N+2)
% v2=zeros(N,1); % e columnvector with N rows and one column 
% 
% A = 4*ones(5);
%Seaturtle =1
%Jellyfish=2
%Plastic=3
%Habitat = 4 
% A(2,3) = 1;
% A(4,3) = 1;
% A(1,4) = 1;
% A(5,3) = 3;
% A(1,3) = 3;
% A(5,5) = 2;
% A(5,2) = 1;
% A(4,4) = 2;
% A(3,2) = 1;
% A(3,1) = 2;
% A=[v1;v2 A v2;v1]; % the matrix with a frame of zeros
% 
% [row,col] = find(A==4); % find out the positions of 2 in matrix a
% x = [row col];% save all the positions in a matrix, where the first column refers to the rows and second column refers to the columns of the positions of 2 in matrix a
% q=randsample(1:length(x),%????);% randomly extract ???? (can be any number) positions from x. This is done by randomly choosing one row fro the x matrix
% subst=[];
% 
% for i=q
%      subst =[subst; x(i,:)];
% end
% 
% A(sub2ind(size(A),subst(:,1),subst(:,2))) = 2; %Substituera habitat till jelly
% 
% [row,col] = find(A==4); % find out the positions of 2 in matrix a
% x = [row col];% save all the positions in a matrix, where the first column refers to the rows and second column refers to the columns of the positions of 2 in matrix a
% q=randsample(1:length(x),%????);% randomly extract ???? (can be any number) positions from x. This is done by randomly choosing one row fro the x matrix
% subst=[];
% 
% for i=q
%      subst =[subst; x(i,:)];
% end
% 
% A(sub2ind(size(A),subst(:,1),subst(:,2))) = 3; %Substituera habitat till plast
% 
% [row,col] = find(A==3); % find out the positions of 3 in matrix A
% x = [row col];% save all the positions in a matrix, where the first column refers to the rows and second column refers to the columns of the positions of 2 in matrix a
% q=randsample(1:length(x),%????);% randomly extract ???? (can be any number) positions from x. This is done by randomly choosing one row fro the x matrix
% subst=[];
% 
% for i=q
%      subst =[subst; x(i,:)];
% end
% 
% A(sub2ind(size(A),subst(:,1),subst(:,2))) = 4; %Substituera plast till habitat
% 
% 
%%
% %tar bort habitat
% clc
% clear all
% 
% N =6;
% v1=zeros(1,(N+2)); % a vector with zeros and size 1x(N+2)
% v2=zeros(N,1); % e columnvector with N rows and one column 
% 
% A = 4*ones(6);
%Seaturtle =1
%Jellyfish=2
%Plastic=3
%Habitat = 4 
% A(2,3) = 1;
% A(4,3) = 1;
% A(1,4) = 1;
% A(5,3) = 3;
% A(1,3) = 3;
% A(5,5) = 2;
% A(5,2) = 1;
% A(4,4) = 2;
% A(3,2) = 1;
% A(3,1) = 2;
% A=[v1;v2 A v2;v1]; % the matrix with a frame of zeros
% 
% n = size(A);
% 
% x =[];
% for j=2:n-1
%     for i=2:n-1     
% x = [ x ; i j];
% 
%     end 
% end 
% 
% 
% i = 3; % detta är hur många rutor som försvinner från varje kolumn 
% for s=1:5 % detta är vår stora loop
    
% y = x(1:i,:);
% y1 = y(:,1);
% y2= y(:,2);

% A(sub2ind(size(A),y1,y2)) = 0

% i = i+3;%varje gång så går det bort ytterligare 3
 
% end 
