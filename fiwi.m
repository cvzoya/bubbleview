% This file plots BubbleView clicks under a free-viewing or description
% task on FiWI static website images, with different viewing times and
% bubble radius size.
% Zoya Bylinskii, 05/31/2018

addpath('utils');

%% Experiment 3.1: 
% task type: free-viewing
% time: 10, 30 seconds
% blur sigma: 50 pixels
% bubble radius: 30, 50, 70 pixels
% mouse modality: mouse clicks

time = 10; % toggle between 10,30
sigma = [30,50,70];

B = {};
for i = 1:length(sigma)
    B{i} = load(sprintf('fiwi%dx%d.mat',time,sigma(i)));
end

o = load('fiwi_eyetrack.mat');

savedir = 'fornow'; % if empty, will just plot results (and wait for user keypress to plot next image); 
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
    
    % ----- free viewing click data ----

    im = imread(B{1}.bubble(i).impath);
    [dim1,dim2,~] = size(im);
    
    for b = 1:length(B)
        fprintf('Time %d, Sigma %d:\n',time,sigma(b));
        [fixdata,avgfix,totfix,nusers]=getfixdata(B{b}.bubble,i);
        curtitle = {sprintf('Time %d, Sigma %d',time,sigma(b)),sprintf('# locs=%d',totfix),sprintf('# users=%d',nusers)};
        hm_fv = plotfixdata(im,fixdata,dim1,dim2,curtitle,2,4,1+b);
    end

    % ----- plot and record comparisons ----

    if savedir
        print(fullfile(savedir,curfilename),'-dpng')
    else
        pause; % wait for user keypress to move on to next image
    end

end

%% Experiment 3.2: 
% task type: description
% time: unlimited
% blur sigma: 50 pixels
% bubble radius: 30 pixels
% mouse modality: mouse clicks

% side-by-side comparison of description task, and 10, 30 second
% free-viewing tasks
type = {'D','10','30'}; 
type_name = {'description','free-view 10 sec','free-view 30 sec'};

B = {};
for i = 1:length(type)
    B{i} = load(sprintf('fiwi%sx30.mat',type{i}));
end

o = load('fiwi_eyetrack.mat');

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
    
    % ----- description click data ----

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
