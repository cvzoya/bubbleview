% This file plots BubbleView clicks under a free-viewing task on the
% Graphic Design Importance (GDI) dataset. 
% Zoya Bylinskii, 05/31/2018

addpath('utils');

%% Experiment 4: 
% task type: free-viewing
% time: 10 seconds
% blur sigma: 30 pixels
% bubble radius: 50 pixels
% mouse modality: mouse clicks

load('gdi30x50.mat');

savedir = ''; % if empty, will just plot results (and wait for user keypress to plot next image); 
              % if specified, will not pause, but will save each image's results one by one
if savedir
    mkdir(savedir);
end

for i = 1:length(bubble) 

    fprintf('\nOn image %d/%d\n',i,length(bubble));
    
    close all;
    figure('units','normalized','outerposition',[0 0 1 1]); 

    curfilename = bubble(i).filename;
    
    % ----- GDI importance annotations ----
    
    hm_gt = double(imread(fullfile('gdi-official',[curfilename(1:end-4),'.png'])));
    omap = heatmap_overlay(im,hm_gt,'hot'); 
    subplot(1,2,1); imshow(omap);
    title('GT');
    
    % ----- BubbleView click data ----
    
    im = imread(bubble(i).impath);
    [dim1,dim2,~] = size(im);

    fprintf('BubbleView:\n');
    [fixdata,avgfix,totfix,nusers]=getfixdata(bubble,i);
    curtitle = {'BubbleView',sprintf('# locs=%d',totfix),sprintf('# users=%d',nusers)};
    hm_fv = plotfixdata(im,fixdata,dim1,dim2,curtitle,2,2,2);
    
    % ----- plot and record comparisons ----

    if savedir
        print(fullfile(savedir,curfilename),'-dpng')
    else
        pause; % wait for user keypress to move on to next image
    end

    close all; 
    
end
