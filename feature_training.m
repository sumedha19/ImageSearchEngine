%feature based images
%forming rgb avg database for all the images of the image database
clc;
clear all;
close all;
[fname, path]=uigetfile('.jpg','input image');
fname1=strcat(path,fname);
[pathstr,fname,ext] = fileparts(fname1);
im=imread(fname1);
imshow(im);
title('input image');
fname=str2num(fname);
c=rgb_avg(im);
try
    load db2
    F=[fname c];
    db2=[db2;F];
    save db2.mat db2
catch
   db2=[fname c];
   save db2.mat db2
end