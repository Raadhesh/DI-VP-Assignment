close all; clear; clc;

img = imread('Test.gif');
imshow(img);

s = regionprops(img);
idx = length(s);
bb = s(idx).BoundingBox;
area = s(idx).Area;
width = bb(3);
height = bb(4);
diameter = immse(width, height);

figure;
r1 = round(bb(2));
c1 = round(bb(1));
w = bb(3);
h = bb(4);
r2 = r1+h-1;
c2 = c1+w-1;

img2 = img(r1:r2,c1:c2);
imshow(img2);
nw = sum(img2(:));
fprintf(['\ni = %d\tbbarea = %.1f\tsrow = %d\tscol = %d\theight = %d'...
    '\twidth = %d\twhite=%d'], idx,s(idx).Area,r1,c1,h,w,nw);
% figure;
% for i = 1:length(s)
%     bb = s(i).BoundingBox;
% 
%     r1 = round(bb(2));
%     c1 = round(bb(1));
%     w = bb(3);
%     h = bb(4);
%     r2 = r1+h-1;
%     c2 = c1+w-1;
% 
%     img2 = img(r1:r2,c1:c2);
%     subplot(2,4,i);
%     imshow(img2);
% 
%     nw = sum(img2(:));
% 
%     fprintf(['\ni = %d\tbbarea = %.1f\tsrow = %d\tscol = %d\theight = %d'...
%         '\twidth = %d\twhite=%d'], i,s(i).Area,r1,c1,h,w,nw);
% end

fprintf('\n');