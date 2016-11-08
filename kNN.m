function [ performance, aciertos] = kNN( E,P,k,nc )%numero de clases ultimo
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%E
%P
tam_pr=size(P);
tam_en=size(E);
aciertos=0;
% claseO=0;
% claseA=0;
for i=1:tam_pr(1) %conjunto de prueba
    
    for j=1:tam_en(1)
        
       
    distancias(j,1)=norm(P(i,1:tam_pr(2)-1)-E(j,1:tam_en(2)-1));
    distancias(j,2)=E(j,tam_en(2));
    end
    
    %[mindis posmin]=min(distancias(:,1));%Cambiar esta linea por la regla de los k
    %clase=E(posmin,tam_en(2));%Votar clase
    [clase,numvotos]=VotarClase(distancias,k,nc);
    if clase==P(i,tam_pr(2))
        aciertos=aciertos+1;
%         claseO=P(i,tam_pr(2));
%         claseA=clase;

%     else
%         fprintf('Error en patron %d clasificado como %d clase real %d \n',i,clase,P(i,tam_pr(2)));

%         claseO=P(i,tam_pr(2));
%         claseA=clase;
    end
    
end



% fprintf('Total de aciertos iteración %d\n',aciertos);
 performance=aciertos/tam_pr(1);
% fprintf('Performance %d\n',performance);

end

function [clase,numvotos]=VotarClase(Distancias,k,nc)
Distancias=sortrows(Distancias,1);

Clasesk=Distancias(1:k,2);

%fprintf('Distancias \n');
%Distancias(1:k,:)
% tam_disun=size(unique(Distancias(1:k,1)));
% 
% fprintf('Distancias unicas %d y k= %d\n',tam_disun(1),k);
% 
% if tam_disun(1)==k
%     fprintf('Distancias diferentes\n');
% else
%     fprintf('Distancias repetidas\n');
%     Distancias(1:k,:)
% end



votos=zeros(1,nc);

for i=1:k
    votos(Clasesk(i))=votos(Clasesk(i))+1;
end


[numvotos, clase]=max(votos);

end

