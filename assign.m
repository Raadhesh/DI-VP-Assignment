function varargout = assign(varargin)
% ASSIGN MATLAB code for assign.fig
%      ASSIGN, by itself, creates a new ASSIGN or raises the existing
%      singleton*.
%
%      H = ASSIGN returns the handle to a new ASSIGN or the handle to
%      the existing singleton*.
%
%      ASSIGN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ASSIGN.M with the given input arguments.
%
%      ASSIGN('Property','Value',...) creates a new ASSIGN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before assign_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to assign_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help assign

% Last Modified by GUIDE v2.5 01-Oct-2019 02:03:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @assign_OpeningFcn, ...
                   'gui_OutputFcn',  @assign_OutputFcn, ...
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
% End initialization code - DO NOT EDIT


% --- Executes just before assign is made visible.
function assign_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to assign (see VARARGIN)

% Choose default command line output for assign
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes assign wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = assign_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
[filename pathname] = uigetfile({'*.gif'},'Select image','./images');
if(filename ~= 0 )
	img = strcat('images/',filename); % image error fix
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


% --- Executes on button press in run.
function run_Callback(hObject, eventdata, handles)
% hObject    handle to run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% The purpose of this program is to do image retrieval from the created
% database , image folder inside working path






	img = getappdata(handles.run, 'loaded_img');
	if length(img) == 0
		msgbox('Please upload an image first!','Error!','error');
		return
	end

imfile=getappdata(handles.run,'todaysdate');
image_retrieval(img)


function [prec, rec] = image_retrieval(imfile, handles)
tic
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

%imfile = ['.\images\bell-4.gif'];
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

num_Images =1:20 ;
%figure('Name', 'Precision vs Num_images','NumberTitle','off');
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
