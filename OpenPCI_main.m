function varargout = OpenPCI_main(varargin)
% OPENPCI_MAIN MATLAB code for OpenPCI_main.fig
%      OPENPCI_MAIN, by itself, creates a new OPENPCI_MAIN or raises the existing
%      singleton*.
%
%      H = OPENPCI_MAIN returns the handle to a new OPENPCI_MAIN or the handle to
%      the existing singleton*.
%
%      OPENPCI_MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OPENPCI_MAIN.M with the given input arguments.
%
%      OPENPCI_MAIN('Property','Value',...) creates a new OPENPCI_MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before OpenPCI_main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to OpenPCI_main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help OpenPCI_main

% Last Modified by GUIDE v2.5 06-Nov-2014 17:29:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @OpenPCI_main_OpeningFcn, ...
                   'gui_OutputFcn',  @OpenPCI_main_OutputFcn, ...
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


% --- Executes just before OpenPCI_main is made visible.
function OpenPCI_main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to OpenPCI_main (see VARARGIN)

% Choose default command line output for OpenPCI_main
handles.output = hObject;
[pic,map] = imread('NSRL_Logo.gif');
nsrl_Logo = ind2rgb(pic,map);
axes(handles.nsrl_logo);
image(nsrl_Logo);
axis off
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes OpenPCI_main wait for user response (see UIRESUME)
% uiwait(handles.main);


% --- Outputs from this function are returned to the command line.
function varargout = OpenPCI_main_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;




% --- Executes on button press in info_extract.
function info_extract_Callback(hObject, eventdata, handles)
% hObject    handle to info_extract (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
info_extract;



% --- Executes on button press in recon.
function recon_Callback(hObject, eventdata, handles)
% hObject    handle to recon (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
reconstruction;

% --- Executes on button press in exit_button.
function exit_button_Callback(hObject, eventdata, handles)
% hObject    handle to exit_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Get the current position of the GUI from the handles structure
% to pass to the modal dialog.
pos_size = get(handles.main,'Position');

% Call modaldlg with the argument 'Position'.
user_response = modal('Title','Main window');
switch user_response
case {'No'}
	% take no action
case 'Yes'
	% Prepare to close GUI application window
	%                  .
	%                  .
	%                  .
	delete(handles.main);
end
