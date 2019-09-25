

working_path = 'D:\Documents\MATLAB\DI&VP\Assignment';
cd(working_path);
addpath(pwd);

load('database_cbir.mat','database');% loading the database mat file

precision = (0);
recall_rate = (0);

for z = 1:340
    imfile = database(z).imageName;
    [precision(z), recall_rate(z)] = image_retrieval(imfile);
end

average_precision = mean(precision);
average_recall_rate = mean(recall_rate);