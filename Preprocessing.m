
%% This code assign label to images in the dataset
% Question: Write the code extract 24 bin RGB and HSV histogram
% refer to code in line 251 to 255

clc; clear all; close all;

working_path = 'D:\Documents\MATLAB\DI&VP\Assignment';
image_directory = ['.\','images\'] ; % relative to working path

cd(working_path);
addpath(pwd);
addpath(image_directory);

%% Explore the dataset
% Question 1 : How many images in the \images folder
% Answer : 1000 
cd(working_path);

cd('.\images')
fileList = dir('*.gif'); % find all gif files in the directory

% display some images
% display 2nd image
im = imread(fileList(2).name );
imshow(im);

cd(working_path);

%% Annotate the images according to categories
% Question: How many images for Africa group ?
% Ans: 100

% bell-1 to bell-20 assign to Bell label = 1
% brick-01 to brick-20 assign to Brick label = 2
% car-01 to car-20 assign to Car label = 3
% chicken-01 to chicken-20 assign to Chicken label = 4
% Comma-1 to Comma-20 assign to Comma label = 5
% device0-1 to device0-20 assign to device0 label = 6
% device4-1 to device4-20 assign to device4 label = 7
% device8-1 to device8-20 assign to device8 label = 8
% face-1 to face-20 assign to Face label = 9
% fork-1 to fork-20 assign to Fork label = 10
% guitar-1 to guitar-20 assign to Guitar label = 11
% Heart-1 to Heart-20 assign to Heart label = 12
% key-1 to key-20 assign to Key label = 13
% octopus-1 to octopus-20 assign to Octopus label = 14
% rat-1 to rat-20 assign to Rat label = 15
% spring-1 to spring-20 assign to Spring label = 16
% turtle-1 to turtle-20 assign to Turtle label = 17


%% img bell-1 to bell-20 assign to Bell label = 1
i=0;
for k=1:20 %length(fileList)
    
  baseFileName = sprintf('bell-%d.gif', k);
  fullFileName = [image_directory baseFileName] ;
  % Now do something with fullFileName
  im = imread(fullFileName);
  %imshow(im);
  
  i=i+1;
  % store in an array of structure 
  database(i).imageName = fullFileName; % read the file name
  database(i).label = 1;  % ground truth label 1 is africa
    
  fprintf('\n The image %s assigned to label = %d category = Bell', baseFileName, ...
      1);
      
end
figure(1) , im = imread( database(i).imageName  );
imshow(im);


%% img brick-01 to brick-20 assign to Brick label = 2
for k=1:9 %length(fileList)
    
  baseFileName = sprintf('brick-0%d.gif', k);
  fullFileName = [image_directory baseFileName] ;
  % Now do something with fullFileName
  im = imread(fullFileName);
  %imshow(im);
  
  i=i+1;
  % store in an array of structure 
  database(i).imageName = fullFileName; % read the file name
  database(i).label = 2;  % ground truth label 1 is Beach
  
  fprintf('\n The image %s assigned to label = %d category = Brick', baseFileName, ...
      2);
      
end
for k=10:20 %length(fileList)
    
  baseFileName = sprintf('brick-%d.gif', k);
  fullFileName = [image_directory baseFileName] ;
  % Now do something with fullFileName
  im = imread(fullFileName);
  %imshow(im);
  
  i=i+1;
  % store in an array of structure 
  database(i).imageName = fullFileName; % read the file name
  database(i).label = 2;  % ground truth label 1 is Beach
  
  fprintf('\n The image %s assigned to label = %d category = Brick', baseFileName, ...
      2);
      
end

figure(2), im = imread( database(i).imageName  ); imshow(im);

%% img car-01 to car-20 assign to Car label = 3
for k=1:9 %length(fileList)
    
  baseFileName = sprintf('car-0%d.gif', k);
  fullFileName = [image_directory baseFileName] ;
  % Now do something with fullFileName
  im = imread(fullFileName);
  %imshow(im);
  
  i=i+1;
  % store in an array of structure 
  database(i).imageName = fullFileName; % read the file name
  database(i).label = 3;  % ground truth label 1 is Beach
  
  fprintf('\n The image %s assigned to label = %d category = Car', baseFileName, ...
      3);
      
end
for k=10:20 %length(fileList)
    
  baseFileName = sprintf('car-%d.gif', k);
  fullFileName = [image_directory baseFileName] ;
  % Now do something with fullFileName
  im = imread(fullFileName);
  %imshow(im);
  
  i=i+1;
  % store in an array of structure 
  database(i).imageName = fullFileName; % read the file name
  database(i).label = 3;  % ground truth label 1 is Beach
  
  fprintf('\n The image %s assigned to label = %d category = Car', baseFileName, ...
      3);
      
end
figure(3), im = imread( database(i).imageName  ); imshow(im);


%% img chicken-1 to chicken-20 assign to Chicken label = 4

for k=1:20 %length(fileList)
    
  baseFileName = sprintf('chicken-%d.gif', k);
  fullFileName = [image_directory baseFileName] ;
  % Now do something with fullFileName
  im = imread(fullFileName);
  %imshow(im);
  
  i=i+1;
  % store in an array of structure 
  database(i).imageName = fullFileName; % read the file name
  database(i).label = 4;  % ground truth label 1 is Beach
  
  fprintf('\n The image %s assigned to label = %d category = Chicken', baseFileName, ...
      4);
      
end
figure(4), im = imread( database(i).imageName  ); imshow(im);

%% img Comma-1 to Comma-20 assign to Dinasour label = 5

for k=1:20 %length(fileList)
    
  baseFileName = sprintf('Comma-%d.gif', k);
  fullFileName = [image_directory baseFileName] ;
  % Now do something with fullFileName
  im = imread(fullFileName);
  %imshow(im);
  
  i=i+1;
  % store in an array of structure 
  database(i).imageName = fullFileName; % read the file name
  database(i).label = 5;  % ground truth label 1 is Beach
  
  fprintf('\n The image %s assigned to label = %d category = Comma', baseFileName, ...
      5);
      
end
figure(5), im = imread( database(i).imageName  ); imshow(im);

%% % device0-1 to device0-20 assign to Device0 label = 6
for k=1:20 %length(fileList)
    
  baseFileName = sprintf('device0-%d.gif', k);
  fullFileName = [image_directory baseFileName] ;
  % Now do something with fullFileName
  im = imread(fullFileName);
  %imshow(im);
  
  i=i+1;
  % store in an array of structure 
  database(i).imageName = fullFileName; % read the file name
  database(i).label = 6;  % ground truth label 1 is Beach
  
  fprintf('\n The image %s assigned to label = %d category = Device0', baseFileName, ...
      6);
      
end
figure(6), im = imread( database(i).imageName  ); imshow(im);

%% % device4-1 to device4-20 assign to Device4 label = 7
for k=1:20 %length(fileList)
    
  baseFileName = sprintf('device4-%d.gif', k);
  fullFileName = [image_directory baseFileName] ;
  % Now do something with fullFileName
  im = imread(fullFileName);
  %imshow(im);
  
  i=i+1;
  % store in an array of structure 
  database(i).imageName = fullFileName; % read the file name
  database(i).label = 7;  % ground truth label 1 is Beach
  
  fprintf('\n The image %s assigned to label = %d category = Device4', baseFileName, ...
      7);
      
end
figure(7), im = imread( database(i).imageName  ); imshow(im);

%% % device8-1 to device8-20 assign to Horse label = 8
for k=1:20 %length(fileList)
    
  baseFileName = sprintf('device8-%d.gif', k);
  fullFileName = [image_directory baseFileName] ;
  % Now do something with fullFileName
  im = imread(fullFileName);
  %imshow(im);
  
  i=i+1;
  % store in an array of structure 
  database(i).imageName = fullFileName; % read the file name
  database(i).label = 8;  % ground truth label 1 is Beach
  
  fprintf('\n The image %s assigned to label = %d category = device8', baseFileName, ...
      8);
      
end
figure(8), im = imread( database(i).imageName  ); imshow(im);

%% % face-1 to face-20 assign to Mountain label = 9
for k=1:20 %length(fileList)
    
  baseFileName = sprintf('face-%d.gif', k);
  fullFileName = [image_directory baseFileName] ;
  % Now do something with fullFileName
  im = imread(fullFileName);
  %imshow(im);
  
  i=i+1;
  % store in an array of structure 
  database(i).imageName = fullFileName; % read the file name
  database(i).label = 9;  % ground truth label 1 is Beach
  
  fprintf('\n The image %s assigned to label = %d category = face', baseFileName, ...
      9);
      
end
figure(9), im = imread( database(i).imageName  ); imshow(im);

%% % fork-1 to fork-20 assign to fork label = 10
for k=1:20 %length(fileList)
    
  baseFileName = sprintf('fork-%d.gif', k);
  fullFileName = [image_directory baseFileName] ;
  % Now do something with fullFileName
  im = imread(fullFileName);
  %imshow(im);
  
  i=i+1;
  % store in an array of structure 
  database(i).imageName = fullFileName; % read the file name
  database(i).label = 10;  % ground truth label 1 is Beach
  
  fprintf('\n The image %s assigned to label = %d category = Fork', baseFileName, ...
      10);
      
end
figure(10), im = imread( database(i).imageName  ); imshow(im);
%% %% % guitar-1 to guitar-20 assign to Guitar label = 11
for k=1:20 %length(fileList)
    
  baseFileName = sprintf('guitar-%d.gif', k);
  fullFileName = [image_directory baseFileName] ;
  % Now do something with fullFileName
  im = imread(fullFileName);
  %imshow(im);
  
  i=i+1;
  % store in an array of structure 
  database(i).imageName = fullFileName; % read the file name
  database(i).label = 11;  % ground truth label 1 is Beach
  
  fprintf('\n The image %s assigned to label = %d category = Guitar', baseFileName, ...
      11);
      
end
figure(11), im = imread( database(i).imageName  ); imshow(im);
%% %% % Heart-1 to Heart-20 assign to Heart label = 12
for k=1:20 %length(fileList)
    
  baseFileName = sprintf('Heart-%d.gif', k);
  fullFileName = [image_directory baseFileName] ;
  % Now do something with fullFileName
  im = imread(fullFileName);
  %imshow(im);
  
  i=i+1;
  % store in an array of structure 
  database(i).imageName = fullFileName; % read the file name
  database(i).label = 12;  % ground truth label 1 is Beach
  
  fprintf('\n The image %s assigned to label = %d category = Heart', baseFileName, ...
      12);
      
end
figure(12), im = imread( database(i).imageName  ); imshow(im);
%% %% % key-1 to key-20 assign to Key label = 13
for k=1:20 %length(fileList)
    
  baseFileName = sprintf('key-%d.gif', k);
  fullFileName = [image_directory baseFileName] ;
  % Now do something with fullFileName
  im = imread(fullFileName);
  %imshow(im);
  
  i=i+1;
  % store in an array of structure 
  database(i).imageName = fullFileName; % read the file name
  database(i).label = 13;  % ground truth label 1 is Beach
  
  fprintf('\n The image %s assigned to label = %d category = key', baseFileName, ...
      13);
      
end
figure(13), im = imread( database(i).imageName  ); imshow(im);
%% %% % octopus-1 to octopus-20 assign to Octopus label = 14
for k=1:20 %length(fileList)
    
  baseFileName = sprintf('octopus-%d.gif', k);
  fullFileName = [image_directory baseFileName] ;
  % Now do something with fullFileName
  im = imread(fullFileName);
  %imshow(im);
  
  i=i+1;
  % store in an array of structure 
  database(i).imageName = fullFileName; % read the file name
  database(i).label = 14;  % ground truth label 1 is Beach
  
  fprintf('\n The image %s assigned to label = %d category = octopus', baseFileName, ...
      14);
      
end
figure(14), im = imread( database(i).imageName  ); imshow(im);
%% %% % rat-1 to rat-20 assign to Rat label = 15
for k=1:9 %length(fileList)
    
  baseFileName = sprintf('rat-0%d.gif', k);
  fullFileName = [image_directory baseFileName] ;
  % Now do something with fullFileName
  im = imread(fullFileName);
  %imshow(im);
  
  i=i+1;
  % store in an array of structure 
  database(i).imageName = fullFileName; % read the file name
  database(i).label = 15;  % ground truth label 1 is Beach
  
  fprintf('\n The image %s assigned to label = %d category = rat', baseFileName, ...
      15);
      
end
for k=10:20 %length(fileList)
    
  baseFileName = sprintf('rat-%d.gif', k);
  fullFileName = [image_directory baseFileName] ;
  % Now do something with fullFileName
  im = imread(fullFileName);
  %imshow(im);
  
  i=i+1;
  % store in an array of structure 
  database(i).imageName = fullFileName; % read the file name
  database(i).label = 15;  % ground truth label 1 is Beach
  
  fprintf('\n The image %s assigned to label = %d category = rat', baseFileName, ...
      15);
      
end
figure(15), im = imread( database(i).imageName  ); imshow(im);
%% %% % spring-1 to spring-20 assign to Spring label = 16
for k=1:20 %length(fileList)
    
  baseFileName = sprintf('spring-%d.gif', k);
  fullFileName = [image_directory baseFileName] ;
  % Now do something with fullFileName
  im = imread(fullFileName);
  %imshow(im);
  
  i=i+1;
  % store in an array of structure 
  database(i).imageName = fullFileName; % read the file name
  database(i).label = 16;  % ground truth label 1 is Beach
  
  fprintf('\n The image %s assigned to label = %d category = spring', baseFileName, ...
      16);
      
end
figure(16), im = imread( database(i).imageName  ); imshow(im);
%% %% % turtle-1 to turtle-20 assign to Turtle label = 17
for k=1:20 %length(fileList)
    
  baseFileName = sprintf('turtle-%d.gif', k);
  fullFileName = [image_directory baseFileName] ;
  % Now do something with fullFileName
  im = imread(fullFileName);
  %imshow(im);
  
  i=i+1;
  % store in an array of structure 
  database(i).imageName = fullFileName; % read the file name
  database(i).label = 17;  % ground truth label 1 is Beach
  
  fprintf('\n The image %s assigned to label = %d category = turtle', baseFileName, ...
      17);
      
end
figure(17), im = imread( database(i).imageName  ); imshow(im);


%%
% generate feature vector, student need to write code to extract feature

% for i = 1: length(database)
%     imFile = database(i).imageName ;
%     % Your code, make it work
%      database(i).featRGB = getColourHistRGB(imFile);
%      database(i).featHSV = getColourHistHSV(imFile);
% end

% save the variable dataBase
save('database_cbir.mat', 'database');























