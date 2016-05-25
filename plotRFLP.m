function [] = plotRFLP(Fragments,Sequences,fig,titl)
    distances = [];
    dilation = 70;
    for ii=1:size(Sequences,1)
        for iii=1:size(Fragments{ii},1)-1
            startID = Fragments{ii}(iii)+1;
            endID = Fragments{ii}(iii+1);
            length = endID - startID + 1;
            distances = [distances;dilation*(4-log10(length))];
        end
    end
    
    %scale to 0 - 50
    distances = distances - min(distances);
    distances = distances ./ max(distances);
    distances = distances .* 50;
    
    distances = single(distances);
    u = unique(distances);
    n = histc(distances,u);
    
    figure(fig);
    hold on;
    for i =1:size(u)
        plot(1:10,ones(10,1)*u(i),'-r')
    end
    hold off;
    title(titl);
end