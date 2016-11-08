clear
clc

%DS=dlmread('datasets\haberman.txt','\t');
%DS=dlmread('datasets\banana.txt','\t');% 2 veces k fold
DS=dlmread('datasets\Titanic.txt','\t');
%DS=dlmread('phoneme.txt','\t');
%DS=dlmread('appendicitis.txt','\t');
%DS=dlmread('datasets\iris.txt','\t'); %20 veces
%DS=dlmread('Completas_manos.txt','\t');
%DS=dlmread('heart.txt','\t');
%DS=dlmread('magic.txt','\t');
%DS=dlmread('australian.txt','\t');
%DS=dlmread('ring.txt','\t');
%DS=dlmread('ionosphere.txt','\t');

%DS=dlmread('Completas_Norm.txt','\t');
%DS=dlmread('DatasetsBetty\Banco1NoNormalizado.txt','\t');
%DS=dlmread('DatasetsBetty\Banco1Z_Score.txt','\t');
%DS=dlmread('DatasetsBetty\Banco1DMax.txt','\t');
%DS=dlmread('DatasetsBetty\vrasgosT50Mano.txt','\t');
%DS=dlmread('DatasetsBetty\vrasgosT50Mano_ZScore.txt','\t');
%DS=dlmread('DatasetsBetty\vrasgosT50ManoDMax.txt','\t');
%DS=dlmread('DatasetsBetty\vrasgosT50PrimerDedo.txt','\t');
%DS=dlmread('DatasetsBetty\vrasgosT50PrimerDedo_ZS.txt','\t');
%DS=dlmread('DatasetsBetty\vrasgosT50PrimerDedo_DM.txt','\t');
%DS=dlmread('DatasetsBetty\vrasgosT200Mano.txt','\t');
%DS=dlmread('DatasetsBetty\vrasgosT200Mano_ZS.txt','\t');
%DS=dlmread('DatasetsBetty\vrasgosT200Mano_DM.txt','\t');
%DS=dlmread('DatasetsBetty\vrasgosT200PrimerDedo.txt','\t');
%DS=dlmread('DatasetsBetty\vrasgosT200PrimerDedo_ZS.txt','\t');
%DS=dlmread('DatasetsBetty\vrasgosT200PrimerDedo_DM.txt','\t');
%DS=dlmread('DatasetsBetty\IITManoHeaviside.txt','\t');

%DS=xlsread('NSR2\IITPrimerDedoHeaviside2R.xlsx');
%DS=dlmread('NSR2\CasiaPrimerDedoHeaviside2R.txt','\t');

%DS=dlmread('NSR2\IITManoyPrimerDedoHeaviside.txt','\t');
%DS=dlmread('NSR2\IITManoPrimerDedoZHeaviside.csv',',');
%DS=dlmread('NSR2\IITPrimerDedoHeaviside.txt','\t');
%DS=dlmread('NSR2\IITPrimerDedoZHeaviside.csv',',');
%DS=xlsread('NSR2\CasiaManoyPrimerDedoHeaviside.xlsx');
%DS=dlmread('NSR2\CasiaManoyPrimerDedoZHeaviside.csv',',');
%DS=xlsread('NSR2\CasiaPrimerDedoHeaviside.xlsx');
%DS=dlmread('NSR2\CasiaPrimerDedoZHeaviside.csv',',');

%DS=xlsread('datasets\HomomorphicTH_Heaviside.xlsx');
%DS=xlsread('datasets\HomomorphicTH_HeavisideFS.xlsx');
%DS=xlsread('datasets\Reduced_HomomorphicTH_Heaviside.xlsx');
%DS=xlsread('datasets\Reduced_HomomorphicTH_HeavisideFS.xlsx');

%DS=xlsread('datasets\ZernikeHomoTH_wholeHeaviside.xlsx');
%DS=xlsread('datasets\ZernikeHomoTH_wholeHeavisideFS.xlsx');
%DS=xlsread('datasets\ZernikeHomoTH_reducedHeaviside.xlsx');
%DS=xlsread('datasets\ZernikeHomoTH_reducedHeavisideFS.xlsx');

