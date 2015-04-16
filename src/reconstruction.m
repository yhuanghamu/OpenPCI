function varargout = reconstruction(varargin)
% RECONSTRUCTION MATLAB code for reconstruction.fig
%      RECONSTRUCTION, by itself, creates a new RECONSTRUCTION or raises the existing
%      singleton*.
%
%      H = RECONSTRUCTION returns the handle to a new RECONSTRUCTION or the handle to
%      the existing singleton*.
%
%      RECONSTRUCTION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RECONSTRUCTION.M with the given input arguments.
%
%      RECONSTRUCTION('Property','Value',...) creates a new RECONSTRUCTION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before reconstruction_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to reconstruction_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help reconstruction

% Last Modified by GUIDE v2.5 17-Nov-2014 13:29:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @reconstruction_OpeningFcn, ...
                   'gui_OutputFcn',  @reconstruction_OutputFcn, ...
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


% --- Executes just before reconstruction is made visible.
function reconstruction_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to reconstruction (see VARARGIN)

% Choose default command line output for reconstruction
handles.output = hObject;

% button visualbility.
set(handles.btn_dark_recon,'enable','on');
set(handles.btn_phase_recon,'enable','on');
set(handles.btn_absorp_recon,'enable','on');
%set(handles.btn_dark_recon,'enable','off');
%set(handles.btn_phase_recon,'enable','off');
%set(handles.btn_absorp_recon,'enable','off');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes reconstruction wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = reconstruction_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;




% --- Executes on button press in btn_dark_recon.
function btn_dark_recon_Callback(hObject, eventdata, handles)
% hObject    handle to btn_dark_recon (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.dir_info.dir_darkfield = uigetdir(pwd,'Select Dark field projection Directory to Open');
recon3D_darkfield(handles.dir_info.dir_darkfield,handles);
% Update handles structure
guidata(hObject, handles);

% --------------------------------------------------------------------
function menu_file_Callback(hObject, eventdata, handles)
% hObject    handle to menu_file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function menu_load_dark_Callback(hObject, eventdata, handles)
% hObject    handle to menu_load_dark (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.dir_info.dir_darkfield = uigetdir(pwd,'Select Dark field projection Directory to Open');
set(handles.btn_dark_recon,'enable','on');


% --- Executes on button press in btn_phase_recon.
function btn_phase_recon_Callback(hObject, eventdata, handles)
% hObject    handle to btn_phase_recon (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.dir_info.dir_phase = uigetdir(pwd,'Select differential phase contrast projection Directory to Open');
recon3D_diffphase(handles.dir_info.dir_phase,handles);
% Update handles structure
guidata(hObject, handles);

% --- Executes on button press in btn_absorp_recon.
function btn_absorp_recon_Callback(hObject, eventdata, handles)
% hObject    handle to btn_absorp_recon (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.dir_info.dir_absorp = uigetdir(pwd,'Select absorption projection Directory to Open');
recon3D_absorp(handles.dir_info.dir_absorp,handles);
% Update handles structure
guidata(hObject, handles);
% --------------------------------------------------------------------
function menu_load_phase_Callback(hObject, eventdata, handles)
% hObject    handle to menu_load_phase (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.dir_info.dir_phase = uigetdir(pwd,'Select differential phase contrast projection Directory to Open');
set(handles.btn_phase_recon,'enable','on');

% --------------------------------------------------------------------
function menu_load_absorp_Callback(hObject, eventdata, handles)
% hObject    handle to menu_load_absorp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.dir_info.dir_absorp = uigetdir(pwd,'Select absorption projection Directory to Open');
set(handles.btn_absorp_recon,'enable','on');
