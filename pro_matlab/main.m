function varargout = main(varargin)
% MAIN MATLAB code for main.fig
%      MAIN, by itself, creates a new MAIN or raises the existing
%      singleton*.
%
%      H = MAIN returns the handle to a new MAIN or the handle to
%      the existing singleton*.
%
%      MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN.M with the given input arguments.
%
%      MAIN('Property','Value',...) creates a new MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main

% Last Modified by GUIDE v2.5 14-Dec-2018 11:00:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_OpeningFcn, ...
                   'gui_OutputFcn',  @main_OutputFcn, ...
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


% --- Executes just before main is made visible.
function main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main (see VARARGIN)

% Choose default command line output for main
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes main wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = main_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=readPicture();
global I;
I=imread(str);
subplot(1,2,1)
 imshow(I);
 title('原始图像');

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str2=readPicture();
global I1;
I1=imread(str2);
subplot(1,2,2)
 imshow(I1);
 title('目标图像');


% --- Executes on button press in pushbutton3.
%对图像进行灰度化处理
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I;%表示的是原图像
global I1;%表示的是用于检测的图像
I=rgb2gray(I);%将原图像进行灰度化处理
 %figure('NumberTitle', 'off', 'Name', '处理过程');%显示图片新建一个窗口用来显示
 subplot(1,2,1);
 imshow(I);%显示原图像的灰度化
 title('原始图像灰度化');
subplot(1,2,2);
I1=rgb2gray(I1);%将检测的图像灰度化
imshow(I1);%显示检测图像的灰度化
title('目标图像灰度化');

%图像中值滤波处理
% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
global I;
global I1;
I=medfilt2(I,[5,5]);%对原图像进行中值滤波
I1=medfilt2(I1,[5,5]);%对检测图像进行中值滤波
 subplot(1,2,1);
 imshow(I);%显示原图像
 title('原始图像中值滤波');
subplot(1,2,2);
imshow(I1);%显示检测图像
title('检测图像中值滤波');
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%对下拉菜单进行的一系列操作
% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val=get(handles.popupmenu1,'value');
disp(val);%输出的是选择的第几个而不是他的具体内容
%disp函数显示文本
switch(val)
    case 2
        T=40;
    case 3
        T=50;
    case 4
        T=60;
end
disp(T);
%原始图像
global I;
%检测图像
global I1;
%对原始图像进行二值化处理
I=im2bw(I,T/255);
I1=im2bw(I1,T/255);
 subplot(1,2,1);
 imshow(I);
 title('原始图像二值化处理');
subplot(1,2,2);
imshow(I1);
title('检测图像二值化处理');
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%检测是否有人进入
% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
%原始图像
global I;
%检测图像
global I1;
I=imsubtract(I1,I);
subplot(1,1,1);
imshow(I);
title('两张图片进行相减');

% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
global I;
I=imclearborder(I,4);
 subplot(1,3,1);
imshow(I);
title('清除边界图像');
se = strel('disk',4);
global  erodedBW;
erodedBW = imerode(I,se);
 subplot(1,3,2);
imshow(erodedBW);
se1 = strel('line',1,0);
erodedBW1 = imerode(erodedBW,se1);
subplot(1,3,2);
imshow(erodedBW1);
title('腐蚀运算结果');
global dilatedBW;
dilatedBW = imdilate(erodedBW,se);
 subplot(1,3,3);
imshow(dilatedBW);
title('膨胀运算结果');

% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

