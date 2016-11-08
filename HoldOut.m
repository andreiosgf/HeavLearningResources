function [ performance,performancerec ] = HoldOut( X,nclases,base,k)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

porcentaje=0.7;
entrenamiento=[];
prueba=[];
for i=1:nclases
    clase=X(X(:,end)==i,:);
    [filasX,~]=size(clase);
    size_ent=round(filasX*porcentaje);
    entrenamiento=vertcat(entrenamiento,clase(1:size_ent,:));
    prueba=vertcat(prueba,clase(size_ent+1:filasX,:));
end
nclases 
[ac,performance,ar,performancerec]=cHeaviside(entrenamiento,prueba,base,k,nclases);
fprintf('Aciertos en HoldOut %d y en recuperación %d\n',ac,ar);

% tamanio
% [filasE,~]=size(entrenamiento)
% [filasP,~]=size(prueba)



end

