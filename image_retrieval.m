function program5_do_image_retrieval(HistQ,k)
% The purpose of this program is to do image retrieval from the created
% database , image folder inside working path
%clc; clear all; close all;


working_path = 'D:\Documents\MATLAB\DI&VP\Assignment';
cd(working_path);
addpath(pwd);


%% Do retrieval for 1 example image


%% Step 0: Get query image
load('database_cbir.mat','database');% loading the database mat file
% prompt = 'Enter image file name , e.g 2.jpg >> ';
% x = input(prompt,'s') 
% 
% x = '88.jpg';
% imfile = ['.\images\',x];


% get feature vector from selected query image
%HistQ = getColourHistHSV(imfile);
%HistQ = database(3).featRGB ;

prompt = 'Enter image file name , e.g 2.jpg >> ';
x = input(prompt,'s') ;
imfile = ['.\images\',x];
prompt = 'Enter image label in database , e.g 1 for africa and 2 for beach >> ';
label_true = input(prompt) ;
n = 1;    

%% Step 1: Find the K most similar images from the datase
% This is done by comparing the feature vector of the query image and the feature vector of all the image in the database
%K = 9;% Retrieve the top 9 ,
numIm = length(database)  ; % this give the number of images in database

for i=1:numIm
% your code
v2 = database(i).featRGB;
dist(i)=getEuclidian(v2,HistQ);
end

%% Step 2: Sort the distance, show most similar image
% your code
[value,id] = sort(dist)

%% Step 3


%% Step 4, Suppose the user want to show 10 images
% id_list = [idx(1) idx(2) .....idx(10)] ;
id_list = id(1:k) ;
figure(3);
count=0;
for j=1:k
   if j==1
        oriLabel=database(id).label;
        continue;
   end
    id = id_list(j) ;
    imfile = database(id_list(j)).imageName ;
    label = database(id).label; str = sprintf('%d',label);
    i = sprintf('%d',id_list(j)-1); 
    str =['Image ' i 'label= ' str] ;
    subplot(ceil(k/2),ceil(k/2),j-1) , imshow(imfile) , title(str) ;
    if label==oriLabel
        count=count+1;
    end
end

disp('Precision:');
disp(count/k);











