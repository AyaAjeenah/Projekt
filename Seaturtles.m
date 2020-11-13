clear all
clc
%%
% vi har fem olika siffror en för habitat, sköldpadda, plast,jellyfish och en
% habitat försvinner som en zon typ en bit av en kolumn
% for loop för varje position (ji) runt sjöldpaddan för att kolla om det finns
%nåt runt den 

%Interaktions regler

%- När en skölpadda har en ruta jellyfish runt sig så får man en ny sköldpadda där vi hade 
%en jellyfish-ruta
%- När en sköldpadda har en plast bredvid sig så försninner den och den blir till en habitat ruta 
%- När en jellyfish har en plast bredvid sig så försninner den och den blir till en habitat ruta 
%- Antigen så kommer det upp ett antal jellyfish varje iteration som är proportionerligt mot 
%antalet som redan finns(eller så får vi en ny jellyfish ruta 
%- The plastic squares pop up randomly over time and disappear at a constant rate each iteration.  

%Moving rules 

% sköldpaddorna rör sig mot jellyfish vi har so en radar som är ett område
% där jellyfifsh måste vara inom för att sköldpaddorna ska röra sig emot dem
% jellyfish rör sig random

newposition = position + moving_value
if newposition > last_position
    do something if you have passed the end
else
    position = newposition
end
if position == last_position
    do something when you reach the end
end


%Seaturtle =1
%Jellyfish=2
%Plastic=3
%Habitat ?
%Habitat loss = 0

% A är den matrisen som representerar sea och B är den döda zonen
% vi tänker att A försvinner lite i tagen gemom att en del av kolumnen (typ
% 4 rutor) går bort 
for k = 1:antal_kolumner 
    for 
    A =(
    
        
 for i=1:n
    for j=1:m
        %habitat loss sats
        if A(n,m)==1 %|| A(n,m) is in habitat region
            for i=-1:1:1
                for j=-1:1:1
                    n1=n+i
                    m1=m+j
                    if A((n1),(m1))==3  %If there is plastic next to the seaturtle it will die and be replaced by habitat
                        A(n1,m1)=0
                        
                    elseif  A((n1),(m1))== 2 %if there is a jelly fish in this positition it will be repleced by a seaturtle
                        A(n1,m1)=1
                    end
                    
                end
            end
        end
    end
    
end


%%Game of life 

N= 16 %storlek av vår matris 
A=round(rand(N,N)); % en random matris med ettor och nollor i storleken NxN
v1=6.*ones(1,(N+2)); % en vektor med bara nollar med storleken 1x(N+2)
v2=6.*ones(N,1); % en kolumnvektor med N raden och en kolumn 
A=[v1;v2 A v2;v1] % den nya matrisen med en ram av nollor

A=zeros(N)
A(5:9,5)=1
A(11,5:9)=1
A(7:11,11)=1
A(5,7:11)=1
Any=zeros(size(A)) 
t=0
while sum(sum(A~=Any))>0
    if t>0
        A=Any
    end
    Any=zeros(size(A))    
    for n = 2:(N-1)
        for m = 2:(N-1)
            B = celldestiny(A,n,m)
        
            Any(n,m)=B
            
        end 
    end 
    clf
    plotroutine(Any)
    t=t+1
    pause(0.25)
    

end


%% såhär får vi olika färger 

imagesc(Any)
colormap summer
colorbar
axis off

