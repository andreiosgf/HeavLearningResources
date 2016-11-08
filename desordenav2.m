function [ X_des ] = desordenav2( X )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[filas, ~]=size(X);

posiciones=randperm(filas);

X_des=X(posiciones,:);

% fprintf('Clases \n');
% 
% clases=unique(X(:,end));
% 
% tamclases=size(clases);
% 
%     for i=1:tamclases(1)
%        fprintf('clase %d\n',i);
%        X_des(X_des(:,end)==i,:);
%     end

end

