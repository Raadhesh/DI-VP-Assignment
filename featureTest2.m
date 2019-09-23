clc; clear all;

img = imread('Test.gif');
imshow(img);

s = regionprops(img);
figure;

for i = 1:length(s)
    bb = s(i).BoundingBox;

    r1 = round(bb(2));
    c1 = round(bb(1));
    w = bb(3);
    h = bb(4);
    r2 = r1+h-1;
    c2 = c1+w-1;

    img2 = img(r1:r2,c1:c2);
    subplot(50,50,i);
    imshow(img2);

    nw = sum(img2(:));

    fprintf(['\ni = %d\tbbarea = %.1f\tsrow = %d\tscol = %d\theight = %d'...
        '\twidth = %d\twhite=%d'], i,s(i).Area,r1,c1,h,w,nw);
end

fprintf('\n');