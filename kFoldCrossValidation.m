function [ kfcv,kfcvr ] = kFoldCrossValidation( C1,C2,tc1,tc2,nc,base,k )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


CD1=desordena(C1,tc1);
CD2=desordena(C2,tc2);

valor_k=10;

inicio1=1;
inicio2=1;



tam_fold1=round(tc1/valor_k);
tam_fold2=round(tc2/valor_k);


final1=tam_fold1;
final2=tam_fold2;


performance=0.0;
performanceR=0.0;

aciertos_totales=0;
aciertos_totalesR=0;

for i=1:valor_k
%     fprintf('Fold %d\n',i);
    aciertos=0;
    if i==valor_k
        %Construir el conjunto de prueba
        prueba=CD1(inicio1:tc1,:);
        prueba=vertcat(prueba,CD2(inicio2:tc2,:));
        
        
        %Construir el conjunto fundamental
        entrenamiento=CD1(1:inicio1-1,:);
        entrenamiento=vertcat(entrenamiento,CD2(1:inicio2-1,:));
        
            
    else
        %Construir el conjunto de prueba
        prueba=CD1(inicio1:final1,:);
        prueba=vertcat(prueba,CD2(inicio2:final2,:));
        
        
        %Construir el conjunto fundamental
        entrenamiento=CD1(1:inicio1-1,:);
        entrenamiento=vertcat(entrenamiento,CD1(final1+1:tc1,:));
        entrenamiento=vertcat(entrenamiento,CD2(1:inicio2-1,:));
        entrenamiento=vertcat(entrenamiento,CD2(final2+1:tc2,:));
      
        
    end
    
     [ac,perf,ar,pr]=cHeaviside(entrenamiento,prueba,base,k,nc);
    
    aciertos_totales=aciertos_totales+ac;%ac clasif
    aciertos_totalesR=aciertos_totalesR+ar;%ac rec
    %fprintf('Aciertos fold %d = %d\n',i,aciertos);
    performance=performance+perf;%ac rec
    performanceR=performanceR+pr;%perf recuperacion
    
    inicio1=inicio1+tam_fold1;
    inicio2=inicio2+tam_fold2;
   
    
    final1=final1+tam_fold1;
    final2=final2+tam_fold2;
    

end

kfcv=performance/valor_k;
kfcvr=performanceR/valor_k;
fprintf('Total de aciertos en clasificación kFoldCross %d\n',aciertos_totales);
fprintf('Total de aciertos en recuperación kFoldCross %d\n',aciertos_totalesR);
%fprintf('El performance del kFold es %d\n',kfcv);

end

