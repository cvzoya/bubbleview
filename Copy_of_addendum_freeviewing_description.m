%a = load('datasets/massvis-fv/fv-clicks32_2.mat');
%b = load('datasets/massvis-202/massvis-official.mat')
%c = load('datasets/massvis-202/massvis40x32.mat')
%addendum_freeviewing_description(a.bubble,b.bubble,c.bubble)

function addendum_freeviewing_description(bubble_fv,bubble_eye,bubble_desc,savedir)

    if nargin<4, savedir=''; end

    bubble_filenames = {bubble_eye().filename};
    
    for i = 1:length(bubble_fv) 
        
        fprintf('\nOn image %d/%d\n',i,length(bubble_fv));
        figure('units','normalized','outerposition',[0 0 1 1]); 
        
        curfilename = strrep(bubble_fv(i).filename,' (1)',''); 
        
        % ----- orig fixation data -----
        ind = find(strcmp(curfilename,bubble_filenames));
        if isempty(ind)
            continue
        end
        
        im = imread(fullfile('targets',curfilename));
        [dim1,dim2,~] = size(im);

        const = max(dim1,dim2)/500;
        dim1 = round(dim1/const); dim2 = round(dim2/const); 
        im = imresize(im,[dim1,dim2]);
        
        fprintf('Eye fixations:\n');
        [fixdata,avgfix,totfix,nusers]=getfixdata(bubble_eye,ind);
        curtitle = {'ground truth',sprintf('nfix=%2.2f',totfix),sprintf('nusers=%d',nusers)};
        hm_orig = plotfixdata(im,fixdata,dim1,dim2,curtitle,1);
        
        fixationMap = zeros(dim1,dim2);
        for ii = 1:size(fixdata,1)
            fixationMap(max(floor(fixdata(ii,2)),1),max(floor(fixdata(ii,1)),1)) = 1;
        end
        
        % ----- description click data -----
        
        fprintf('Description:\n');
        [fixdata,avgfix,totfix,nusers]=getfixdata(bubble_desc,ind);
        curtitle = {'description',sprintf('nfix=%2.2f',totfix),sprintf('nusers=%d',nusers)};
        hm_desc = plotfixdata(im,fixdata,dim1,dim2,curtitle,2);
        
        % ----- free viewing click data ----
        
        [im,map] = imread(fullfile('/Users/Zoya/Google Drive/Visualization Labeling & Eye Tracking/Target Images/',curfilename));
        if any(map) % if indexed image
            im = ind2rgb(im,map);
        end
        [dim1,dim2,~] = size(im);

        const = max(dim1,dim2)/600;
        if const>1
            dim1 = round(dim1/const); dim2 = round(dim2/const); 
            im = imresize(im,[dim1,dim2]);
        end

        fprintf('Free view:\n');
        [fixdata,avgfix,totfix,nusers]=getfixdata(bubble_fv,i);
        curtitle = {'free-view',sprintf('nfix=%2.2f',totfix),sprintf('nusers=%d',nusers)};
        
        % ----- plot and record comparisons ----
        
        hm_fv = plotfixdata(im,fixdata,dim1,dim2,curtitle,3);

        if savedir
            print(fullfile(savedir,curfilename),'-dpng')
        else
            pause; 
        end
        
        close all; 

    end
    
end

% ------------------------------------------------------------
function [fixdata,avgfix,totfix,nusers]=getfixdata(bubble,i)

    fixdata = []; nfix = [];
    for j = 1:length(bubble(i).userdata)
        curfix = bubble(i).userdata(j).fixations.enc; 
        fixdata = [fixdata;curfix];
        nfix(j) = size(curfix,1);
    end
    
    avgfix = mean(nfix); nusers = length(bubble(i).userdata); totfix = size(fixdata,1);
    fprintf('Avg. fixations per user: %2.2f\n',avgfix);
    fprintf('# users: %d\n',nusers);
    fprintf('Tot fixations: %d\n',totfix);

end

% ------------------------------------------------------------
function heatmap=plotfixdata(im,fixdata,dim1,dim2,curtitle,subplt)

    [heatmap,~] = makeMap_full(fixdata,dim1,dim2);
    
    omap = heatmap_overlay(im,heatmap,'hot');

    if nargin>5
        subplot(2,3,subplt); 
    else
        figure('name',curtitle); 
    end
    imshow(omap);

    if nargin > 5
        subplot(2,3,subplt+3); 
    else
        figure('name',curtitle); 
    end

    imshow(im); hold on;
    for k = 1:size(fixdata,1)
        plot(fixdata(k,1),fixdata(k,2),'.','Color','r','MarkerSize',20);
    end

    if nargin > 5
        title(curtitle)
    end
        
end