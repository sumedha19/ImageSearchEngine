function [ rs] = feature_based( I )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
a=I;
% level 1
am=rgb_avg(a);
%disp(am);
load db2.mat
Ftrain=db2(:,2:4);
for i=1:size(Ftrain,1)
dist1(i,:)=sum(abs(double(Ftrain(i,:))-double(am)))/3;
%disp(dist1(i,:));
end
rs1=find(dist1<100);
%disp(rs1);
%basepath='C:\Users\Sumedha\Desktop\image mining\images\feature\';
%for j=1:size(rs1)
 %    i=int2str(rs1(j));
  %   figure,imshow(imread(strcat(basepath,i,'.jpg')));
   %  title(i);
%end
%level 2 feature based
I=a;
I1=I(1:size(I,1)/2,1:size(I,2)/2,:);
I2=I(size(I,1)/2+1:size(I,1),1:size(I,2)/2,:);
I3=I(1:size(I,1)/2,size(I,2)/2+1:size(I,2),:);
I4=I(size(I,1)/2+1:size(I,1),size(I,2)/2+1:size(I,2),:);
m1=rgb_avg(I1);
m2=rgb_avg(I2);
m3=rgb_avg(I3);
m4=rgb_avg(I4);
m=[m1 m2 m3 m4];
load db3.mat
Ftrain2=db3(:,2:13);
for j=1:size(Ftrain2,1)
    d1=sum(abs(double(Ftrain2(j,1:3))-double(m1)))/3;
    d2=sum(abs(double(Ftrain2(j,4:6))-double(m2)))/3;
    d3=sum(abs(double(Ftrain2(j,7:9))-double(m3)))/3;
    d4=sum(abs(double(Ftrain2(j,10:12))-double(m4)))/3;
    dist2(j,:)=(d1+d2+d3+d4)/4;
end
rs2=intersect(rs1,find(dist2<100));
dd=dist2(rs2);
[d_sorted, d_index] = sort(dd);
%disp(dd);
%disp(d_sorted);
rs=d_index;
%close all;
%disp(dist2);
%disp(rs);
%basepath='C:\Users\Sumedha\Desktop\image mining\images\feature\';
%for j=1:size(rs)
 %    i=int2str(rs(j));
  % figure,imshow(imread(strcat(basepath,i,'.jpg')));
   %title(i);
%end
end