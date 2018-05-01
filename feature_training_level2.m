%feature based images
%forming rgb_avg_4 database for all the images of the image database
clc;
clear all;
close all;
[fname, path]=uigetfile('.jpg','input image');
fname1=strcat(path,fname);
[pathstr,fname,ext] = fileparts(fname1);
im=imread(fname1);
imshow(im);
title('input image');
I=im;
I1=I(1:size(I,1)/2,1:size(I,2)/2,:);
I2=I(size(I,1)/2+1:size(I,1),1:size(I,2)/2,:);
I3=I(1:size(I,1)/2,size(I,2)/2+1:size(I,2),:);
I4=I(size(I,1)/2+1:size(I,1),size(I,2)/2+1:size(I,2),:);
fname=str2num(fname);
c1=rgb_avg(I1);
c2=rgb_avg(I2);
c3=rgb_avg(I3);
c4=rgb_avg(I4);
c=[c1 c2 c3 c4];
try
    load db3
    F=[fname c];
    db3 =[db3;F];
    save db3.mat db3 
catch
   db3=[fname c];
   save db3.mat db3
end