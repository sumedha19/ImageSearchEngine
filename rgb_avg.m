function [ am ] = rgb_avg(I)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
I1=imresize(I,[100,100]);

if size(I1,3)==3 %RGB image-3D
meanRed1 = mean2(I1(:,:,1));
meanGreen1 = mean2(I1(:,:,2));
meanBlue1 = mean2(I1(:,:,3));
am=[meanRed1 meanGreen1 meanBlue1];
else                        %grayscale image-2D
     am=mean(mean(reshape(I1, [], 2)));
end

end

