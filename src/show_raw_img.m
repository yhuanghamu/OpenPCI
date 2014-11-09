function varargout = show_raw_img(varargin)
% SHOW_RAW_IMG MATLAB code for show_raw_img.fig
%      SHOW_RAW_IMG, by itself, creates a new SHOW_RAW_IMG or raises the existing
%      singleton*.
%
%      H = SHOW_RAW_IMG returns the handle to a new SHOW_RAW_IMG or the handle to
%      the existing singleton*.
%
%      SHOW_RAW_IMG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SHOW_RAW_IMG.M with the given input arguments.
%
%      SHOW_RAW_IMG('Property','Value',...) creates a new SHOW_RAW_IMG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before show_raw_img_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to show_raw_img_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help show_raw_img

% Last Modified by GUIDE v2.5 07-Nov-2014 19:21:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @show_raw_img_OpeningFcn, ...
                   'gui_OutputFcn',  @show_raw_img_OutputFcn, ...
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


% --- Executes just before show_raw_img is made visible.
function show_raw_img_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to show_raw_img (see VARARGIN)

% Choose default command line output for show_raw_img
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes show_raw_img wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = show_raw_img_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
