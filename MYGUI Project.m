function varargout = MYGUI_BRIZO(varargin)
% MYGUI_BRIZO MATLAB code for MYGUI_BRIZO.fig
%      MYGUI_BRIZO, by itself, creates a new MYGUI_BRIZO or raises the existing
%      singleton*.
%
%      H = MYGUI_BRIZO returns the handle to a new MYGUI_BRIZO or the handle to
%      the existing singleton*.
%
%      MYGUI_BRIZO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MYGUI_BRIZO.M with the given input arguments.
%
%      MYGUI_BRIZO('Property','Value',...) creates a new MYGUI_BRIZO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MYGUI_BRIZO_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MYGUI_BRIZO_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MYGUI_BRIZO

% Last Modified by GUIDE v2.5 12-Sep-2016 14:57:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MYGUI_BRIZO_OpeningFcn, ...
                   'gui_OutputFcn',  @MYGUI_BRIZO_OutputFcn, ...
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


% --- Executes just before MYGUI_BRIZO is made visible.
function MYGUI_BRIZO_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MYGUI_BRIZO (see VARARGIN)

% Choose default command line output for MYGUI_BRIZO
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MYGUI_BRIZO wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MYGUI_BRIZO_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


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
