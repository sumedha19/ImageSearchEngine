
function varargout = home(varargin)
% HOME MATLAB code for home.fig
%      HOME, by itself, creates a new HOME or raises the existing
%      singleton*.
%
%      H = HOME returns the handle to a new HOME or the handle to
%      the existing singleton*.
%
%      HOME('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HOME.M with the given input arguments.
%
%      HOME('Property','Value',...) creates a new HOME or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before home_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to home_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help home

% Last Modified by GUIDE v2.5 17-Apr-2017 19:59:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @home_OpeningFcn, ...
                   'gui_OutputFcn',  @home_OutputFcn, ...
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


% --- Executes just before home is made visible.
function home_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to home (see VARARGIN)

% Choose default command line output for home
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes home wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = home_OutputFcn(hObject, eventdata, handles) 
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
[FileName,PathName] = uigetfile('.jpg','Select query image'); %to browse a file
if ~isempty(FileName)
    I=imread(strcat(PathName,'\',FileName));
    ima=imresize(I,[526,757]); 
end
imshow(I);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I=getimage(handles.axes1);
tic
[rs ,flag]=face_driven(I);
toc
t=strcat(num2str(toc),' sec');
set(handles.text2,'String',t);
%msgbox(int2str(size(rs,1)));
if(isempty(rs))
    msgbox('No search results! Try again');
else
    if flag==1
        basepath='C:\Users\Sumedha\Desktop\image mining\images\face\';
        load db1.mat
    Fimage=db1(:,1);
    else if flag==2
        basepath='C:\Users\Sumedha\Desktop\image mining\images\content\';
        else
            basepath='C:\Users\Sumedha\Desktop\image mining\images\feature\';
        end
    end
    
    handles.hAxes = [ handles.axes2, handles.axes3, handles.axes4,handles.axes5,handles.axes6,handles.axes7,handles.axes8,handles.axes9, handles.axes10,handles.axes11,handles.axes12,handles.axes13,handles.axes14,handles.axes15,handles.axes16,handles.axes17,handles.axes18,handles.axes19,handles.axes20,handles.axes21];
    

    for j=1:size(rs,1);
        if(flag==1)
        i=int2str(Fimage(rs(j)));
        else
            i=int2str(rs(j));
        end
       axes( handles.hAxes(j) );
      
      imshow(imread(strcat(basepath,i,'.jpg')));
       
    end
end
axes(handles.axes1);
setappdata(0,'rsv',rs);
setappdata(0,'f',flag);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles) %saveall
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I=getimage(handles.axes2);
if(isempty(I))
    msgbox('No results to save!');
else
saveas_confirm;
end

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles) %clear all
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.hAxes = [ handles.axes1,handles.axes2, handles.axes3, handles.axes4,handles.axes5,handles.axes6,handles.axes7,handles.axes8,handles.axes9, handles.axes10,handles.axes11,handles.axes12,handles.axes13,handles.axes14,handles.axes15,handles.axes16,handles.axes17,handles.axes18,handles.axes19,handles.axes20,handles.axes21];

for i=1:21
axesH = findobj(handles.hAxes(i), 'Type', 'image');
if ~isempty(axesH)
	delete(axesH);
end
end
set(handles.axes1,'visible','on','xtick',[],'ytick',[]);
set(handles.text2,'String','0.0 sec');
axes(handles.axes1);
