function scrollplot(y, dx)

% Generate and plot data
x = 1:size(y,1);
% dx is the width of the axis 'window'
a=gca;
p=plot(x,y);
grid;

% Set appropriate axis limits and settings
set(gcf,'doublebuffer','on');
% This avoids flickering when updating the axis
set(a,'xlim',[0 dx]);
maxy = max(max(y));
miny = min(min(y));
set(a,'ylim',[1.1*miny-0.1*maxy 1.1*maxy-0.1*miny]);

% Generate constants for use in uicontrol initialization
pos=get(a,'position');
Newpos=[pos(1) pos(2)-0.1 pos(3) 0.05];
% This will create a slider which is just underneath the axis
% but still leaves room for the axis labels above the slider
xmax=max(x);
S=['set(gca,''xlim'',get(gcbo,''value'')+[0 ' num2str(dx) '])'];
% Setting up callback string to modify XLim of axis (gca)
% based on the position of the slider (gcbo)

% Creating Uicontrol
h=uicontrol('style','slider',...
    'units','normalized','position',Newpos,...
    'callback',S,'min',0,'max',xmax-dx);