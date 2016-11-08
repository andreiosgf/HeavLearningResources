function [ transformed ] = NormDMax(X)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
Clases=X(:,end);


[filas,columnas]=size(X(:,1:end-1));

transformed=[];

    for i=1:filas
        temp=X(i,1:columnas);
        maximo=max(max(X));
        
        temp=temp/maximo;
      
        transformed=vertcat(transformed,temp);
    end

    transformed=horzcat(transformed,Clases);
    
    nombre=input('Indique el nombre del archivo\n','s');
    dlmwrite(nombre,transformed,'\t');

end

