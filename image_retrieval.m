% The purpose of this program is to do image retrieval from the created
% database , image folder inside working path


function [prec, rec] = image_retrieval(imfile)

tic

global working_path;
cd(working_path);
addpath(pwd);


%% Do retrieval for 1 example image


%% Step 0: Get query image
load('database_cbir.mat','database');% loading the database mat file
% prompt = 'Enter image file name , e.g 2.jpg >> ';
% x = input(prompt,'s') 
%  n  n 
% x = '88.jpg';



% get feature vector from selected query image
%HistQ = getColourHistHSV(imfile);
%HistQ = database(3).featRGB ;

% prompt = 'Enter image file name , e.g 2.jpg >> ';
% x = input(prompt,'s') ;
% imfile = ['.\images\',x];
% prompt = 'Enter image label in database , e.g 1 for africa and 2 for beach >> ';
% label_true = input(prompt) ;
    

fprintf('\n\n The query image = %s :', imfile );

% figure, imshow(imfile );
% title('Query image');
featShape = getShapeFeatureVec(imfile);

%% Step 1: Find the K most similar images from the datase
% This is done by comparing the feature vector of the query image and the feature vector of all the image in the database
%K = 9;% Retrieve the top 9 ,
numIm = length(database)  ; % this give the number of images in database

for i=1:numIm
% your code
v2 = database(i).featShape;
dist(i)=getEuclideanDistance(v2,featShape);
end

%% Step 2: Sort the distance, show most similar image
% your code
[value,id] = sort(dist);

%% Step 3


%% Step 4, Suppose the user want to show 10 images
% id_list = [idx(1) idx(2) .....idx(10)] ;
k=20;
id_list = id(1:k) ;
count=0;


l = sqrt(k);
l = round(l);
b = 0;
while (b*l)<(k)
    b = b+1;
end
figure('Name', 'Images Retrieved','NumberTitle','off');
for j=1:k
   if j==1
        oriLabel=database(id).label;
        %continue;
   end
    id = id_list(j) ;
    imfile = database(id_list(j)).imageName ;
    label = database(id).label; str = sprintf('%d',label);
    i = sprintf('%s',database(id_list(j)).imageName); 
    i = erase(i,".\images\");
    i = erase(i,".gif");
    str =[ i '   label= ' str] ;
    subplot(l,b,j) , imshow(imfile) , title(str) ;
    if label==oriLabel
        count=count+1;
    end
    prec(j) = count/j;
    rec(j) = count/20;
end

num_Images = 1:20;

figure('Name', 'Precision vs Num_images','NumberTitle','off');
plot(num_Images, prec,'g');
title('Precision vs Number of Images')
xlabel('Number of Images')
ylabel('Precision')

figure('Name', 'Recall Rate vs Num_Images','NumberTitle','off');
plot(num_Images, rec, 'b');
title('Recall Rate vs Number of Images')
xlabel('Number of Images')
ylabel('Recall Rate')

figure('Name', 'Precision vs Recall Rate','NumberTitle','off');
plot(rec, prec, 'r');
title('Precision vs Recall Rate')
xlabel('Recall Rate')
ylabel('Precision')

fprintf('\nThe precision of 20 images is %8.3f\n', prec(20));

fprintf('The recall rate of 20 images is %8.3f\n', rec(20));
toc








