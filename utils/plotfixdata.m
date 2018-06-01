function heatmap=plotfixdata(im,fixdata,dim1,dim2,curtitle,s1,s2,subplt)

    [heatmap,~] = makeMap_full(fixdata,dim1,dim2);
    
    omap = heatmap_overlay(im,heatmap,'hot');

    if nargin>5
        subplot(s1,s2,subplt); 
    else
        figure('name',curtitle); 
    end
    imshow(omap);

    if nargin > 5
        subplot(s1,s2,subplt+s2); 
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