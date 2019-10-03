close all; clear; clc;
tic

global working_path;
cd(working_path);
addpath(pwd);

load('final_database_cbir.mat','database');



total_prec1 = zeros(340,20);
total_rec1 = zeros(340,20);
total_prec2 = zeros(340,20);
total_rec2 = zeros(340,20);
total_prec3 = zeros(340,20);
total_rec3 = zeros(340,20);

for z = 1:340
    total_prec1(z,:) = database(z).precision;
    total_rec1(z,:) = database(z).recall_rate; 
    
    total_prec2(z,:) = database(z).precisionRST;
    total_rec2(z,:) = database(z).recall_rateRST;
    
    total_prec3(z,:) = database(z).precisionPartialRST;
    total_rec3(z,:) = database(z).recall_ratePartialRST;
end


total_prec1 = total_prec1*100;
total_rec1 = total_rec1*100;
total_prec2 = total_prec2*100;
total_rec2 = total_rec2*100;
total_prec3 = total_prec3*100;
total_rec3 = total_rec3*100;

average_prec1 = mean(total_prec1);
average_rec1 = mean(total_rec1);

average_prec2 = mean(total_prec2);
average_rec2 = mean(total_rec2);

average_prec3 = mean(total_prec3);
average_rec3 = mean(total_rec3);


num_Images = 1:20;
figure('Name', 'Average Precision vs Num_images','NumberTitle','off');
plot(num_Images, average_prec1, 'b-o', num_Images, average_prec2, 'r-o', num_Images, average_prec3, 'g-o');
title('Average Precision vs Number of Images')
xlabel('Number of Images')
ylabel('Precision(%)')
legend('shape','RST shape', 'Partial RST shape')

figure('Name', 'Average Recall Rate vs Num_Images','NumberTitle','off');
plot(num_Images, average_rec1, 'b-o', num_Images, average_rec2, 'r-o', num_Images, average_rec3, 'g-o');
title('Average Recall Rate vs Number of Images')
xlabel('Number of Images')
ylabel('Recall Rate(%)')
legend('shape','RST shape', 'Partial RST shape')

figure('Name', 'Average Precision vs Average Recall Rate','NumberTitle','off');
plot(average_rec1, average_prec1, 'b-o', average_rec2, average_prec2, 'r-o', average_rec3, average_prec3, 'g-o');
title('Average Precision vs Average Recall Rate')
xlabel('Recall Rate(%)')
ylabel('Precision(%)')
legend('shape','RST shape', 'Partial RST shape')


toc