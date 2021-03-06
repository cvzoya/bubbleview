% This file plots BubbleView clicks and mouse movements (under different
% durations) corresponding to free-viewing on OSIE natural images, compared
% to ground truth eye fixations and mouse movements collected using the
% SALICON interface (online and in the lab).
% Zoya Bylinskii, 05/31/2018

addpath('utils');

%% Experiment 2.1: 
% task type: free-viewing
% time: 10 seconds
% blur sigma: 30 pixels
% bubble radius: 30 pixels
% mouse modality: mouse clicks

type = {'osie-amt-official.mat','osie-lab-official.mat','osie30x30.mat'};
type_name = {'SALICON mturk','SALICON in-lab','BubbleView clicks'};

B = {};
for i = 1:length(type)
    B{i} = load(type{i});
end

o = load('osie-eye-official.mat');

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
    
    % ----- SALICON & BubbleView mouse data ----

    im = imread(B{1}.bubble(i).impath);
    [dim1,dim2,~] = size(im);
    
    for b = 1:length(B)
        fprintf('%s:\n',type_name{b});
        [fixdata,avgfix,totfix,nusers]=getfixdata(B{b}.bubble,i);
        curtitle = {sprintf('%s',type_name{b}),sprintf('# locs=%d',totfix),sprintf('# users=%d',nusers)};
        hm_fv = plotfixdata(im,fixdata,dim1,dim2,curtitle,2,4,1+b);
    end

    % ----- plot and record comparisons ----

    if savedir
        print(fullfile(savedir,curfilename),'-dpng')
    else
        pause; % wait for user keypress to move on to next image
    end

end

%% Experiment 2.2: 
% task type: free-viewing
% time: 5 seconds
% blur sigma: 30 pixels
% bubble radius: 30 pixels
% mouse modality: mouse movements

type = {'osie-amt-official.mat','osie-lab-official.mat','osieMM30.mat'};
type_name = {'SALICON mturk','SALICON in-lab','BubbleView movements'};

B = {};
for i = 1:length(type)
    B{i} = load(type{i});
end

o = load('osie-eye-official.mat');

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
    
    % ----- SALICON & BubbleView mouse data ----

    im = imread(B{1}.bubble(i).impath);
    [dim1,dim2,~] = size(im);
    
    for b = 1:length(B)
        fprintf('%s:\n',type_name{b});
        [fixdata,avgfix,totfix,nusers]=getfixdata(B{b}.bubble,i);
        curtitle = {sprintf('%s',type_name{b}),sprintf('# locs=%d',totfix),sprintf('# users=%d',nusers)};
        hm_fv = plotfixdata(im,fixdata,dim1,dim2,curtitle,2,4,1+b);
    end

    % ----- plot and record comparisons ----

    if savedir
        print(fullfile(savedir,curfilename),'-dpng')
    else
        pause; % wait for user keypress to move on to next image
    end

end
