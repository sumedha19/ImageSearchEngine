%%taking an image       train all images from face gallery
clc;
clear all;
close all;
[fname, path]=uigetfile('.jpg','input image');
fname=strcat(path,fname);
im=imread(fname);
im1=Grayimage(im);
imshow(im);
title('input face');
c=input('enter the class:');
%%feature extraction
F=featurestatistical(im1);
try
    load db
    F=[F c];
    db=[db;F];
    save db.mat db %uint8 type but std returns decimal valuse also so convert image to double
catch
   db=[F c];
   save db.mat db
end
