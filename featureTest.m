close all; clear; clc;


I = imread('test.gif');
figure,imshow(I);
[labeledImage, numberOfObject] = bwlabel(I);

area=bwarea(I);
perim = bwperim(I);
figure,imshow(perim);
perimeter=sum(sum(perim));

circularity = perimeter/(4*pi*area);

[rows,cols] = size(I);

x = ones(rows,1)*[1:cols];    % Matrix with each pixel set to its x coordinate
y = [1:rows]'*ones(1,cols);   % Matrix with each pixel set to its y coordinate
meanx = sum(sum(double(I).*x))/area;
meany = sum(sum(double(I).*y))/area;

