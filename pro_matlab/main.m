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
 title('ԭʼͼ��');

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
 title('Ŀ��ͼ��');


% --- Executes on button press in pushbutton3.
%��ͼ����лҶȻ�����
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I;%��ʾ����ԭͼ��
global I1;%��ʾ�������ڼ���ͼ��
I=rgb2gray(I);%��ԭͼ����лҶȻ�����
 %figure('NumberTitle', 'off', 'Name', '�������');%��ʾͼƬ�½�һ������������ʾ
 subplot(1,2,1);
 imshow(I);%��ʾԭͼ��ĻҶȻ�
 title('ԭʼͼ��ҶȻ�');
subplot(1,2,2);
I1=rgb2gray(I1);%������ͼ��ҶȻ�
imshow(I1);%��ʾ���ͼ��ĻҶȻ�
title('Ŀ��ͼ��ҶȻ�');

%ͼ����ֵ�˲�����
% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
global I;
global I1;
I=medfilt2(I,[5,5]);%��ԭͼ�������ֵ�˲�
I1=medfilt2(I1,[5,5]);%�Լ��ͼ�������ֵ�˲�
 subplot(1,2,1);
 imshow(I);%��ʾԭͼ��
 title('ԭʼͼ����ֵ�˲�');
subplot(1,2,2);
imshow(I1);%��ʾ���ͼ��
title('���ͼ����ֵ�˲�');
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%�������˵����е�һϵ�в���
% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val=get(handles.popupmenu1,'value');
disp(val);%�������ѡ��ĵڼ������������ľ�������
%disp������ʾ�ı�
switch(val)
    case 2
        T=40;
    case 3
        T=50;
    case 4
        T=60;
end
disp(T);
%ԭʼͼ��
global I;
%���ͼ��
global I1;
%��ԭʼͼ����ж�ֵ������
I=im2bw(I,T/255);
I1=im2bw(I1,T/255);
 subplot(1,2,1);
 imshow(I);
 title('ԭʼͼ���ֵ������');
subplot(1,2,2);
imshow(I1);
title('���ͼ���ֵ������');
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

%����Ƿ����˽���
% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
%ԭʼͼ��
global I;
%���ͼ��
global I1;
I=imsubtract(I1,I);
subplot(1,1,1);
imshow(I);
title('����ͼƬ�������');

% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
global I;
I=imclearborder(I,4);
 subplot(1,3,1);
imshow(I);
title('����߽�ͼ��');
se = strel('disk',4);
global  erodedBW;
erodedBW = imerode(I,se);
 subplot(1,3,2);
imshow(erodedBW);
se1 = strel('line',1,0);
erodedBW1 = imerode(erodedBW,se1);
subplot(1,3,2);
imshow(erodedBW1);
title('��ʴ������');
global dilatedBW;
dilatedBW = imdilate(erodedBW,se);
 subplot(1,3,3);
imshow(dilatedBW);
title('����������');

% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

