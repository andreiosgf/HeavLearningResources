function [ nclases,filas,sizeclases] = getInfo( X )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
[filas, ~]=size(X);
nc=size(unique(X(:,end)));
nclases=nc(1);
sizeclases=zeros(nclases,1);

    for i=1:nclases
        clase=X(X(:,end)==i,:);
        [filasc,~]=size(clase);
        sizeclases(i)=filasc;
    end

end

