close all; clear; clc;
tic

working_path = 'D:\Documents\MATLAB\DI&VP\Assignment';
cd(working_path);
addpath(pwd);

load('old_database_cbir.mat','database');
databaseOld = database;
load('new2_database_cbir.mat','database');
databaseNew = database;


total_prec_old = zeros(340,20);
total_rec_old = zeros(340,20);
total_prec_new = zeros(340,20);
total_rec_new = zeros(340,20);

for z = 1:340
    total_prec_old(z,:) = databaseOld(z).precision;
    total_rec_old(z,:) = databaseOld(z).recall_rate; 
    
    total_prec_new(z,:) = databaseNew(z).precision;
    total_rec_new(z,:) = databaseNew(z).recall_rate;
end


total_prec_old = total_prec_old*100;
total_rec_old = total_rec_old*100;
total_prec_new = total_prec_new*100;
total_rec_new = total_rec_new*100;

average_prec_old = mean(total_prec_old);
average_rec_old = mean(total_rec_old);

average_prec_new = mean(total_prec_new);
average_rec_new = mean(total_rec_new);


num_Images = 1:20;
figure('Name', 'Average Precision vs Num_images','NumberTitle','off');
plot(num_Images, average_prec_old, 'b-o', num_Images, average_prec_new, 'r-o');
title('Average Precision vs Number of Images')
xlabel('Number of Images')
ylabel('Precision(%)')
legend('initial','final')

figure('Name', 'Average Recall Rate vs Num_Images','NumberTitle','off');
plot(num_Images, average_rec_old, 'b-o', num_Images, average_rec_new, 'r-o');
title('Average Recall Rate vs Number of Images')
xlabel('Number of Images')
ylabel('Recall Rate(%)')
legend('initial','final')

figure('Name', 'Average Precision vs Average Recall Rate','NumberTitle','off');
plot(average_rec_old, average_prec_old, 'b-o', average_rec_new, average_prec_new, 'r-o');
xlabel('Recall Rate(%)')
ylabel('Precision(%)')
legend('initial','final')


toc