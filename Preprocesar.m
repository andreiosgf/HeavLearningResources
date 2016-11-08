function [ Mmod ] = Preprocesar( DS )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[filas columnas]=size(DS);

Clases=DS(:,columnas);
DSt=DS(:,1:columnas-1);

for i=1:filas
    menor=min(DSt(i,:));
    
    
    if menor<0
        for j=1:columnas-1
            
            DSt(i,j)=DSt(i,j)-menor;
        end
    end

end

%dlmwrite('Restados.txt',DSt);

maxd=MaxDD(DSt)

if maxd>10
    maxd=4;
end

DSt=DSt*10^maxd;

Mmod=horzcat(DSt,Clases);


end

