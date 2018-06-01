function [fixdata,avgfix,totfix,nusers]=getfixdata(bubble,i)

    fixdata = []; nfix = [];
    for j = 1:length(bubble(i).userdata)
        curfix = bubble(i).userdata(j).fixations.enc; 
        fixdata = [fixdata;curfix];
        nfix(j) = size(curfix,1);
    end
    
    avgfix = mean(nfix); nusers = length(bubble(i).userdata); totfix = size(fixdata,1);
    fprintf('Avg. locations visited per user: %2.2f\n',avgfix);
    fprintf('Total # users: %d\n',nusers);
    fprintf('Total locations visited: %d\n',totfix);

end