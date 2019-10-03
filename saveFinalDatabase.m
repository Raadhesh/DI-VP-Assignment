close all; clear; clc;
tic

working_path = 'C:\Users\ThisI\Documents\GitHub\DI-VP-Assignment';
cd(working_path);
addpath(pwd);


load('new_database_cbir.mat','database');
databaseNew = database;
load('new2_database_cbir.mat','database');
databaseNew2 = database;
load('old_database_cbir.mat','database');
databaseOld = database;
clear database;
database = databaseOld;

for i = 1: length(database)
    database(i).featShapeRST = databaseNew(i).featShapeRST;
    database(i).featShapePartialRST = databaseNew2(i).featShapeRST;
    
    database(i).precisionRST = databaseNew(i).precision;
    database(i).precisionPartialRST = databaseNew2(i).precision;
    
    database(i).recall_rateRST = databaseNew(i).recall_rate;
    database(i).recall_ratePartialRST = databaseNew2(i).recall_rate;
end

save('final_database_cbir.mat','database');
