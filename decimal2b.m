function [ tobaseb ] = decimal2b( x,base,vecsize )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
tobaseb=zeros(1,vecsize);
for i=1:vecsize
    tobaseb(i)=mod(x,base);
    x=floor(x/base);
    if x==0
        break;
    end
    
end

tobaseb=flip(tobaseb);
end

