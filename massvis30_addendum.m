% This file plots BubbleView clicks under a free-viewing and description
% task in comparison to eye fixations from an eye tracker on a set of 30
% information visualizations from the MASSVIS dataset.
% Zoya Bylinskii, 05/31/2018

addpath('utils');

%% Experiment: addendum to paper
% task type: free-viewing, description
% time: 10 seconds, unlimited
% blur sigma: 40 pixels
% bubble radius: 32 pixels
% mouse modality: mouse clicks

a = load('massvis_fv_40x32.mat');
b = load('massvis_eyetrack.mat');
c = load('massvis40x32_addendum.mat');
bubble_fv = a.bubble; bubble_eye = b.bubble; bubble_desc = c.bubble;
savedir = ''; % if empty, will just plot results (and wait for user keypress to plot next image); 
              % if specified, will not pause, but will save each image's results one by one
if savedir
    mkdir(savedir);
end

bubble_filenames = {bubble_eye().filename};

for i = 1:length(bubble_fv) 

    fprintf('\nOn image %d/%d\n',i,length(bubble_fv));
    figure('units','normalized','outerposition',[0 0 1 1]); 

    curfilename = bubble_fv(i).filename;

    % ----- original eye fixation data -----
    ind = find(strcmp(curfilename,bubble_filenames));
    if isempty(ind)
        fprintf('%s not found. Skipping.',curfilename);
        continue
    end

    im = imread(bubble_eye(ind).impath);
    [dim1,dim2,~] = size(im);

    fprintf('Eye fixations:\n');
    [fixdata,avgfix,totfix,nusers]=getfixdata(bubble_eye,ind);
    curtitle = {'Ground truth',sprintf('# locs=%d',totfix),sprintf('# users=%d',nusers)};
    hm_orig = plotfixdata(im,fixdata,dim1,dim2,curtitle,2,3,1);

    % ----- description click data -----
    % note: stored same way as bubble_eye, in same filename order

    fprintf('Description:\n');
    [fixdata,avgfix,totfix,nusers]=getfixdata(bubble_desc,ind);
    curtitle = {'Description',sprintf('# locs=%d',totfix),sprintf('# users=%d',nusers)};
    hm_desc = plotfixdata(im,fixdata,dim1,dim2,curtitle,2,3,2);

    % ----- free viewing click data ----

    im = imread(bubble_fv(i).impath);
    [dim1,dim2,~] = size(im);

    fprintf('Free view:\n');
    [fixdata,avgfix,totfix,nusers]=getfixdata(bubble_fv,i);
    curtitle = {'Free-view',sprintf('# locs=%d',totfix),sprintf('# users=%d',nusers)};
    hm_fv = plotfixdata(im,fixdata,dim1,dim2,curtitle,2,3,3);

    % ----- plot and record comparisons ----

    if savedir
        print(fullfile(savedir,curfilename),'-dpng')
    else
        pause; % wait for user keypress to move on to next image
    end

    close all; 

end
    