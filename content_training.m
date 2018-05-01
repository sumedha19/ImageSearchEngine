%to extract text from images in the databasde
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
tx=ocr(im);
rec=tx.Text;
n = length(regexp(rec, '\s+'));

try
    load db4
    if n<16
    for i=1:n
       t=tx.Words{i};
       c{1,i}=t;       
    end
    for i=n:16
        c{1,i}=0;
    end
    else
    for i=1:n
       t=tx.Words{i};
       c{1,i}=t;       
    end 
    end
    F=[fname c];
    db4=[db4;F];
    save db4.mat db4
catch
    
    if n<16  %%as max words among all the images of database is 16(manually or can be done using a program)
    for i=1:n
       t=tx.Words{i};
       c{1,i}=t;       
    end
    for i=n:16
        c{1,i}=0;
    end
    else
        for i=1:n
       t=tx.Words{i};
       c{1,i}=t;       
    end 
    end
   db4=[fname c];
   save db4.mat db4
end