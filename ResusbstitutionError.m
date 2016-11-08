function [ performance,aciertos ] = ResusbstitutionError( DS,base,nc,k )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
 [aciertos, performance]=cHeaviside(DS,DS,base,k,nc);
performance=1-performance;
end

