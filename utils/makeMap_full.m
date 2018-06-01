function [heatMap,fixLocs] = makeMap_full(fixdata,dim1,dim2,sigma)

if nargin < 4
    sigma = 25;
end

minDim = min(dim1,dim2);
maxDim = max(dim1,dim2);

gausPar = [maxDim,sigma];

fixLocs = zeros(dim1,dim2);
for i = 1:size(fixdata,1)
    fixLocs(max(floor(fixdata(i,2)),1),max(floor(fixdata(i,1)),1)) = 1;
end
nvals = size(fixdata,1);

heatMap = zeros(dim1,dim2);
if nvals==0
   % fprintf('fixdata was empty. Empty heatMap returned.\n')
    return; 
end

%vals1 = arrayfun(@max,floor(fixdata(:,2)),ones(nvals,1));
%vals2 = arrayfun(@max,floor(fixdata(:,1)),ones(nvals,1));
%heatMap(vals1,vals2) = 1;

heatMap = imfilter(fixLocs,fspecial('gaussian',gausPar(1),gausPar(2)));