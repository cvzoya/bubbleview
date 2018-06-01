% This file plots BubbleView clicks under a free-viewing task on SALICON's
% natural image dataset. In Exp. 5.1, we vary the blur sigma and bubble 
% radius for our data collection. In Exp. 5.2, we replace mouse clicks with
% mouse movements, and vary just the bubble radius. SALICON's ground truth
% (gt) was collected using a very similar methodology to BubbleView, but 
% with mouse movements instead of mouse clicks, and adaptive blur.
% Zoya Bylinskii, 05/31/2018

addpath('utils');

%% Experiment 5.1: 
% task type: free-viewing
% time: 10 seconds
% blur sigma: 30, 50, 70 pixels
% bubble radius: 30, 50, 70 pixels
% mouse modality: mouse clicks

blur = 30; % toggle between 30, 50, 70
sigma = [30,50,70];

B = {};
for i = 1:length(sigma)
    B{i} = load(sprintf('salicon%dx%d.mat',blur,sigma(i)));
end

o = load('salicon_gt.mat');

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

    % ----- SALICON mouse movements (ground truth) -----
    
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

%% Experiment 5.2: 
% task type: free-viewing
% time: 5 seconds
% blur sigma: 30 pixels
% bubble radius: 30, 50 pixels
% mouse modality: mouse movements

sigma = [30,50];

B = {};
for i = 1:length(sigma)
    B{i} = load(sprintf('saliconMM%d.mat',sigma(i)));
end

o = load('salicon_gt.mat');

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

    % ----- SALICON mouse movements (ground truth) -----
    
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
    hm_orig = plotfixdata(im,fixdata,dim1,dim2,curtitle,2,3,1);
    
    % ----- BubbleView mouse movements ----

    im = imread(B{1}.bubble(i).impath);
    [dim1,dim2,~] = size(im);
    
    for b = 1:length(B)
        fprintf('Sigma %d:\n',sigma(b));
        [fixdata,avgfix,totfix,nusers]=getfixdata(B{b}.bubble,i);
        curtitle = {sprintf('Sigma %d',sigma(b)),sprintf('# locs=%d',totfix),sprintf('# users=%d',nusers)};
        hm_fv = plotfixdata(im,fixdata,dim1,dim2,curtitle,2,3,1+b);
    end

    % ----- plot and record comparisons ----

    if savedir
        print(fullfile(savedir,curfilename),'-dpng')
    else
        pause; % wait for user keypress to move on to next image
    end

end






    