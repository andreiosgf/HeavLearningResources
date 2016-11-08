function [ Mmod ] = PreprocesarV2( DS )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[filas columnas]=size(DS);

Clases=DS(:,columnas);
DSt=DS(:,1:columnas-1);

menor=min(min(DSt))

if menor<0
    for i=1:filas
            for j=1:columnas-1
              DSt(i,j)=DSt(i,j)-menor;
            end
    end
end


maxd=MaxDD(DSt)

DSt=DSt*10^maxd;

Mmod=horzcat(DSt,Clases);


end

