% Trying to display the four quadrants of low/high density and low/high hubness
% Author: Marilyn Y. Vazquez

dim = [30 60 100];
dr = 2:5;
bpts = 1000;
ka = 16;
kL = 100;
knn = [5 10 50];
dcolor = ['k' 'b' 'c' 'r'];
kmarker = ['x' '*' 'o'];

ld = length(dim);
lr = length(dr);
lk = length(knn);


% Gaussian
count = 1;
disp('top left, top right,, bottom left, bottom right')
for i=1:ld
    for j=1:lr
        for k=1:lk
            load(['gauss-hubness' num2str(dim(i)) '-1000-' num2str(dr(j)) '000-k' num2str(knn(k)) '.mat'])
            load(['gauss-density-dim' num2str(dim(i)) '-1000-' num2str(dr(j)) '000.mat'])
%             hubs = logical(hubs);
%             hubs = logical(hubs(1:1000));
            hubs = logical(hubs(1001:end));
            nothubs = ~hubs;
%             thr = mean(q)+2*std(q);
%             thr = mean(q(1:1000))+2*std(q(1:1000));
            thr = mean(q(1001:end))+2*std(q(1001:end));
%             dense = q>= thr;
%             notdense = q< thr;
%             dense = q(1:1000)>= thr;
%             notdense = q(1:1000)< thr;
            dense = q(1001:end)>= thr;
            notdense = q(1001:end)< thr;
            tl = sum(hubs.*notdense);
            tr = sum(hubs.*dense);
            bl = sum(nothubs.*notdense);
            br = sum(nothubs.*dense);
            disp(['dim= ' num2str(dim(i)) ', 1 to ' num2str(dr(j)) ',k = ' num2str(knn(k))])
%             grid_vals = 100*[tl tr bl br]./size(q,1);
%             grid_vals = 100*[tl tr bl br]./size(q(1:1000),1)
            grid_vals = 100*[tl tr bl br]./size(q(1001:end),1)
        end
    end
end

% Uniform

disp('top left, top right,, bottom left, bottom right')
for i=1:ld
    for j=1:lr
        for k=1:lk
            load(['unif-hubness' num2str(dim(i)) '-1000-' num2str(dr(j)) '000-k' num2str(knn(k)) '.mat'])
            load(['unif-density-dim' num2str(dim(i)) '-1000-' num2str(dr(j)) '000.mat'])
%             hubs = logical(hubs);
%             hubs = logical(hubs(1:1000));
            hubs = logical(hubs(1001:end));
            nothubs = ~hubs;
%             thr = mean(q)+2*std(q);
%             thr = mean(q(1:1000))+2*std(q(1:1000));
            thr = mean(q(1001:end))+2*std(q(1001:end));
%             dense = q>= thr;
%             notdense = q< thr;
%             dense = q(1:1000)>= thr;
%             notdense = q(1:1000)< thr;
            dense = q(1001:end)>= thr;
            notdense = q(1001:end)< thr;
            tl = sum(hubs.*notdense);
            tr = sum(hubs.*dense);
            bl = sum(nothubs.*notdense);
            br = sum(nothubs.*dense);
            disp(['dim= ' num2str(dim(i)) ', 1 to ' num2str(dr(j)) ',k = ' num2str(knn(k))])
%             grid_vals = 100*[tl tr bl br]./size(q,1);
%             grid_vals = 100*[tl tr bl br]./size(q(1:1000),1)
            grid_vals = 100*[tl tr bl br]./size(q(1001:end),1)
%             100*[tl tr]./(tl+tr);
        end
    end
end
