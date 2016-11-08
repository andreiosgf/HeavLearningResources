function [ performanceLOO ] = LeaveOneOut(DS,base,nc,k)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

tam=size(DS)
aciertos=0;
acrec=0;

% TP=0;
% TN=0;
% FP=0;
% FN=0;

for i=1:tam(1)
    fprintf('Patrón %d\n',i);
    patron=DS(i,:);
    entrenamiento=DS(1:i-1,:);
    entrenamiento=vertcat(entrenamiento,DS(i+1:tam(1),:));
    
    [ac,perf,ar,pr]=cHeaviside(entrenamiento,patron,base,k,nc);
    aciertos=aciertos+ac;
    acrec=acrec+ar;
   
    
    
%     if claseO==claseA
%         
%         if claseO==1
%             TP=TP+1;
%         else
%             TN=TN+1;
%         end
%         
%     else
%         if claseO==1&&claseA==2
%             FN=FN+1;
%         else
%             FP=FP+1;
%         end
%     end
    
end



fprintf('Los aciertos en clasificacion fueron %d\n',aciertos);
fprintf('Los aciertos en rcuperación fueron %d\n',acrec);
fprintf('performance en recuperacion %d\n',acrec/tam(1));
% fprintf('TP %d\n',TP);
% fprintf('TN %d\n',TN);
% fprintf('FP %d\n',FP);
% fprintf('FN %d\n',FN);
% % 
% precision=TP/(TP+FP)
% recall=TP/(TP+FN)
% fmeasure=2*TP/(2*TP+FP+FN)


performanceLOO=aciertos/tam(1);

end



