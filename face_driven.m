function [rs,flag] = face_driven( I )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%face detection
FDetect = vision.CascadeObjectDetector;
a=I;
BB = step(FDetect,a);%bounding box
if(isempty(BB))
    [rs,flag]=content_driven(I);
    
else
    for i=1:size(BB,1)
       b=imcrop(a,BB(i,:)); 
       %%find out which class it belongs+++++++++++
       b1=imresize(b,[71,71]);
       b2=Grayimage(b1);
       
      Ftest=featurestatistical(b2);
      %%compare with database
load db.mat
Ftrain=db(:,1:2);
Ctrain=db(:,3);
for i=1:size(Ftrain,1)
dist(i,:)=sum(abs(Ftrain(i,:)-Ftest));
end
mi=min(dist);
if(mi<25)
m=find(dist==mi,1);
det_class=Ctrain(m);
load db1.mat
Cimage=db1(:,2);
rs=find(Cimage==det_class);
flag=1;
else
    msgbox('Face not registered in database');
    rs=feature_based(I);
    flag=3;
end
    end
end
end

