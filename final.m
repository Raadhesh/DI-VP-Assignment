
close all; clear; clc;
tic

working_path = 'D:\Documents\MATLAB\DI&VP\Assignment';
cd(working_path);
addpath(pwd);

load('database_cbir.mat','database');% loading the database mat file

precision = (0);
recall_rate = (0);

total_prec = zeros(340,20);
total_rec = zeros(340,20);


for z = 1:340
    imfile = database(z).imageName;
    database(z).precision = zeros(1,20);
    database(z).recall_rate = zeros(1,20);
    [precision, recall_rate] = image_retrievalRST(imfile);
    database(z).precision(:) = precision;
    database(z).recall_rate(:) = recall_rate;
    total_prec(z,:) = precision;
    total_rec(z,:) = recall_rate; 
    close all;
end

average_prec = mean(total_prec);
average_rec = mean(total_rec);

num_Images = 1:20;
figure('Name', 'Average Precision vs Num_images','NumberTitle','off');
plot(num_Images, average_prec,'g');
title('Average Precision vs Number of Images')
xlabel('Number of Images')
ylabel('Precision')

figure('Name', 'Average Recall Rate vs Num_Images','NumberTitle','off');
plot(num_Images, average_rec, 'b');
title('Average Recall Rate vs Number of Images')
xlabel('Number of Images')
ylabel('Recall Rate')

figure('Name', 'Average Precision vs Average Recall Rate','NumberTitle','off');
plot(average_rec, average_prec, 'r');
xlabel('Recall Rate')
ylabel('Precision')



save('new2_database_cbir.mat','database');% saving the database mat file

toc
