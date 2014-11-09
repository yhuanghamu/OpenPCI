function varargout = info_extract(varargin)
% INFO_EXTRACT MATLAB code for info_extract.fig
%      INFO_EXTRACT, by itself, creates a new INFO_EXTRACT or raises the existing
%      singleton*.
%
%      H = INFO_EXTRACT returns the handle to a new INFO_EXTRACT or the handle to
%      the existing singleton*.
%
%      INFO_EXTRACT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INFO_EXTRACT.M with the given input arguments.
%
%      INFO_EXTRACT('Property','Value',...) creates a new INFO_EXTRACT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before info_extract_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to info_extract_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help info_extract

% Last Modified by GUIDE v2.5 08-Nov-2014 18:07:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @info_extract_OpeningFcn, ...
                   'gui_OutputFcn',  @info_extract_OutputFcn, ...
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


% --- Executes just before info_extract is made visible.
function info_extract_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to info_extract (see VARARGIN)

% Choose default command line output for info_extract
handles.output = hObject;

[pic,map] = imread('NSRL_Logo.gif');% show nsrl logo.
nsrl_Logo = ind2rgb(pic,map);
axes(handles.nsrl_logo);
image(nsrl_Logo);
axis off
% button visiblity.
set(handles.btn_show_image,'enable','off');
set(handles.btn_rotate_image,'enable','off');
handles.confirm_raw_info_status = 0;
handles.load_info_status = 0 ;

% Raw data info initialization.
handles.raw_info.num_of_proj = str2num(get(handles.edit_num_of_proj,'string'));
handles.raw_info.img_width = str2num(get(handles.edit_img_width,'string'));
handles.raw_info.img_height = str2num(get(handles.edit_img_height,'string'));
temp = get(handles.edit_data_type,'string');
handles.raw_info.data_type = temp{1};
temp = get(handles.edit_proj_ang_range,'string');
handles.raw_info.proj_ang_range = str2num(temp{1});

