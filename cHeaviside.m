function [ aciertos, performance,acrec,perec ] = cHeaviside( A,P,base,k,nc )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
xmax=max(max(A));

if base==0||base==1
    base=xmax+1;
end

vecsize=getVecSize(xmax,base);

[filasA, columnasA]=size(A);
[filasP, columnasP]=size(P);
clasesA=A(:,columnasA);
clasesP=P(:,columnasP);

Asc=A(:,1:columnasA-1);
Psc=P(:,1:columnasP-1);

Atsc=transformM2B(Asc,base,vecsize);
Ptsc=transformM2B(Psc,base,vecsize);

At=horzcat(Atsc,clasesA);
Pt=horzcat(Ptsc,clasesP);

M=Entrenamiento(Atsc,base);


[aciertos, performance,acrec,perec]=Clasificacion(M,At,Pt,base,k,nc);
end

function [transformed]=transformM2B(AP,base,vecsize)
[filas, columnas]=size(AP);
fila=[];
transformed=[];


    for i=1:filas
        fila=[];
        for j=1:columnas
           temp=decimal2b(AP(i,j),base,vecsize);
           fila=horzcat(fila,temp);
        end
        transformed=vertcat(transformed,fila);

    end

end

function [vecsize]=getVecSize(x,base)
b=0;
vecsize=0;
    while x>0
        b=mod(x,base);
        x=floor(x/base);
       vecsize=vecsize+1;

    end

end