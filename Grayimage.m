function [ I1 ] = Grayimage( I2 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[r c colormap] = size(I2);
for i=1:r
 for j=1:c
  I1(i,j) = 0.298*I2(i,j,1)+0.587*I2(i,j,2)+0.114*I2(i,j,3);
 end 
end

end

