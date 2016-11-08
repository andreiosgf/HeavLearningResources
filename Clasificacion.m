function [ aciertos, performance,acrec,perec] = Clasificacion( M,E,P,base,k,nc)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[filasM columnasM]=size(M);
[filasP columnasP]=size(P);
aciertos=0;
performance=0;

acrec=0;
perec=0;



for i=1:filasP
    R=recuperarP(M,P(i,1:columnasP-1),base);
    
        distancia=norm(R-P(i,1:columnasP-1));
        if distancia==0.0
           acrec=acrec+1; 
%         else
%             fprintf('Patrón %d mal recuperado\n',i);
%             fprintf('Distancia \n')
%             distancia
%             fprintf('Patrón original\n');
%              P(i,1:columnasP-1)
%              fprintf('Patrón recuperado\n');
%              R
        end
    
    R=horzcat(R,P(i,columnasP));
    

    [ac, perf]=kNN(E,R,k,nc);
    aciertos=aciertos+ac;
end

performance=aciertos/filasP;
perec=acrec/filasP;
end

function [R]=recuperarP(M,Patron,base)

[filasM columnasM]=size(M);
R=zeros(1,filasM);
%C=@(M,P) H(M+2-(base-P))*H(2*base-1-(M+P))*(M+P-base+1);


    for i=1:filasM
       
        R(i)=ProdC(M(i,:),Patron,base);
    end
    
end

function [Ri]=ProdC(filaM,patron,base)
dimFila=size(filaM);
resultados=zeros(1,dimFila(2));
    for i=1:dimFila(2)
        resultados(i)=C(filaM(i),patron(i),base);
    end
   Ri=max(resultados);

end

function [y]=C(Mij,Pj,base)
y=H(Mij+2-(base-Pj))*H(2*base-1-(Mij+Pj))*(Mij+Pj-base+1);
end

function [y]=H(x)
y=0;

    if(x>0)
        y=1;
    end
end
