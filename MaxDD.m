function [ maxn ] = MaxDD( DSt )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
maxn=0;

[filas columnas]=size(DSt);
for i=1:filas
    
    for j=1:columnas
    
        digitos=[];
    digitos=regexp(num2str(DSt(i,j),15),'\.','split');
    filasd=size(digitos);
    
        if filasd(2)>1
            
            max1=length(digitos{2});
            if max1>maxn
                   
               fprintf('Cambio de maxn %d\n',max1);
            maxn=max1;
            fprintf('en la fila %d y columna %d\n',i,j);
            DSt(i,j)
                
                
            
            end
        end
        
           
        
    end
end

%             if maxn>15
%                     maxn=15;
%                     fprintf('max en 5 por precisión\n');
%             end

end