% axes img_display
axes(handles.img_display);
imshow('blank_img.tif');
axis off;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes info_extract wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = info_extract_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in load_raw.
function load_raw_Callback(hObject, eventdata, handles)
% hObject    handle to load_raw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on selection change in edit_proj_ang_range.
function edit_proj_ang_range_Callback(hObject, eventdata, handles)
% hObject    handle to edit_proj_ang_range (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns edit_proj_ang_range contents as cell array
%        contents{get(hObject,'Value')} returns selected item from edit_proj_ang_range
val = get(hObject,'Value');
str = get(hObject, 'String');
handles.raw_info.proj_ang_range = str2num(str{val});
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function edit_proj_ang_range_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_proj_ang_range (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in edit_data_type.
function edit_data_type_Callback(hObject, eventdata, handles)
% hObject    handle to edit_data_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns edit_data_type contents as cell array
%        contents{get(hObject,'Value')} returns selected item from edit_data_type
val = get(hObject,'Value');
str = get(hObject, 'String');
handles.raw_info.data_type = str{val};
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function edit_data_type_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_data_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_num_of_proj_Callback(hObject, eventdata, handles)
% hObject    handle to edit_num_of_proj (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_num_of_proj as text
%        str2double(get(hObject,'String')) returns contents of edit_num_of_proj as a double
num_of_proj = str2num(get(hObject,'string'));
if isinteger(num_of_proj)
    set(hObject, 'String', 0);
    errordlg('Input must be a integer number','Error');
end
% set(handles.raw_info.num_of_proj,'Value', num_of_proj);
handles.raw_info.num_of_proj = num_of_proj;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function edit_num_of_proj_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_num_of_proj (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_img_height_Callback(hObject, eventdata, handles)
% hObject    handle to edit_img_height (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_img_height as text
%        str2double(get(hObject,'String')) returns contents of edit_img_height as a double
img_height = str2num(get(hObject,'string'));
if isinteger(img_height)
    set(hObject, 'String', 0);
    errordlg('Input must be a integer number','Error');
end
handles.raw_info.img_height = img_height;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function edit_img_height_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_img_height (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit_img_width_Callback(hObject, eventdata, handles)
% hObject    handle to edit_img_height (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_img_height as text
%        str2double(get(hObject,'String')) returns contents of edit_img_height as a double
img_width = str2num(get(hObject,'string'));
if isinteger(img_width)
    set(hObject, 'String', 0);
    errordlg('Input must be a integer number','Error');
end
handles.raw_info.img_width = img_width;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function edit_img_width_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_img_width (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in btn_show_image.
function btn_show_image_Callback(hObject, eventdata, handles)
% hObject    handle to btn_show_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.img_display);
axis off;
i=1; %show No.i image.
I = read_specific_file( handles.dir_info.dir_raw, handles.raw_info, i );
handles.data_info.fisrt_image = I;
imshow(I,[min(I(:)) max(I(:))]);
set(handles.btn_rotate_img,'enable','on'); % enable rotate image button.
guidata(hObject,handles);


% --- Executes on button press in btn_reset_raw_info.
function btn_reset_raw_info_Callback(hObject, eventdata, handles)
% hObject    handle to btn_reset_raw_info (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.raw_info.num_of_proj = 500;
handles.raw_info.img_height = 3800;
handles.raw_info.img_width = 3800;
handles.raw_info.data_type = 'int16';
handles.raw_info.proj_ang_range = '180';

set(handles.edit_num_of_proj, 'String', num2str(handles.raw_info.num_of_proj));
set(handles.edit_img_width, 'String', num2str(handles.raw_info.img_width));
set(handles.edit_img_height, 'String', num2str(handles.raw_info.img_height));
set(handles.edit_data_type,'Value',1);
set(handles.edit_proj_ang_range,'Value',1);
handles.confirm_raw_info_status = 0;
set(handles.btn_show_image,'enable','off');
guidata(hObject,handles);


% --- Executes on button press in btn_confirm_raw_info.
function btn_confirm_raw_info_Callback(hObject, eventdata, handles)
% hObject    handle to btn_confirm_raw_info (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.confirm_raw_info_status = 1;

if (handles.load_info_status && handles.confirm_raw_info_status)
    set(handles.btn_show_image,'enable','on');
end
guidata(hObject,handles);


% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton1


% --------------------------------------------------------------------
function menu_file_Callback(hObject, eventdata, handles)
% hObject    handle to menu_file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function menu_load_raw_files_Callback(hObject, eventdata, handles)
% hObject    handle to menu_load_raw_files (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.dir_info.dir_raw = uigetdir(pwd,'Select Raw Data Directory to Open');
handles.load_info_status = 1 ;
if (handles.load_info_status && handles.confirm_raw_info_status)
    set(handles.btn_show_image,'enable','on');
end

guidata(hObject, handles);


% --------------------------------------------------------------------
function menu_load_dark_Callback(hObject, eventdata, handles)
% hObject    handle to menu_load_dark (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% handles.dir_info.dir_dark = uigetfile(pwd,'Select the Dark background file');
[filename, pathname] =uigetfile(pwd,'Select the Dark background file');
handles.dir_info.dir_dark = [pathname filename];
guidata(hObject, handles);


% --------------------------------------------------------------------
function menu_load_refer_files_Callback(hObject, eventdata, handles)
% hObject    handle to menu_load_refer_files (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.dir_info.dir_refer = uigetdir(pwd,'Select Reference Data Directory to Open');
guidata(hObject, handles);


% --- Executes on button press in btn_rotate_image.
function btn_rotate_image_Callback(hObject, eventdata, handles)
% hObject    handle to btn_rotate_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I = handles.data_info.fisrt_image;
rotate_angle = str2num(get(handles.edit_rotate_angle,'String'));
J = imrotate(I,rotate_angle,'bilinear','crop');
handles.data_info.rotate_image = J;
axes(img_display);
imshow(J,[min(J(:)) max(J(:))]);
guidata(hObject, handles);


function edit_rotate_angle_Callback(hObject, eventdata, handles)
% hObject    handle to edit_rotate_angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_rotate_angle as text
%        str2double(get(hObject,'String')) returns contents of edit_rotate_angle as a double


% --- Executes during object creation, after setting all properties.
function edit_rotate_angle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_rotate_angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_set_ROI.
function btn_set_ROI_Callback(hObject, eventdata, handles)
% hObject    handle to btn_set_ROI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[xo yo] = ginput(2);
i=1;