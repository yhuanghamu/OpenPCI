function varargout = Load_raw_files(varargin)
% LOAD_RAW_FILES MATLAB code for Load_raw_files.fig
%      LOAD_RAW_FILES, by itself, creates a new LOAD_RAW_FILES or raises the existing
%      singleton*.
%
%      H = LOAD_RAW_FILES returns the handle to a new LOAD_RAW_FILES or the handle to
%      the existing singleton*.
%
%      LOAD_RAW_FILES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LOAD_RAW_FILES.M with the given input arguments.
%
%      LOAD_RAW_FILES('Property','Value',...) creates a new LOAD_RAW_FILES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Load_raw_files_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Load_raw_files_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Load_raw_files

% Last Modified by GUIDE v2.5 06-Nov-2014 17:18:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Load_raw_files_OpeningFcn, ...
                   'gui_OutputFcn',  @Load_raw_files_OutputFcn, ...
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


% --- Executes just before Load_raw_files is made visible.
function Load_raw_files_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Load_raw_files (see VARARGIN)

% Choose default command line output for Load_raw_files
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Load_raw_files wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Load_raw_files_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
