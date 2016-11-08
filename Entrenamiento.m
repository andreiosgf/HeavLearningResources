function [ M ] = Entrenamiento( A ,base)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

[filasA columnasA]=size(A);


L=@(X,Y) (X-Y+base-1);
M=bsxfun(L,A(1,:)',A(1,:));%Valores iniciales en M


for i=2:filasA
  temp=bsxfun(L,A(i,:)',A(i,:));
  M=min(M,temp);%Actualizar M, Heaviside HI
end

end

function [y]=H(x)
y=0;

    if(x>0)
        y=1;
    end
end
