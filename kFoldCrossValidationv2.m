function [ kfcv,kfcvr ] = kFoldCrossValidationv2(X,nclases,base,k)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

valor_k=10; 

sizeC=zeros(nclases,1);

aciertos_totales=0;
aciertos_totalesR=0;
performance=0;
performanceR=0;

X=desordenav2(X);


    for i=1:nclases
        clase=X(X(:,end)==i,:);
        [filas,~]=size(clase);
        sizeC(i)=filas;
    end

    tamFold=round(sizeC/valor_k)
    inicioFold=ones(nclases,1);
    
    for i=1:valor_k
        fprintf('Fold %d\n',i);
        entrenamiento=[];
        prueba=[];
        
        if i==valor_k
            for j=1:nclases
                clase=X(X(:,end)==j,:);
                entrenamiento=vertcat(entrenamiento,clase(1:inicioFold(j)-1,:));
                prueba=vertcat(prueba,clase(inicioFold(j):sizeC(j),:));
                
                
            end
        else
            
            for j=1:nclases
                clase=X(X(:,end)==j,:);
                entrenamiento=vertcat(entrenamiento,clase(1:inicioFold(j)-1,:));
                entrenamiento=vertcat(entrenamiento,clase(inicioFold(j)+tamFold(j):sizeC(j),:));
                
                prueba=vertcat(prueba,clase(inicioFold(j):inicioFold(j)+tamFold(j)-1,:));              
               
            end
                       
            
            
            for l=1:nclases 
                inicioFold(l)=inicioFold(l)+tamFold(l);
            end
            
        end
      
        [ac,perf,ar,pr]=cHeaviside(entrenamiento,prueba,base,k,nclases);
        aciertos_totales=aciertos_totales+ac;%ac clasif
        aciertos_totalesR=aciertos_totalesR+ar;%ac rec
        %fprintf('Aciertos fold %d = %d\n',i,aciertos);
        performance=performance+perf;%ac rec
        performanceR=performanceR+pr;%perf recuperacion
        
    end
    

    kfcv=performance/valor_k;
    kfcvr=performanceR/valor_k;
    fprintf('Total de aciertos en clasificación kFoldCross %d\n',aciertos_totales);
    fprintf('Total de aciertos en recuperación kFoldCross %d\n',aciertos_totalesR);


 
end

