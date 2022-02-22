function varargout = ECE121L_Project(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ECE121L_Project_OpeningFcn, ...
                   'gui_OutputFcn',  @ECE121L_Project_OutputFcn, ...
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


% --- Executes just before ECE121L_Project is made visible.
function ECE121L_Project_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ECE121L_Project (see VARARGIN)

% Choose default command line output for ECE121L_Project
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ECE121L_Project wait for user response (see UIRESUME)
% uiwait(handles.figure1);

set(handles.fir,'value',0)
set(handles.iir,'value',0)
set(handles.MBP,'value',0)
set(handles.MBP,'enable','off')
set(handles.fir,'enable','off')
set(handles.iir,'enable','off')
set(handles.plot1,'enable','off')
set(handles.plot1,'value',0)
set(handles.plot2,'enable','off')
set(handles.plot2,'value',0)
set(handles.plot3,'enable','off')
set(handles.plot3,'value',0)
set(handles.order,'enable','off')
set(handles.fs,'enable','on')
set(handles.fc1,'enable','off')
set(handles.fc2,'enable','off')
set(handles.fc3,'enable','off')
set(handles.fc4,'enable','off')
set(handles.editrp,'enable','off')
set(handles.editrs,'enable','off')
set(handles.popupmenu1,'enable','off')
set(handles.popupmenu2,'enable','off')
set(handles.popupmenu3,'enable','off')
set(handles.filter,'enable','off')
set(handles.play,'enable','on')
set(handles.plotbutton,'enable','off')
set(handles.datafilter,'enable','off')




% --- Outputs from this function are returned to the command line.
function varargout = ECE121L_Project_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (get(handles.popupmenu2,'value')==1) %initial state
    set(handles.order,'enable','off')
    set(handles.fc1,'enable','off')
    set(handles.fc2,'enable','off')
    set(handles.fc3,'enable','off')
    set(handles.fc4,'enable','off')
    set(handles.editrp,'enable','off')
    set(handles.editrs,'enable','off')
    set(handles.filter,'enable','on')
elseif (get(handles.popupmenu2,'value')==2)
    set(handles.editrp,'enable','on')
    set(handles.editrs,'enable','on')
elseif (get(handles.popupmenu2,'value')==3)
    set(handles.editrp,'enable','on')
    set(handles.editrs,'enable','on')
elseif (get(handles.popupmenu2,'value')==4)
    set(handles.editrp,'enable','on')
    set(handles.editrs,'enable','on')
elseif (get(handles.popupmenu2,'value')==5)
    set(handles.editrp,'enable','on')
    set(handles.editrs,'enable','on')
end
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (get(handles.popupmenu1,'value')==1) %initial state
    set(handles.order,'enable','off')
    set(handles.fc1,'enable','off')
    set(handles.fc2,'enable','off')
    set(handles.fc3,'enable','off')
    set(handles.fc4,'enable','off')
    set(handles.editrp,'enable','off')
    set(handles.editrs,'enable','off')
    set(handles.filter,'enable','on')    
elseif (get(handles.popupmenu1,'value')==2) %lowpass popup
    set(handles.order,'enable','on')
    set(handles.fc1,'enable','on')
    set(handles.fc2,'enable','off')
    set(handles.fc3,'enable','off')
    set(handles.fc4,'enable','off')
    set(handles.editrp,'enable','off')
    set(handles.editrs,'enable','off')
    set(handles.filter,'enable','on')
elseif (get(handles.popupmenu1,'value')==3) %highpass popup
    set(handles.order,'enable','on')
    set(handles.fc1,'enable','on')
    set(handles.fc2,'enable','off')
    set(handles.fc3,'enable','off')
    set(handles.fc4,'enable','off')
    set(handles.editrp,'enable','off')
    set(handles.editrs,'enable','off')
    set(handles.filter,'enable','on')
elseif (get(handles.popupmenu1,'value')==4) %bandpass popup
    set(handles.order,'enable','on')
    set(handles.fc1,'enable','on')
    set(handles.fc2,'enable','on')
    set(handles.fc3,'enable','off')
    set(handles.fc4,'enable','off')
    set(handles.editrp,'enable','off')
    set(handles.editrs,'enable','off')
    set(handles.filter,'enable','on')
elseif (get(handles.popupmenu1,'value')==5) %bandstop popup
    set(handles.order,'enable','on')
    set(handles.fc1,'enable','on')
    set(handles.fc2,'enable','on')
    set(handles.fc3,'enable','off')
    set(handles.fc4,'enable','off')
    set(handles.editrp,'enable','off')
    set(handles.editrs,'enable','off')
    set(handles.filter,'enable','on')
end
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


% --- Executes on button press in fir.
function fir_Callback(hObject, eventdata, handles)
% hObject    handle to fir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(get(handles.fir,'value')==1)
    set(handles.iir,'Value',0)
    set(handles.MBP,'Value',0)
    set(handles.popupmenu3,'enable','off')
    set(handles.popupmenu2,'enable','off')
    set(handles.popupmenu1,'enable','on')
    set(handles.filter,'enable','on')
end
set(handles.editrp,'enable','off')
set(handles.editrp,'enable','off')
% Hint: get(hObject,'Value') returns toggle state of fir


% --- Executes on button press in iir.
function iir_Callback(hObject, eventdata, handles)
% hObject    handle to iir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if(get(handles.iir,'value')==1)
    set(handles.fir,'value',0)
    set(handles.MBP,'value',0)
    set(handles.popupmenu1,'enable','on')
    set(handles.popupmenu2,'enable','on')
    set(handles.popupmenu3,'enable','off')
    set(handles.editrp,'enable','on')
    set(handles.editrs,'enable','on')
    set(handles.filter,'enable','on')
end
% Hint: get(hObject,'Value') returns toggle state of iir


% --- Executes on button press in record.
function record_Callback(~, eventdata, handles)
% hObject    handle to record (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%record a voice signal
global y Fs 
t = get(handles.time,'String');
t= str2double(t);
Fs = get(handles.fs,'String');
Fs = str2double(Fs);
h = waitbar(0,'Recording Voice Data');
y = wavrecord(t*Fs,Fs,'double');
close(h)
h = waitbar(1,'Record Complete');
[filename pathname]=uiputfile('recorded_sound.wav', 'Choose a name to save recorded sound');
wavwrite(y ,Fs, [pathname,filename]);
pause(1)
close(h)

set(handles.play,'enable','on')
set(handles.fir,'enable','on')
set(handles.iir,'enable','on')


% --- Executes on button press in play.
function play_Callback(hObject, eventdata, handles)
% hObject    handle to play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Play the recorded voice signal
global Fs y
wavplay(y,Fs)
Y = fft(y,512);
w = (0:255)/256*(Fs/2);
plot(handles.axes3,w,abs([Y(1:256)']),'green')

plot(handles.axes6,y)
set(handles.axes3,'XGrid','on','YGrid','on')
set(handles.axes6,'XGrid','on','YGrid','on')
set(gca,'Layer','top')
set(handles.fir,'enable','on')
set(handles.iir,'enable','on')
set(handles.MBP,'enable','on')
set(handles.plot1,'value',0)
set(handles.plot2,'value',0)
set(handles.plot3,'value',0)

% --- Executes on button press in filter.
function filter_Callback(hObject, eventdata, handles)
% hObject    handle to filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Filter the voice signal using FIR and IIR 
global y b a f Filtered Fs filtered f1
n = str2double(get(handles.order,'string'));
Fs = str2double(get(handles.fs,'string'));
if (get(handles.fir,'value')==1)  %FIR filter
    if (get(handles.popupmenu1,'value')==2) %lowpass
     f1 = str2double(get(handles.fc1,'string'));
     Wn = f1/(Fs*2);
     f = fir1(n,Wn,'low');
          
    elseif (get(handles.popupmenu1,'value')==3) %highpass
     f1 = str2double(get(handles.fc1,'string'));
     Wn = f1/(Fs*2);
     f = fir1(n,Wn,'high');
    elseif (get(handles.popupmenu1,'value')==4) %bandpass
     f1 = str2double(get(handles.fc1,'string'));
     f2 = str2double(get(handles.fc2,'string'));
     Wn = [f1/(Fs*2) f2/(Fs*2)];
     f = fir1(n,Wn,'bandpass');
     
    elseif (get(handles.popupmenu1,'value')==5) %bandstop
     f1 = str2double(get(handles.fc1,'string'));
     f2 = str2double(get(handles.fc2,'string'));
     Wn = [f1/(Fs*2) f2/(Fs*2)];
     f = fir1(n,Wn,'stop');
    end

Filtered = filtfilt(f,1,y); 
plot(handles.axes7,Filtered)

filtered = fft(Filtered,512);
w = (0:255)/256*(Fs/2);
plot(handles.axes4,w,abs([filtered(1:256)']),'green')

set(handles.axes7,'XGrid','on','YGrid','on')
set(handles.axes4,'XGrid','on','YGrid','on')
set(gca,'Layer','top')
elseif (get(handles.iir,'value')==1) %IIR Filter
    if(get(handles.popupmenu2,'value')==2) %butterworth
        if (get(handles.popupmenu1,'value')==2) %lowpass
            f1 = str2double(get(handles.fc1,'string'));
            Rp = str2double(get(handles.editrp,'string'));
            Rs = str2double(get(handles.editrs,'string'));
            [n, Wn] = buttord(f1/(Fs/2),10000/(Fs/2),Rp,Rs);
            [b,a] = butter(n,Wn,'low');
        elseif (get(handles.popupmenu1,'value')==3) %highpass
            f1 = str2double(get(handles.fc1,'string'));
            Rp = str2double(get(handles.editrp,'string'));
            Rs = str2double(get(handles.editrs,'string'));
            [n, Wn] = buttord(f1/(Fs/2),10000/(Fs/2),Rp,Rs);
            [b,a] = butter(n,Wn,'high');
        elseif (get(handles.popupmenu1,'value')==4) %bandpass
            f1 = str2double(get(handles.fc1,'string'));
            f2 = str2double(get(handles.fc2,'string'));
            Rp = str2double(get(handles.editrp,'string'));
            Rs = str2double(get(handles.editrs,'string'));
            Wn = [(f1*2)/Fs (f2*2)/Fs];            
            [b,a] = butter(n,Wn,'bandpass');
        elseif (get(handles.popupmenu1,'value')==5) %bandstop
            f1 = str2double(get(handles.fc1,'string'));
            f2 = str2double(get(handles.fc2,'string'));
            Rp = str2double(get(handles.editrp,'string'));
            Rs = str2double(get(handles.editrs,'string'));
            Wn = [(f1*2)/Fs (f2*2)/Fs];            
            [b,a] = butter(n,Wn,'stop');
        end
        
    elseif (get(handles.popupmenu2,'value')==3) %Chebychev I
        if (get(handles.popupmenu1,'value')==2) %lowpass
            f1 = str2double(get(handles.fc1,'string'));
            Rp = str2double(get(handles.editrp,'string'));
            Rs = str2double(get(handles.editrs,'string'));
            [n, Wn] = cheb1ord(f1/(Fs/2),10000/(Fs/2),Rp,Rs);
            [b,a] = cheby1(n,Rp,Wn,'low');
        elseif (get(handles.popupmenu1,'value')==3) %highpass
            f1 = str2double(get(handles.fc1,'string'));
            Rp = str2double(get(handles.editrp,'string'));
            Rs = str2double(get(handles.editrs,'string'));
            [n, Wn] = cheb1ord(f1/(Fs/2),10000/(Fs/2),Rp,Rs);
            [b,a] = cheby1(n,Rp,Wn,'high');
        elseif (get(handles.popupmenu1,'value')==4) %bandpass
            f1 = str2double(get(handles.fc1,'string'));
            f2 = str2double(get(handles.fc2,'string'));
            Rp = str2double(get(handles.editrp,'string'));
            Rs = str2double(get(handles.editrs,'string'));
            Wn = [(f1*2)/Fs (f2*2)/Fs];            
            [b,a] = cheby1(n,Rp,Wn,'bandpass');
        elseif (get(handles.popupmenu1,'value')==5) %bandstop
            f1 = str2double(get(handles.fc1,'string'));
            f2 = str2double(get(handles.fc2,'string'));
            Rp = str2double(get(handles.editrp,'string'));
            Rs = str2double(get(handles.editrs,'string'));
            Wn = [(f1*2)/Fs (f2*2)/Fs];            
            [b,a] = cheby1(n,Rp,Wn,'stop');
        end
    elseif (get(handles.popupmenu2,'value')==4) %Chebychev II
        if (get(handles.popupmenu1,'value')==2) %lowpass
            f1 = str2double(get(handles.fc1,'string'));
            Rp = str2double(get(handles.editrp,'string'));
            Rs = str2double(get(handles.editrs,'string'));
            [n, Wn] = cheb2ord(f1/(Fs/2),10000/(Fs/2),Rp,Rs);
            [b,a] = cheby2(n,Rs,Wn,'low');
        elseif (get(handles.popupmenu1,'value')==3) %highpass
            f1 = str2double(get(handles.fc1,'string'));
            Rp = str2double(get(handles.editrp,'string'));
            Rs = str2double(get(handles.editrs,'string'));
            [n, Wn] = cheb2ord(f1/(Fs/2),10000/(Fs/2),Rp,Rs);
            [b,a] = cheby2(n,Rs,Wn,'high');
        elseif (get(handles.popupmenu1,'value')==4) %bandpass
            f1 = str2double(get(handles.fc1,'string'));
            f2 = str2double(get(handles.fc2,'string'));
            Rp = str2double(get(handles.editrp,'string'));
            Rs = str2double(get(handles.editrs,'string'));
            Wn = [(f1*2)/Fs (f2*2)/Fs];            
            [b,a] = cheby2(n,Rs,Wn,'bandpass');
        elseif (get(handles.popupmenu1,'value')==5) %bandstop
            f1 = str2double(get(handles.fc1,'string'));
            f2 = str2double(get(handles.fc2,'string'));
            Rp = str2double(get(handles.editrp,'string'));
            Rs = str2double(get(handles.editrs,'string'));
            Wn = [(f1*2)/Fs (f2*2)/Fs];            
            [b,a] = cheby2(n,Rs,Wn,'stop');
        end
    elseif (get(handles.popupmenu2,'value')==5) %Elliptic
        if (get(handles.popupmenu1,'value')==2) %lowpass
            f1 = str2double(get(handles.fc1,'string'));
            Rp = str2double(get(handles.editrp,'string'));
            Rs = str2double(get(handles.editrs,'string'));
            [n, Wn] = ellipord(f1/(Fs/2),10000/(Fs/2),Rp,Rs);
            [b,a] = ellip(n,Rp,Rs,Wn,'low')
        elseif (get(handles.popupmenu1,'value')==2) %highpass
            f1 = str2double(get(handles.fc1,'string'));
            Rp = str2double(get(handles.editrp,'string'));
            Rs = str2double(get(handles.editrs,'string'));
            [n, Wn] = ellipord(f1/(Fs/2),10000/(Fs/2),Rp,Rs);
            [b,a] = ellip(n,Rp,Rs,Wn,'high');
        elseif (get(handles.popupmenu1,'value')==4) %bandpass
            f1 = str2double(get(handles.fc1,'string'));
            f2 = str2double(get(handles.fc2,'string'));
            Rp = str2double(get(handles.editrp,'string'));
            Rs = str2double(get(handles.editrs,'string'));
            Wn = [(f1*2)/Fs (f2*2)/Fs];            
            [b,a] = ellip(n,Rp,Rs,Wn,'bandpass');
        elseif (get(handles.popupmenu1,'value')==5) %bandstop
            f1 = str2double(get(handles.fc1,'string'));
            f2 = str2double(get(handles.fc2,'string'));
            Rp = str2double(get(handles.editrp,'string'));
            Rs = str2double(get(handles.editrs,'string'));
            Wn = [(f1*2)/Fs (f2*2)/Fs];            
            [b,a] = ellip(n,Rp,Rs,Wn,'stop');
        end
    end
Filtered = filtfilt(b,a,y);
plot(handles.axes7,abs(Filtered))
filtered = fft(Filtered,512);
w = (0:255)/256*(Fs/2);
plot(handles.axes4,w,abs([filtered(1:256)']),'red')

set(handles.axes7,'XGrid','on','YGrid','on')
set(handles.axes4,'XGrid','on','YGrid','on')
set(gca,'Layer','top')

set(handles.plot1,'enable','on')
set(handles.plot2,'enable','on')
set(handles.plot3,'enable','on')
set(handles.filter,'enable','on')
set(handles.datafilter,'enable','on')
set(handles.plotbutton,'enable','on')
set(handles.plot2,'enable','on')
set(handles.plot3,'enable','on')
set(handles.plot1,'enable','on')

elseif (get(handles.MBP,'value')==1) %Multiple Bandpass Filter
    if(get(handles.popupmenu3,'value')==2) %multiple bandpass FIR
                f1 = str2double(get(handles.fc1,'string'));
                f2 = str2double(get(handles.fc2,'string'));
                f3 = str2double(get(handles.fc3,'string'));
                f4 = str2double(get(handles.fc4,'string'));
                Wn = [f1/(Fs*2) f2/(Fs*2) f3/(Fs*2) f4/(Fs*2)];
                f = fir1(n,Wn,'DC-1');
                Filtered = filtfilt(f,1,y); 
                plot(handles.axes7,Filtered)

                filtered = fft(Filtered,512);
                w = (0:255)/256*(Fs/2);
                plot(handles.axes4,w,abs([filtered(1:256)']),'red')

                set(handles.axes7,'XGrid','on','YGrid','on')
                set(handles.axes4,'XGrid','on','YGrid','on')
                set(gca,'Layer','top')
        elseif (get(handles.popupmenu3,'value')==3) %multiple bandpass Cheb 2
                f1 = str2double(get(handles.fc1,'string'));
                f2 = str2double(get(handles.fc2,'string'));
                Rs = str2double(get(handles.editrs,'string'));
                Wn = [f1/(Fs*2) f2/(Fs*2)];           
                [b,a] = cheby2(n,Rs,Wn);
                Filtered = filtfilt(b,a,y);
                plot(handles.axes7,abs(Filtered))
                filtered = fft(Filtered,512);
                w = (0:255)/256*(Fs/2);
                plot(handles.axes4,w,abs([filtered(1:256)']),'red')

                set(handles.axes7,'XGrid','on','YGrid','on')
                set(handles.axes4,'XGrid','on','YGrid','on')
                set(gca,'Layer','top')
    end
        

end
set(handles.plot1,'enable','on')
set(handles.plot2,'enable','on')
set(handles.plot3,'enable','on')
set(handles.filter,'enable','on')
set(handles.datafilter,'enable','on')
set(handles.plotbutton,'enable','on')
set(handles.plot2,'enable','on')
set(handles.plot3,'enable','on')
set(handles.plot1,'enable','on')


% --- Executes on button press in plot1.
function plot1_Callback(~, ~, ~)
% hObject    handle to plot1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of plot1


% --- Executes on button press in plot2.
function plot2_Callback(~, ~, ~)
% hObject    handle to plot2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of plot2


% --- Executes on button press in plot3.
function plot3_Callback(~, ~, ~)
% hObject    handle to plot3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of plot3


% --- Executes on button press in plotbutton.
function plotbutton_Callback(hObject, eventdata, handles)
% hObject    handle to plotbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%plot using freqz,impz, and zplane
global f a b X Y
if (get(handles.fir,'value')==1)
    Y=1;
    X=f;
elseif (get(handles.iir,'value')==1)
    Y=a;
    X=b;

end
if (get(handles.plot1,'value')==1)
    figure(1); freqz(X,Y)
    title('Frequency Response'); %plot the frequency response of the filtered data
    if (get(handles.popupmenu3,'value')==2) 
    Y=1;
    X=f;
    figure(1); freqz(X,Y)
    title('Frequency Response'); %plot the frequency response of the filtered data
    elseif(get(handles.popupmenu3,'value')==3)
    Y=a;
    X=b;
    figure(1); freqz(X,Y)
    title('Frequency Response'); %plot the frequency response of the filtered data
    end
    
elseif (get(handles.plot2,'value')==1)
    figure(1); zplane(X,Y)
    grid on
    title('Poles and Zeroes Plot'); %plot the poles and zeroes of the filtered data
    if (get(handles.popupmenu3,'value')==2) 
    Y=1;
    X=f;
    figure(1); zplane(X,Y)
    grid on
    title('Poles and Zeroes Plot'); %plot the poles and zeroes of the filtered data
    elseif(get(handles.popupmenu3,'value')==3)
    Y=a;
    X=b;
    figure(1); zplane(X,Y)
    grid on
    title('Poles and Zeroes Plot'); %plot the poles and zeroes of the filtered data
    end
      
elseif (get(handles.plot3,'value')==1)   
    figure(1); impz(X,Y)    
    grid on
    title('Impulse Respone') %plot the impulse response of the filtered data  
     if (get(handles.popupmenu3,'value')==2) 
    Y=1;
    X=f;
    figure(1); impz(X,Y)    
    grid on
    title('Impulse Respone') %plot the impulse response of the filtered data
    elseif(get(handles.popupmenu3,'value')==3)
    Y=a;
    X=b;
    figure(1); impz(X,Y)    
    grid on
    title('Impulse Respone') %plot the impulse response of the filtered data
    end
end
   


function order_Callback(hObject, eventdata, handles)
% hObject    handle to order (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of order as text
%        str2double(get(hObject,'String')) returns contents of order as a double


% --- Executes during object creation, after setting all properties.
function order_CreateFcn(hObject, eventdata, handles)
% hObject    handle to order (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function fs_Callback(hObject, eventdata, handles)
% hObject    handle to fs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fs as text
%        str2double(get(hObject,'String')) returns contents of fs as a double


% --- Executes during object creation, after setting all properties.
function fs_CreateFcn(hObject, eventdata, ~)
% hObject    handle to fs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function fc1_Callback(hObject, eventdata, ~)
% hObject    handle to fc1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fc1 as text
%        str2double(get(hObject,'String')) returns contents of fc1 as a double


% --- Executes during object creation, after setting all properties.
function fc1_CreateFcn(hObject, eventdata, ~)
% hObject    handle to fc1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function fc2_Callback(~, eventdata, handles)
% hObject    handle to fc2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fc2 as text
%        str2double(get(hObject,'String')) returns contents of fc2 as a double


% --- Executes during object creation, after setting all properties.
function fc2_CreateFcn(hObject, ~, handles)
% hObject    handle to fc2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editrp_Callback(hObject, eventdata, handles)
% hObject    handle to editrp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editrp as text
%        str2double(get(hObject,'String')) returns contents of editrp as a double


% --- Executes during object creation, after setting all properties.
function editrp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editrp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in resetproj.
function resetproj_Callback(hObject, eventdata, handles)
% hObject    handle to resetproj (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%restart the GUI
close(gcbf)
ECE121L_Project





function time_Callback(hObject, eventdata, handles)
% hObject    handle to time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of time as text
%        str2double(get(hObject,'String')) returns contents of time as a double


% --- Executes during object creation, after setting all properties.
function time_CreateFcn(hObject, eventdata, handles)
% hObject    handle to time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editrs_Callback(hObject, eventdata, handles)
% hObject    handle to editrs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editrs as text
%        str2double(get(hObject,'String')) returns contents of editrs as a double


% --- Executes during object creation, after setting all properties.
function editrs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editrs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in datafilter.
function datafilter_Callback(hObject, eventdata, handles)
% hObject    handle to datafilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Filtered
wavplay(Filtered) %play the filtered signal
[filename pathname]=uiputfile('filtered_sound.wav', 'Choose a name to save filtered sound');
wavwrite(Filtered , [pathname,filename]);


% --------------------------------------------------------------------
function info1_Callback(hObject, eventdata, handles)
% hObject    handle to info1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function names_Callback(hObject, eventdata, handles)
% hObject    handle to names (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Designer


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over record.
function record_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to record (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on popupmenu1 and none of its controls.
function popupmenu1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)



function fc3_Callback(hObject, eventdata, handles)
% hObject    handle to fc3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fc3 as text
%        str2double(get(hObject,'String')) returns contents of fc3 as a double


% --- Executes during object creation, after setting all properties.
function fc3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fc3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function fc4_Callback(hObject, eventdata, handles)
% hObject    handle to fc4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fc4 as text
%        str2double(get(hObject,'String')) returns contents of fc4 as a double


% --- Executes during object creation, after setting all properties.
function fc4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fc4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in MBP.
function MBP_Callback(hObject, eventdata, handles)
% hObject    handle to MBP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(get(handles.MBP,'value')==1)
    set(handles.fir,'value',0)
    set(handles.iir,'value',0)
    set(handles.popupmenu1,'enable','off')
    set(handles.popupmenu2,'enable','off')
    set(handles.popupmenu3,'enable','on')
    set(handles.editrp,'enable','off')
    set(handles.editrs,'enable','off')
    set(handles.filter,'enable','on')

end
% Hint: get(hObject,'Value') returns toggle state of MBP


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (get(handles.popupmenu3,'value')==1) %initial state
    set(handles.order,'enable','off')
    set(handles.fc1,'enable','off')
    set(handles.fc2,'enable','off')
    set(handles.fc3,'enable','off')
    set(handles.fc4,'enable','off')
    set(handles.editrp,'enable','off')
    set(handles.editrs,'enable','off')
    set(handles.filter,'enable','on')
elseif (get(handles.popupmenu3,'value')==2) %MBP FIR popup
    set(handles.order,'enable','on')
    set(handles.fc1,'enable','on')
    set(handles.fc2,'enable','on')
    set(handles.fc3,'enable','on')
    set(handles.fc4,'enable','on')
    set(handles.editrp,'enable','off')
    set(handles.editrs,'enable','off')
    set(handles.filter,'enable','on')
elseif(get(handles.popupmenu3,'value')==3) %MBP cheb2
    set(handles.order,'enable','on')
    set(handles.fc1,'enable','on')
    set(handles.fc2,'enable','on')
    set(handles.fc3,'enable','off')
    set(handles.fc4,'enable','off')
    set(handles.editrp,'enable','off')
    set(handles.editrs,'enable','on')
    set(handles.filter,'enable','on') 
end
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
