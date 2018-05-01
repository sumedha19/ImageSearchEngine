function varargout = saveas_confirm(varargin)
% SAVEAS_CONFIRM MATLAB code for saveas_confirm.fig
%      SAVEAS_CONFIRM, by itself, creates a new SAVEAS_CONFIRM or raises the existing
%      singleton*.
%
%      H = SAVEAS_CONFIRM returns the handle to a new SAVEAS_CONFIRM or the handle to
%      the existing singleton*.
%
%      SAVEAS_CONFIRM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SAVEAS_CONFIRM.M with the given input arguments.
%
%      SAVEAS_CONFIRM('Property','Value',...) creates a new SAVEAS_CONFIRM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before saveas_confirm_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to saveas_confirm_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help saveas_confirm

% Last Modified by GUIDE v2.5 29-Mar-2017 23:38:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @saveas_confirm_OpeningFcn, ...
                   'gui_OutputFcn',  @saveas_confirm_OutputFcn, ...
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


% --- Executes just before saveas_confirm is made visible.
function saveas_confirm_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to saveas_confirm (see VARARGIN)

% Choose default command line output for saveas_confirm
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes saveas_confirm wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = saveas_confirm_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
%

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
   
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fname = uigetdir('C:\Users\Sumedha\Desktop\image mining\saveall\','Select Folder');
disp(fname);
set(handles.edit1,'String',fname);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
rsv=getappdata(0,'rsv');
f=getappdata(0,'f');
spath=get(handles.edit1,'String');
n=length(rsv);
 if f==1
        basepath='C:\Users\Sumedha\Desktop\image mining\images\face\';
         load db1.mat
    Fimage=db1(:,1);
    else if f==2
        basepath='C:\Users\Sumedha\Desktop\image mining\images\content\';
        else
            basepath='C:\Users\Sumedha\Desktop\image mining\images\feature\';
        end
 end
for j=1:size(rsv,1)
    if(f==1)
        i=int2str(Fimage(rsv(j)));
        else
            i=int2str(rsv(j));
    end
    x=imread(strcat(basepath,i,'.jpg'));
    imwrite(x, strcat(spath,'\', sprintf('%d.jpg',j)),'jpg');
end
msgbox('images saved successfully!');
pause(1.5);
close
close


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close
