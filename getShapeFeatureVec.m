function featVec = getShapeFeatureVec(image_path)
%image_path = 'Test.gif'
img = imread(image_path);
% imshow(img);

s = regionprops(img);
idx = length(s);
bb = s(idx).BoundingBox;

perim = bwperim(img);
perimeter=sum(sum(perim));

area = s(idx).Area;
width = bb(3);
height = bb(4);
diameter = immse(width, height);
mia = regionprops(img, 'MajorAxisLength', 'MinorAxisLength');
major_axis = mia(idx).MajorAxisLength;
minor_axis = mia(idx).MinorAxisLength;
circularity = perimeter/(4*pi*area);


[rows,cols] = size(img);

x = ones(rows,1)*[1:cols];    % Matrix with each pixel set to its x coordinate
y = [1:rows]'*ones(1,cols);   % Matrix with each pixel set to its y coordinate
meanx = sum(sum(double(img).*x))/area;
meany = sum(sum(double(img).*y))/area;

featVec = [area, perimeter, diameter, width, height, circularity, major_axis, minor_axis];
