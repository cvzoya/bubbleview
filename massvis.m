% This file plots BubbleView clicks under a description task on
% information visualizations from the MASSVIS dataset, with varying bubble
% radius size.
% Zoya Bylinskii, 05/31/2018

addpath('utils');

%% Experiment 1.1: 
% task type: description
% time: unlimited
% blur sigma: 40 pixels
% bubble radius: 16, 24, 32 pixels
% mouse modality: mouse clicks

blur = 40; 
sigma = [16,24,32];

B = {};
for i = 1:length(sigma)
    B{i} = load(sprintf('massvis_exp1_%dx%d.mat',blur,sigma(i)));
end

o = load('massvis_eyetrack.mat');

savedir = ''; % if empty, will just plot results (and wait for user keypress to plot next image); 
              % if specified, will not pause, but will save each image's results one by one
if savedir
    mkdir(savedir);
end

bubble_filenames = {o.bubble().filename};

for i = 1:length(B{1}.bubble) 

    fprintf('\nOn image %d/%d\n',i,length(B{1}.bubble));
    
    close all;
    figure('units','normalized','outerposition',[0 0 1 1]); 

    curfilename = B{1}.bubble(i).filename;

    % ----- original eye fixation data -----
    
    ind = find(strcmp(curfilename,bubble_filenames));
    if isempty(ind)
        fprintf('%s not found. Skipping.',curfilename);
        continue
    end

    im = imread(o.bubble(ind).impath);
    [dim1,dim2,~] = size(im);

    fprintf('Ground truth:\n');
    [fixdata,avgfix,totfix,nusers]=getfixdata(o.bubble,ind);
    curtitle = {'Ground truth',sprintf('# locs=%d',totfix),sprintf('# users=%d',nusers)};
    hm_orig = plotfixdata(im,fixdata,dim1,dim2,curtitle,2,4,1);
    
    % ----- BubbleView mouse clicks ----

    im = imread(B{1}.bubble(i).impath);
    [dim1,dim2,~] = size(im);
    
    for b = 1:length(B)
        fprintf('Blur %d, Sigma %d:\n',blur,sigma(b));
        [fixdata,avgfix,totfix,nusers]=getfixdata(B{b}.bubble,i);
        curtitle = {sprintf('Blur %d, Sigma %d',blur,sigma(b)),sprintf('# locs=%d',totfix),sprintf('# users=%d',nusers)};
        hm_fv = plotfixdata(im,fixdata,dim1,dim2,curtitle,2,4,1+b);
    end

    % ----- plot and record comparisons ----

    if savedir
        print(fullfile(savedir,curfilename),'-dpng')
    else
        pause; % wait for user keypress to move on to next image
    end

end

%% Experiment 1.2: 
% task type: description
% time: unlimited
% blur sigma: 40 pixels
% bubble radius: 24, 32, 40 pixels
% mouse modality: mouse clicks

blur = 40; 
sigma = [24,32,40];

B = {};
for i = 1:length(sigma)
    B{i} = load(sprintf('massvis_exp2_%dx%d.mat',blur,sigma(i)));
end

o = load('massvis_eyetrack.mat');

savedir = ''; % if empty, will just plot results (and wait for user keypress to plot next image); 
              % if specified, will not pause, but will save each image's results one by one
if savedir
    mkdir(savedir);
end

bubble_filenames = {o.bubble().filename};

for i = 1:length(B{1}.bubble) 

    fprintf('\nOn image %d/%d\n',i,length(B{1}.bubble));
    
    close all;
    figure('units','normalized','outerposition',[0 0 1 1]); 

    curfilename = B{1}.bubble(i).filename;

    % ----- original eye fixation data -----
    
    ind = find(strcmp(curfilename,bubble_filenames));
    if isempty(ind)
        fprintf('%s not found. Skipping.',curfilename);
        continue
    end

    im = imread(o.bubble(ind).impath);
    [dim1,dim2,~] = size(im);

    fprintf('Ground truth:\n');
    [fixdata,avgfix,totfix,nusers]=getfixdata(o.bubble,ind);
    curtitle = {'Ground truth',sprintf('# locs=%d',totfix),sprintf('# users=%d',nusers)};
    hm_orig = plotfixdata(im,fixdata,dim1,dim2,curtitle,2,4,1);
    
    % ----- BubbleView mouse clicks ----

    im = imread(B{1}.bubble(i).impath);
    [dim1,dim2,~] = size(im);
    
    for b = 1:length(B)
        fprintf('Blur %d, Sigma %d:\n',blur,sigma(b));
        [fixdata,avgfix,totfix,nusers]=getfixdata(B{b}.bubble,i);
        curtitle = {sprintf('Blur %d, Sigma %d',blur,sigma(b)),sprintf('# locs=%d',totfix),sprintf('# users=%d',nusers)};
        hm_fv = plotfixdata(im,fixdata,dim1,dim2,curtitle,2,4,1+b);
    end

    % ----- plot and record comparisons ----

    if savedir
        print(fullfile(savedir,curfilename),'-dpng')
    else
        pause; % wait for user keypress to move on to next image
    end

end

%% Experiment 1.3: 
% task type: description
% time: unlimited
% blur sigma: 40 pixels
% bubble radius: 32 pixels
% mouse modality: mouse clicks

b = load('massvis_exp3_40x32.mat');
o = load('massvis_eyetrack.mat');

savedir = 'fornow'; % if empty, will just plot results (and wait for user keypress to plot next image); 
              % if specified, will not pause, but will save each image's results one by one
if savedir
    mkdir(savedir);
end

bubble_filenames = {o.bubble().filename};

for i = 1:length(b.bubble) 

    fprintf('\nOn image %d/%d\n',i,length(b.bubble));
    
    close all;
    figure('units','normalized','outerposition',[0 0 1 1]); 

    curfilename = b.bubble(i).filename;

    % ----- original eye fixation data -----
    
    ind = find(strcmp(curfilename,bubble_filenames));
    if isempty(ind)
        fprintf('%s not found. Skipping.',curfilename);
        continue
    end

    im = imread(o.bubble(ind).impath);
    [dim1,dim2,~] = size(im);

    fprintf('Ground truth:\n');
    [fixdata,avgfix,totfix,nusers]=getfixdata(o.bubble,ind);
    curtitle = {'Ground truth',sprintf('# locs=%d',totfix),sprintf('# users=%d',nusers)};
    hm_orig = plotfixdata(im,fixdata,dim1,dim2,curtitle,2,2,1);
    
    % ----- BubbleView mouse clicks ----

    im = imread(b.bubble(i).impath);
    [dim1,dim2,~] = size(im);
    
    fprintf('BubbleView clicks:\n');
    [fixdata,avgfix,totfix,nusers]=getfixdata(b.bubble,i);
    curtitle = {'BubbleView clicks',sprintf('# locs=%d',totfix),sprintf('# users=%d',nusers)};
    hm_fv = plotfixdata(im,fixdata,dim1,dim2,curtitle,2,2,2);

    % ----- plot and record comparisons ----

    if savedir
        print(fullfile(savedir,curfilename),'-dpng')
    else
        pause; % wait for user keypress to move on to next image
    end

end