%DS=xlsread('datasets\Merged_HomomorphicTH_wholeHeaviside.xlsx');
%DS=xlsread('datasets\Merged_HomomorphicTH_wholeHeavisideFS.xlsx');
%DS=xlsread('datasets\Merged_HomomorphicTH_reducedHeaviside.xlsx');
%DS=xlsread('datasets\Merged_HomomorphicTH_reducedHeavisideFS.xlsx');

%DS=dlmread('datasets\HuMomentsReducedHeavisideFS.csv',',');
%DS=xlsread('datasets\Dataset_Hu_HF_Heaviside.xlsx');
%DS=xlsread('datasets\Dataset_Hu_HF_HeavisideFS.xlsx');

%minimo=min(min(DS))

DSt=Preprocesar(DS)
DSt=desordenav2(DSt);
[nclases,tamanio,sizeclases]=getInfo(DSt)

max_base=max(max(DSt(:,1:end-1)))

%DSt=PreprocesarV2(DS)

%[C1,C2,tc1,tc2]=Clases(DSt);%dividir el transformado

%base=input('0 o 1 para el maximo o introducir valor de la base\n');
base=max_base+1
%k=input('Introduzca el valor de k\n');
k=1;
nclases
% nc=2;
% 

resultados=[]

k_value=1;

while k_value<=9
    
    for i=1:base
            
            fprintf('Valor de K= %d base= %d de una base maxima %d',k_value,i,base);
%         [performanceLOO]=LeaveOneOut(DSt,i,nclases,k_value);
%          auxiliar=[k_value,i,performanceLOO];
            
            promedioKFold=0.0
            for j=1:2
                  [ performanceKFCV,performanceKFCVR ] = kFoldCrossValidationv2(DSt,nclases,base,k);
                  promedioKFold=promedioKFold+performanceKFCV;
            end
            promedioKFold=promedioKFold/2;
            auxiliar=[k_value,i,promedioKFold];

        %  [ performanceKFCV,performanceKFCVR ] = kFoldCrossValidationv2(DSt,nclases,base,k)
        %  fprintf('Performance de K Fold Cross Validation %d y %d en recuperacion\n',performanceKFCV,performanceKFCVR)
        resultados=vertcat(resultados,auxiliar);
    
    end
    k_value=k_value+2; 
end


% for i=1:base
% 
%         [performanceLOO]=LeaveOneOut(DSt,i,nclases,k);
%     
%         auxiliar=[i,performanceLOO];
%         
%         %  [ performanceKFCV,performanceKFCVR ] = kFoldCrossValidationv2(DSt,nclases,base,k)
%         %  fprintf('Performance de K Fold Cross Validation %d y %d en recuperacion\n',performanceKFCV,performanceKFCVR)
% 
%     
%         resultados=vertcat(resultados,auxiliar);
%     
% end

dlmwrite('Salida_banana_KFold.csv',resultados);

% 
% % 
% [aciertosre, performancere,acrec,perec]=cHeaviside(DSt,DSt,base,k,nclases);
% fprintf('Resubstitution error %d\n y perf rec %d\n',(1-performancere),perec);

% [performanceLOO]=LeaveOneOut(DSt,base,nclases,k);
% fprintf('Performance del LOO es %d\n',performanceLOO);
% % % 
% [performanceHO,performanceHOR]=HoldOut(DSt,nclases,base,k);
% fprintf('Performance de Hold Out %d y %d en recuperacion\n',performanceHO,performanceHOR)


    
%  [ performanceKFCV,performanceKFCVR ] = kFoldCrossValidationv2(DSt,nclases,base,k)
%  fprintf('Performance de K Fold Cross Validation %d y %d en recuperacion\n',performanceKFCV,performanceKFCVR)

