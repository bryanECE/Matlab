function varargout = MYGUI_Group17(varargin)
% MYGUI_GROUP17 M-file for MYGUI_Group17.fig
%      MYGUI_GROUP17, by itself, creates a new MYGUI_GROUP17 or raises the existing
%      singleton*.
%
%      H = MYGUI_GROUP17 returns the handle to a new MYGUI_GROUP17 or the handle to
%      the existing singleton*.
%
%      MYGUI_GROUP17('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MYGUI_GROUP17.M with the given input arguments.
%
%      MYGUI_GROUP17('Property','Value',...) creates a new MYGUI_GROUP17 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MYGUI_Group17_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MYGUI_Group17_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MYGUI_Group17

% Last Modified by GUIDE v2.5 11-Oct-2016 08:44:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MYGUI_Group17_OpeningFcn, ...
                   'gui_OutputFcn',  @MYGUI_Group17_OutputFcn, ...
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


% --- Executes just before MYGUI_Group17 is made visible.
function MYGUI_Group17_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MYGUI_Group17 (see VARARGIN)

% Choose default command line output for MYGUI_Group17
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MYGUI_Group17 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MYGUI_Group17_OutputFcn(hObject, eventdata, handles) 
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


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


