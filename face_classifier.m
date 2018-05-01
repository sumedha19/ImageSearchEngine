%%taking an image
clc;
clear all;
close all;
[fname, path]=uigetfile('.jpg','input image');
fname1=strcat(path,fname);
[pathstr,fname,ext] = fileparts(fname1);
im=imread(fname1);
imshow(im);
title('input face');
c=input('enter the class:');
%%to create a database containing record about facial images and their
%%corresponding class
fname=str2num(fname);
try
    load db1
    F=[fname c];
    db1=[db1;F];
    save db1.mat db1 %uint8 type but std returns decimal valuse also so convert image to double
catch
   db1=[fname c];
   save db1.mat db1
end
