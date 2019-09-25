function featVec = getRSTShapeFeatureVec(image_path)
%image_path = 'Test.gif'
% imshow(img);

BW = imread(image_path);


%% Crop Image to Object

bound = regionprops(BW,'BoundingBox');
sizes = cell2mat(struct2cell(bound(length(bound))));

subimage = imcrop(BW, [sizes(1), sizes(2), sizes(3), sizes(4)]);
%% Resize Image to 128 Rows. MATLAB will decide the number of columns to maintain aspect ratio

resizedImage=imresize(subimage, [128 NaN]);
%% 

I = resizedImage;
s = regionprops(I);
idx = length(s);
bb = s(idx).BoundingBox;

perim = bwperim(I);
perimeter=sum(sum(perim));
area = bwarea(I);
circularity = perimeter/(4*pi*area);

width = bb(3);
height = bb(4);
diameter = immse(width, height);
mia = regionprops(I, 'MajorAxisLength', 'MinorAxisLength');
major_axis = mia(idx).MajorAxisLength;
minor_axis = mia(idx).MinorAxisLength;

[rows,cols] = size(I);

if rows > cols
    ratio = rows/cols;
else
    ratio = cols/rows;
end
%% 

featVec = [area, perimeter, circularity, major_axis, minor_axis];
