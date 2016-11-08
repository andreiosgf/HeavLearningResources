function [Clase]=desordena(Clase,tc)
posiciones=round(rand(1,tc)*(tc-1))+1;


for i=1:tc
    aux=Clase(i,:);
    Clase(i,:)=Clase(posiciones(i),:);
    Clase(posiciones(i),:)=aux;
end



end
