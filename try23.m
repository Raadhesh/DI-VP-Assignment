function varargout = try23(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @try23_OpeningFcn, ...
                   'gui_OutputFcn',  @try23_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

function try23_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
uidata(hObject, handles);

function varargout = try23_OutputFcn(hObject, eventdata, handles)
varargout{1} = handles.output;

function pushbutton2_Callback(hObject, eventdata, handles)
[filename pathname] = uigetfile({'*.gif'},'Select image','./images');
if(filename ~= 0 )
	img = strcat('images/',filename); % image error fix
    image = imread(img)
	axes(handles.Main)
	try
		imshow(img)
	catch exception
		img = strcat(pathname,filename);
		imshow(img)
        image_retrieval(img)
	end
	% associate the loaded image value run, that is the search button
	setappdata(handles.run, 'loaded_img', img);
else
    return;
end

function [prec, rec] = image_retrieval(imfile)

tic

working_path = 'C:\Users\ThisI\Documents\GitHub\DI-VP-Assignment';
cd(working_path);
addpath(pwd);

%% Do retrieval for 1 example image

%% Step 0: Get query image
load('database_cbir.mat','database');% loading the database mat file
% prompt = 'Enter image file name , e.g 2.jpg >> ';
% x = input(prompt,'s') 
% 
% x = '88.jpg';

imfile = ['.\images\bell-4.gif'];
% get feature vector from selected query image
%HistQ = getColourHistHSV(imfile);
%HistQ = database(3).featRGB ;

% prompt = 'Enter image file name , e.g 2.jpg >> ';
% x = input(prompt,'s') ;
% imfile = ['.\images\',x];
% prompt = 'Enter image label in database , e.g 1 for africa and 2 for beach >> ';
% label_true = input(prompt) ;

fprintf('\n\n The query image = %s :', imfile );

figure, imshow(imfile );
title('Query image');
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
xlabel('Recall Rate')
ylabel('Precision')
toc




function FileMenu_Callback(hObject, eventdata, handles)

% --------------------------------------------------------------------
function OpenMenuItem_Callback(hObject, eventdata, handles)
file = uigetfile('*.fig');
if ~isequal(file, 0)
    open(file);
end

% --------------------------------------------------------------------
function PrintMenuItem_Callback(hObject, eventdata, handles)
printdlg(handles.figure1)

% --------------------------------------------------------------------
function CloseMenuItem_Callback(hObject, eventdata, handles)
selection = questdlg(['Close ' get(handles.figure1,'Name') '?'],...
                     ['Close ' get(handles.figure1,'Name') '...'],...
                     'Yes','No','Yes');
if strcmp(selection,'No')
    return;
end
delete(handles.figure1)


function popupmenu1_Callback(hObject, eventdata, handles)


function popupmenu1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
     set(hObject,'BackgroundColor','white');
end

set(hObject, 'String', {'plot(rand(5))', 'plot(sin(1:0.01:25))', 'bar(1:.5:10)', 'plot(membrane)', 'surf(peaks)'});


% --- Executes on button press in pushbutton2.



function pushbutton4_Callback(hObject, eventdata, handles)



% --- Executes on button press in run.
function run_Callback(hObject, eventdata, handles)



function pushbutton6_Callback(hObject, eventdata, handles)

image_retrieval(imfile);
