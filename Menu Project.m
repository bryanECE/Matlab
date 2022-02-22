function varargout = Menu(varargin)
% MENU MATLAB code for Menu.fig
%      MENU, by itself, creates a new MENU or raises the existing
%      singleton*.
%
%      H = MENU returns the handle to a new MENU or the handle to
%      the existing singleton*.
%
%      MENU('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MENU.M with the given input arguments.
%
%      MENU('Property','Value',...) creates a new MENU or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Menu_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Menu_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Menu

% Last Modified by GUIDE v2.5 25-Feb-2018 15:56:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Menu_OpeningFcn, ...
                   'gui_OutputFcn',  @Menu_OutputFcn, ...
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


% --- Executes just before Menu is made visible.
function Menu_OpeningFcn(hObject, eventdata, handles, varargin)
clc
%Load Images
    axes(handles.axes2);
    matlabImage = imread('background.png');
    image(matlabImage);
    axis off;
    axis image;

    axes(handles.axes11);
    matlabImage = imread('wait.png');
    im = image(matlabImage);
    im.AlphaData = max(matlabImage,[],3);
    axis off;
    axis image;

    axes(handles.axes12);
    matlabImage = imread('done.png');
    im = image(matlabImage);
    im.AlphaData = max(matlabImage,[],3);
    axis off;
    axis image;
    
%Create global variables
    filterType = get(handles.FilterType, 'Value');
    filtb = 0;
    filta = 1;
    filterResponse = get(handles.FilterResponse, 'Value');
    plotFunction = 'PlotSignalTime_Callback';
    plotFilter = 'FrequencyResponse_Callback';    
    [signal, sampleRate] = audioread(get(handles.FileDirectory ,'string'));
    audio = audioplayer(signal, sampleRate);
    fModel = 1;
    listPos = 1;
    list = 0;
    bda = 'Passband';
    bdb = 'Stopband';
    signalMod = 0;
    
    handles.signalMod = signalMod;
    handles.bda = bda;
    handles.bdb = bdb;
    handles.listPos = listPos;
    handles.list = list;
    handles.fModel = fModel;
    handles.filtb = filtb;
    handles.filta = filta;
    handles.audio = audio;
    handles.filterType = filterType;
    handles.filterResponse = filterResponse;
    handles.signal = signal;
    handles.sampleRate = sampleRate;
    handles.plotFunction = plotFunction;
    handles.plotFilter = plotFilter;

   
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Menu (see VARARGIN)

% Choose default command line output for Menu
handles.output = hObject;

% Update handles structure
 guidata(hObject, handles);
Menu('SetDir_Callback',hObject,eventdata,guidata(hObject));
Menu('Listfrequencies_Callback',hObject,eventdata,guidata(hObject));
    
% UIWAIT makes Menu wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Menu_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes on button press in PlayFiltered.
function PlayFiltered_Callback(hObject, eventdata, handles)
% hObject    handle to PlayFiltered (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.PlayFiltered, 'Enable','off');
set(handles.PlayOriginal, 'Enable','off');
set(handles.StopPlaying, 'Enable','on');
set(handles.SetDir, 'Enable','off');
set(handles.AcceptResponse, 'Enable','off');

playblocking(handles.audioFil);
set(handles.SetDir, 'Enable','on');
set(handles.AcceptResponse, 'Enable','on');
set(handles.PlayOriginal, 'Enable','on');
set(handles.StopPlaying, 'Enable','off');
set(handles.PlayFiltered, 'Enable','on');

% --- Executes on button press in StopPlaying.
function StopPlaying_Callback(hObject, eventdata, handles)
stop(handles.audio);
stop(handles.audioFil);
handles.playStop = true;
set(handles.SetDir, 'Enable','on');
set(handles.AcceptResponse, 'Enable','on');
set(handles.PlayOriginal, 'Enable','on');
set(handles.StopPlaying, 'Enable','off');
set(handles.PlayFiltered, 'Enable','on');

% hObject    handle to StopPlaying (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in PlayOriginal.
function PlayOriginal_Callback(hObject, eventdata, handles)
set(handles.PlayFiltered, 'Enable','off');
set(handles.PlayOriginal, 'Enable','off');
set(handles.StopPlaying, 'Enable','on');
set(handles.SetDir, 'Enable','off');

playblocking(handles.audio);
set(handles.SetDir, 'Enable','on');
set(handles.AcceptResponse, 'Enable','on');
set(handles.PlayOriginal, 'Enable','on');
set(handles.StopPlaying, 'Enable','off');
set(handles.PlayFiltered, 'Enable','on');
% hObject    handle to PlayOriginal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in FrequencyResponse.
function FrequencyResponse_Callback(hObject, eventdata, handles)
% hObject    handle to FrequencyResponse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.plotFilter = 'FrequencyResponse_Callback';
fs = str2num(get(handles.SampleFrequency, 'String'));
set(handles.statusPanel, 'Visible','off');
pause(0.001);
if(handles.filterResponse == 2)
    [h,w] = freqz(handles.filtb,handles.filta, 512);
else
    [h,w] = freqz(handles.filter);
end
axes(handles.axes10);
plot((w*(fs/(2*pi))),20*log10(abs(h)));
xlim([0 20000]);
ylabel('Magnitude (dB)');
xlabel('Hertz (Hz)');
set(handles.statusPanel, 'Visible','on');
title('Frequency Response of Filter');
guidata(hObject, handles);

% --- Executes on button press in PZmap.
function PZmap_Callback(hObject, eventdata, handles)
% hObject    handle to PZmap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.plotFilter = 'PZmap_Callback';
set(handles.statusPanel, 'Visible','off');
pause(0.001);
axes(handles.axes10);
if(handles.filterResponse == 2)
    zplane(handles.filtb, handles.filta);
else
    zplane(handles.filter);
end
title('Pole-Zero Map of Filter');
set(handles.statusPanel, 'Visible','on');
guidata(hObject, handles);

% --- Executes on button press in ImpulseResponse.
function ImpulseResponse_Callback(hObject, eventdata, handles)
% hObject    handle to ImpulseResponse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.plotFilter = 'ImpulseResponse_Callback';
set(handles.statusPanel, 'Visible','off');
pause(0.001);
axes(handles.axes10);
if(handles.filterResponse == 2)
    [h,t] = impz(handles.filtb,handles.filta);
else
    [h,t] = impz(handles.filter);
end

stem(h);
title('Impulse Response of Filter');
ylabel('Amplitude');
xlabel('Order (n)');
set(handles.statusPanel, 'Visible','on');
guidata(hObject, handles);
% --- Executes on button press in PlotSignalTime.

function PlotSignalTime_Callback(hObject, ~, handles)
% hObject    handle to PlotSignalTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.statusPanel, 'Visible','off');
pause(0.001);
axes(handles.axes1);
plot((0:length(handles.signal)-1)/(handles.sampleRate),handles.signal);
hold on;
plot((0:length(handles.signal)-1)/(handles.sampleRate),handles.signalMod);
hold off;
legend('Signal(Mono)','Filtered');
ylim([-1.5 1.5]);
ylabel('Amplitude');
xlabel('Time (s)');
title('Time Domain Response for Signal');
handles.plotFunction = 'PlotSignalTime_Callback';
set(handles.statusPanel, 'Visible','on');
guidata(hObject, handles);

% --- Executes on button press in PlotSignalFrequency.
function PlotSignalFrequency_Callback(hObject, eventdata, handles)
% hObject    handle to PlotSignalFrequency (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.statusPanel, 'Visible','off')
pause(0.001);
axes(handles.axes1);
L = length(handles.signal);
freqtwice = abs(fft(handles.signal)/L);
filtft = abs(fft(handles.signalMod)/L);
filtf = filtft(1:L/2+1);
filtf(2:end-1)= 2*filtf(2:end-1);
freq = freqtwice(1:L/2+1);
freq(2:end-1)= 2*freq(2:end-1);
fs = handles.sampleRate;
f = (fs)*(0:(L/2))/L;
plot(f,freq);
hold on;
plot(f,filtf);
hold off;
xlim([0 20000]);
ylim([0 0.03]);
ylabel('Amplitude');
xlabel('Frequency (Hz)');
title('Frequency Spectrum Response for Signal');
legend('Signal(Mono)','Filtered');
handles.plotFunction = 'PlotSignalFrequency_Callback';
guidata(hObject, handles);
set(handles.statusPanel, 'Visible','on');


% --- Executes on button press in SetDir.
function SetDir_Callback(hObject, eventdata, handles)
set(handles.statusPanel, 'Visible','off')
pause(0.001);
[signal, sampleRate] = audioread(get(handles.FileDirectory ,'string'));
signal =  sum(signal, 2) / size(signal, 2);
audio = audioplayer(signal, sampleRate);
handles.audio = audio;
handles.signal = signal;
handles.sampleRate = sampleRate;
guidata(hObject,handles);
set(handles.PlayOriginal, 'Enable','on')
if isfield(handles,'filename')
    set(handles.dirDisplay, 'string', strcat('Loaded File:',handles.filename));
else
    set(handles.dirDisplay, 'string', strcat('Loaded File:',get(handles.FileDirectory,'string')));

end

set(handles.statusPanel, 'Visible','on');
Menu('AcceptResponse_Callback',hObject,eventdata,guidata(hObject));
Menu(handles.plotFunction,hObject,eventdata,guidata(hObject));

% hObject    handle to SetDir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function FileDirectory_Callback(hObject, eventdata, handles)
% hObject    handle to FileDirectory (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FileDirectory as text
%        str2double(get(hObject,'String')) returns contents of FileDirectory as a double


% --- Executes during object creation, after setting all properties.
function FileDirectory_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FileDirectory (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Browse.
function Browse_Callback(hObject, eventdata, handles)
[filename,pathname] = uigetfile({'*.mp3;*.ogg;*.wav'},'File Selector');
set(handles.FileDirectory, 'string', strcat(pathname,filename));
handles.filename = filename;
guidata(hObject,handles);
% hObject    handle to Browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in FilterResponse.
function FilterResponse_Callback(hObject, eventdata, handles)
% hObject    handle to FilterResponse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.filterResponse = get(handles.FilterResponse, 'Value');
switch handles.filterResponse
    case 1
        set(handles.ResponseName,'Title', 'Finite Impulse Response');
        % These are switched on
        set(handles.FilterType,'Visible', 'on');
        set(handles.Ordertext,'Visible', 'on');
        set(handles.Order,'Visible', 'on');
        set(handles.Fc1text,'Visible', 'on');
        set(handles.Fc1text,'String', 'Cut-off Frequency 1 (f1):');
        set(handles.Fc1,'Visible', 'on');
        set(handles.Fc2text,'String', 'Cut-off Frequency 2 (f2):');
    
        % These are switched off
        set(handles.Fs1,'Visible', 'off');
        set(handles.Fs1text,'Visible', 'off');
        set(handles.Rp,'Visible', 'off');
        set(handles.Rptext,'Visible', 'off');
        set(handles.Rs,'Visible', 'off');
        set(handles.Rstext,'Visible', 'off');
        set(handles.IIRtype, 'Visible','off');
        set(handles.IIRtypetext, 'Visible','off');
        set(handles.ToggleFirst,'Visible', 'off');
        set(handles.Listtext,'Visible', 'off');
        set(handles.Listfrequencies,'Visible', 'off');
        set(handles.Bandtext,'Visible', 'off');
        set(handles.Band,'Visible', 'off');
        set(handles.Bandlist,'Visible', 'off');
        set(handles.Removelist,'Visible', 'off');
    
    case 2
        set(handles.ResponseName,'Title', 'Infinite Impulse Response')
        % These are switched on  
        set(handles.FilterType,'Visible', 'on');
        set(handles.Fc1text,'Visible', 'on');
        set(handles.Fc1text,'String', 'Passband Frequency 1 (f1):');
        set(handles.Fc1,'Visible', 'on');
        set(handles.Fc2text,'String', 'Passband Frequency 2 (f2):');
        set(handles.Fs1,'Visible', 'on');
        set(handles.Fs1text,'Visible', 'on');
        set(handles.Rp,'Visible', 'on');
        set(handles.Rptext,'Visible', 'on');
        set(handles.Rs,'Visible', 'on');
        set(handles.Rstext,'Visible', 'on');
        set(handles.IIRtype, 'Visible','on');
        set(handles.IIRtypetext, 'Visible','on');
        
        % These are switched off
        set(handles.Ordertext,'Visible', 'off');
        set(handles.Order,'Visible', 'off');
        set(handles.ToggleFirst,'Visible', 'off');
        set(handles.Listtext,'Visible', 'off');
        set(handles.Listfrequencies,'Visible', 'off');
        set(handles.Bandtext,'Visible', 'off');
        set(handles.Band,'Visible', 'off');
        set(handles.Bandlist,'Visible', 'off');
        set(handles.Removelist,'Visible', 'off');
    
    
    case 3   
        set(handles.ResponseName,'Title', 'Multiple Bandpass Filter')
        % These are switched on  
        set(handles.ToggleFirst,'Visible', 'on');
        set(handles.Ordertext,'Visible', 'on');
        set(handles.Order,'Visible', 'on');
        set(handles.Listtext,'Visible', 'on');
        set(handles.Listfrequencies,'Visible', 'on');
        set(handles.Bandtext,'Visible', 'on');
        set(handles.Band,'Visible', 'on');
        set(handles.Bandlist,'Visible', 'on');
        set(handles.Removelist,'Visible', 'on');
        
        % These are switched off
        set(handles.Fc1text,'Visible', 'off');
        set(handles.Fc1,'Visible', 'off');
        set(handles.FilterType,'Visible', 'off');
        set(handles.Fs1,'Visible', 'off');
        set(handles.Fs1text,'Visible', 'off');
        set(handles.Rp,'Visible', 'off');
        set(handles.Rptext,'Visible', 'off');
        set(handles.Rs,'Visible', 'off');
        set(handles.Rstext,'Visible', 'off');
        set(handles.IIRtype, 'Visible','off');
        set(handles.IIRtypetext, 'Visible','off');
    otherwise
        
end
Menu('FilterType_Callback',hObject,eventdata,guidata(hObject));
guidata(hObject,handles);
% Hints: contents = cellstr(get(hObject,'String')) returns FilterResponse contents as cell array
%        contents{get(hObject,'Value')} returns selected item from FilterResponse


% --- Executes during objploect creation, after setting all properties.
function FilterResponse_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FilterResponse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on selection change in FilterType.
function FilterType_Callback(hObject, eventdata, handles)
type = get(handles.FilterType, 'Value');
if get(handles.FilterResponse, 'Value') ~= 3
    switch type
        case {1,2}
            set(handles.Fc2, 'Visible', 'off');
            set(handles.Fc2text, 'Visible', 'off');
            set(handles.Fs2, 'Visible', 'off');
            set(handles.Fs2text, 'Visible', 'off');
        case {3,4}
            set(handles.Fc2, 'Visible', 'on');
            set(handles.Fc2text, 'Visible', 'on');
            if get(handles.FilterResponse, 'Value') == 2
                set(handles.Fs2, 'Visible', 'on');
                set(handles.Fs2text, 'Visible', 'on');
            else
                set(handles.Fs2, 'Visible', 'off');
                set(handles.Fs2text, 'Visible', 'off');
            end
        otherwise
    end
    
else
    set(handles.Fc2, 'Visible', 'off');
    set(handles.Fc2text, 'Visible', 'off');
    set(handles.Fs2, 'Visible', 'off');
    set(handles.Fs2text, 'Visible', 'off');
end
% hObject    handle to FilterType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns FilterType contents as cell array
%        contents{get(hObject,'Value')} returns selected item from FilterType


% --- Executes during object creation, after setting all properties.
function FilterType_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FilterType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Order_Callback(hObject, eventdata, handles)
% hObject    handle to Order (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Order as text
%        str2double(get(hObject,'String')) returns contents of Order as a double


% --- Executes during object creation, after setting all properties.
function Order_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Order (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SamplingFrequency_Callback(hObject, eventdata, handles)
% hObject    handle to SamplingFrequency (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SamplingFrequency as text
%        str2double(get(hObject,'String')) returns contents of SamplingFrequency as a double


% --- Executes during object creation, after setting all properties.
function SamplingFrequency_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SamplingFrequency (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Fc1_Callback(hObject, eventdata, handles)
% hObject    handle to Fc1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Fc1 as text
%        str2double(get(hObject,'String')) returns contents of Fc1 as a double


% --- Executes during object creation, after setting all properties.
function Fc1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Fc1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Fc2_Callback(hObject, eventdata, handles)
% hObject    handle to Fc2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Fc2 as text
%        str2double(get(hObject,'String')) returns contents of Fc2 as a double


% --- Executes during object creation, after setting all properties.
function Fc2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Fc2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.


% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2




function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to Order (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Order as text
%        str2double(get(hObject,'String')) returns contents of Order as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Order (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SampleFrequency_Callback(hObject, eventdata, handles)
% hObject    handle to SampleFrequency (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SampleFrequency as text
%        str2double(get(hObject,'String')) returns contents of SampleFrequency as a double


% --- Executes during object creation, after setting all properties.
function SampleFrequency_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SampleFrequency (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to Fc1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Fc1 as text
%        str2double(get(hObject,'String')) returns contents of Fc1 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Fc1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to Fc2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Fc2 as text
%        str2double(get(hObject,'String')) returns contents of Fc2 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Fc2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in AcceptResponse.
function AcceptResponse_Callback(hObject, eventdata, handles)
Menu('Listfrequencies_Callback',hObject,eventdata,handles)
handles.filterType = get(handles.FilterType, 'Value');
n = str2num(get(handles.Order, 'String'));
fs = str2num(get(handles.SampleFrequency, 'String'));
fc1 = str2num(get(handles.Fc1, 'String'));
fs1 = str2num(get(handles.Fs1, 'String'));
rp = str2num(get(handles.Rp, 'String'));
rs = str2num(get(handles.Rs, 'String'));
fm = handles.list(1:length(handles.list)-1);
fm = fm.';

set(handles.statusPanel, 'Visible','off');
switch handles.filterResponse
    case 1 % Finite Impulse Response
        switch handles.filterType
            case 1
                flr = fir1(n,fc1/(fs/2),'low');
            case 2
                flr = fir1(n,fc1/(fs/2),'high');
            case 3
                fc2 = str2num(get(handles.Fc2, 'String'));
                flr = fir1(n,[(fc1/(fs/2)) (fc2/(fs/2))],'bandpass');
            case 4
                 fc2 = str2num(get(handles.Fc2, 'String'));
                flr = fir1(n,[(fc1/(fs/2)) (fc2/(fs/2))],'stop');
            otherwise
        end   
    case 2 % Infinite Impulse Response
        switch handles.fModel
            case 1 % Butterworth
                switch handles.filterType
                    case 1 %low pass
                        [N, Wn] = buttord(fc1/(fs/2),fs1/(fs/2),rp,rs);
                        [b,a] = butter(N,Wn,'low');
                        
                    case 2
                        [N, Wn] = buttord(fc1/(fs/2),fs1/(fs/2),rp,rs);
                        [b,a] = butter(N,Wn,'high');
                    case 3
                         fc2 = str2num(get(handles.Fc2, 'String'));
                         fs2 = str2num(get(handles.Fs2, 'String'));
                         [N, Wn] = buttord([fc1/(fs/2) fc2/(fs/2)],[fs1/(fs/2) fs2/(fs/2)],rp,rs);
                         [b,a] = butter(N,Wn,'bandpass');
                    case 4
                         fc2 = str2num(get(handles.Fc2, 'String'));
                         fs2 = str2num(get(handles.Fs2, 'String'));
                         [N, Wn] = buttord([fc1/(fs/2) fc2/(fs/2)],[fs1/(fs/2) fs2/(fs/2)],rp,rs);
                         [b,a] = butter(N,Wn,'stop');
                    otherwise
                end
            case 2  % Cheby1
                switch handles.filterType
                    case 1 %low pass
                        [N, Wn] = cheb1ord(fc1/(fs/2),fs1/(fs/2),rp,rs);
                        [b,a] = cheby1(N,rp,Wn,'low');
                        
                    case 2
                        [N, Wn] = cheb1ord(fc1/(fs/2),fs1/(fs/2),rp,rs);
                        [b,a] = cheby1(N,rp,Wn,'high');
                    case 3
                         fc2 = str2num(get(handles.Fc2, 'String'));
                         fs2 = str2num(get(handles.Fs2, 'String'));
                         [N, Wn] = cheb1ord([fc1/(fs/2) fc2/(fs/2)],[fs1/(fs/2) fs2/(fs/2)],rp,rs);
                         [b,a] = cheby1(N,rp,Wn,'bandpass');
                    case 4
                         fc2 = str2num(get(handles.Fc2, 'String'));
                         fs2 = str2num(get(handles.Fs2, 'String'));
                         [N, Wn] = cheb1ord([fc1/(fs/2) fc2/(fs/2)],[fs1/(fs/2) fs2/(fs/2)],rp,rs);
                         [b,a] = cheby1(N,rp,Wn,'stop');
                    otherwise
                end
            case 3 %Cheby2
                switch handles.filterType
                    case 1 %low pass
                        [N, Wn] = cheb2ord(fc1/(fs/2),fs1/(fs/2),rp,rs);
                        [b,a] = cheby2(N,rs,Wn,'low');
                        
                    case 2
                        [N, Wn] = cheb2ord(fc1/(fs/2),fs1/(fs/2),rp,rs);
                        [b,a] = cheby2(N,rs,Wn,'high');
                    case 3
                         fc2 = str2num(get(handles.Fc2, 'String'));
                         fs2 = str2num(get(handles.Fs2, 'String'));
                         [N, Wn] = cheb2ord([fc1/(fs/2) fc2/(fs/2)],[fs1/(fs/2) fs2/(fs/2)],rp,rs);
                         [b,a] = cheby2(N,rs,Wn,'bandpass');
                    case 4
                         fc2 = str2num(get(handles.Fc2, 'String'));
                         fs2 = str2num(get(handles.Fs2, 'String'));
                         [N, Wn] = cheb2ord([fc1/(fs/2) fc2/(fs/2)],[fs1/(fs/2) fs2/(fs/2)],rp,rs);
                         [b,a] = cheby2(N,rs,Wn,'stop');
                    otherwise
                end
            case 4 %ellip
                switch handles.filterType
                    case 1 %low pass
                        [N, Wn] = ellipord(fc1/(fs/2),fs1/(fs/2),rp,rs);
                        [b,a] = ellip(N,rp,rs,Wn,'low');
                        
                    case 2
                        [N, Wn] = ellipord(fc1/(fs/2),fs1/(fs/2),rp,rs);
                        [b,a] = ellip(N,rp,rs,Wn,'high');
                    case 3
                         fc2 = str2num(get(handles.Fc2, 'String'));
                         fs2 = str2num(get(handles.Fs2, 'String'));
                         [N, Wn] = ellipord([fc1/(fs/2) fc2/(fs/2)],[fs1/(fs/2) fs2/(fs/2)],rp,rs);
                         [b,a] = ellip(N,rp,rs,Wn,'bandpass');
                    case 4
                         fc2 = str2num(get(handles.Fc2, 'String'));
                         fs2 = str2num(get(handles.Fs2, 'String'));
                         [N, Wn] = ellipord([fc1/(fs/2) fc2/(fs/2)],[fs1/(fs/2) fs2/(fs/2)],rp,rs);
                         [b,a] = ellip(N,rp,rs,Wn,'stop');
                    otherwise
                end
            otherwise
        end
    case 3 %MultibandResponse
        if handles.bda == 'Passband'
            flr = fir1(n,fm/(fs/2),'DC-0');
        else
            flr = fir1(n,fm/(fs/2),'DC-1');
        end
    otherwise
end
if(handles.filterResponse == 2)
    handles.signalMod = filter(b,a,handles.signal);
    handles.filtb = b;
    handles.filta = a;
end
if(handles.filterResponse == 1 ||handles.filterResponse == 3)
    handles.signalMod = filter(flr,1,handles.signal);
    handles.filter = flr;
end


set(handles.PlayFiltered,'Enable','on');
pause(0.001);

handles.signalMod = handles.signalMod;
audioFil = audioplayer(handles.signalMod, handles.sampleRate);
handles.audioFil = audioFil;
guidata(hObject,handles);
Menu(handles.plotFunction,hObject,eventdata,guidata(hObject));
Menu(handles.plotFilter,hObject,eventdata,guidata(hObject));
set(handles.statusPanel, 'Visible','on');






function Rp_Callback(hObject, eventdata, handles)
% hObject    handle to Rp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rp as text
%        str2double(get(hObject,'String')) returns contents of Rp as a double


% --- Executes during object creation, after setting all properties.
function Rp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rs_Callback(hObject, eventdata, handles)
% hObject    handle to Rs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rs as text
%        str2double(get(hObject,'String')) returns contents of Rs as a double


% --- Executes during object creation, after setting all properties.
function Rs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Fs1_Callback(hObject, eventdata, handles)
% hObject    handle to Fs1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Fs1 as text
%        str2double(get(hObject,'String')) returns contents of Fs1 as a double


% --- Executes during object creation, after setting all properties.
function Fs1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Fs1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Fs2_Callback(hObject, eventdata, handles)
% hObject    handle to Fs2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Fs2 as text
%        str2double(get(hObject,'String')) returns contents of Fs2 as a double


% --- Executes during object creation, after setting all properties.
function Fs2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Fs2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
if (isplaying(handles.audio) || isplaying(handles.audioFil))
    Menu('StopPlaying_Callback',hObject,eventdata,guidata(hObject));
else
    delete(hObject);
end


% --- Executes on selection change in IIRtype.
function IIRtype_Callback(hObject, eventdata, handles)
handles.fModel = get(handles.IIRtype, 'Value');
guidata(hObject, handles);
% hObject    handle to IIRtype (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns IIRtype contents as cell array
%        contents{get(hObject,'Value')} returns selected item from IIRtype


% --- Executes during object creation, after setting all properties.
function IIRtype_CreateFcn(hObject, eventdata, handles)
% hObject    handle to IIRtype (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Bandlist.
function Bandlist_Callback(hObject, eventdata, handles)
handles.listPos = get(handles.Listfrequencies, 'Value');
handles.list = str2double(get(handles.Listfrequencies, 'String'));
freqInput = str2double(get(handles.Band, 'String'));
term = false;
for k =1:1:length(handles.list)
    if freqInput == handles.list(k)
        term = true;
    end
end
if (~term)
    if(handles.listPos == length(handles.list))
        handles.list = [handles.list;freqInput];
    else
        handles.list(handles.listPos) = (freqInput);
    end
    handles.list = sort(handles.list);
    finallist = num2str(handles.list);
    finallist = handles.list(1:length(handles.list)-1);
    finallist = [finallist;cellstr('New')];
    set(handles.Listfrequencies,'String',finallist);
end
guidata(hObject, handles);
Menu('Listfrequencies_Callback',hObject,eventdata,handles)
% hObject    handle to Bandlist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function Band_Callback(hObject, eventdata, handles)

% hObject    handle to Band (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Band as text
%        str2double(get(hObject,'String')) returns contents of Band as a double


% --- Executes during object creation, after setting all properties.
function Band_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Band (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Removelist.

function Removelist_Callback(hObject, eventdata, handles)
handles.listPos = get(handles.Listfrequencies, 'Value');
handles.list = str2double(get(handles.Listfrequencies, 'String'));
handles.list = [handles.list(1:handles.listPos-1);handles.list(handles.listPos+1:length(handles.list)-1)];
handles.list = num2str(handles.list);
handles.list = [handles.list;cellstr('New')];
set(handles.Listfrequencies,'String',handles.list);
guidata(hObject,handles);
Menu('Listfrequencies_Callback',hObject,eventdata,handles);


% hObject    handle to Removelist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in Listfrequencies.
function Listfrequencies_Callback(hObject, eventdata, handles)
handles.listPos = get(handles.Listfrequencies, 'Value');
handles.list = str2double(get(handles.Listfrequencies, 'String'));
if(get(handles.LowFirst,'Value') == 1)
    handles.bda = 'Passband';
    handles.bdb = 'Stopband';
else
    handles.bda = 'Stopband';
    handles.bdb = 'Passband';
end
if(handles.listPos == length(handles.list))
    set(handles.Band, 'String', '');
else
    set(handles.Band, 'String', handles.list(handles.listPos));
end
if(mod(handles.listPos,2)==1) %if odd  
    set(handles.Bandtext,'String',sprintf('Set %s\nFrequency(Hz):',handles.bda));
else
    set(handles.Bandtext,'String',sprintf('Set %s\nFrequency(Hz):',handles.bdb));
end
guidata(hObject, handles);
% hObject    handle to Listfrequencies (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Listfrequencies contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Listfrequencies


% --- Executes during object creation, after setting all properties.
function Listfrequencies_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Listfrequencies (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in HighFirst.
function LowFirst_Callback(hObject, eventdata, handles)
% hObject    handle to HighFirst (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of HighFirst

% --- Executes on button press in HighFirst.
function HighFirst_Callback(hObject, eventdata, handles)

% hObject    handle to HighFirst (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of HighFirst


% --- Executes when selected object is changed in ToggleFirst.
function ToggleFirst_SelectionChangedFcn(hObject, eventdata, handles)
Menu('Listfrequencies_Callback',hObject,eventdata,handles);
% hObject    handle to the selected object in ToggleFirst 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
