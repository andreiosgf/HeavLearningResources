function [ C1, C2,tc1, tc2 ] = Clases( DS )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
tamds=size(DS);
tc1=0;
tc2=0;


for i=1:tamds(1)
    if DS(i,tamds(2))==1
        C1(tc1+1,:)=DS(i,:);%Es copia completa de filas no como en Java por un indice
        tc1=tc1+1;
    else
        C2(tc2+1,:)=DS(i,:);
        tc2=tc2+1;
    end
   
        
end
end

