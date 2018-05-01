function [ rs,flag ] = content_driven( I )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
a=I;
tx=ocr(a);
rec=tx.Text;
n = length(regexp(rec, '\s+'));
TF = isstrprop(rec,'wspace'); %to check for whitespaces
for i=1:n
    if(TF(i)==1)
        f=0;
    else
        f=1;
        break;
    end
end
if(isempty(rec) || f==0)
rs=feature_based(I);
flag=3;
else
    load db4
     allwords=db4(:,2:17);
    for i=1:size(allwords,1)
        x(i,:)=0;
    end
   
    for j=1:n
    for i=1:size(allwords,1)
        if(sum(strncmpi(tx.Words{j},allwords(i,:),length(allwords(i,:))))>0 && length(tx.Words{j})>3)  %compare first n characters of strings case insensitive.
           x(i,:)=x(i,:)+1;
        end
    end
    end
   disp(x);
   
    
    [x_sorted, x_index] = sort(x,'descend');
  
   
   rs=x_index(1:20);
    flag=2;
end
end

