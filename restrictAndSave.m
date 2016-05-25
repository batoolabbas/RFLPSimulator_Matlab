function [] = restrictAndSave(filename,HCV,Digest,GenotypeMix,enzymes)
Sequences = {};
Fragments ={};
for j=1:size(GenotypeMix,2)
    Sequences{j,1} = [HCV(GenotypeMix(1,j)).Sequence];
    Fragments{j,1}=restrictionMapping(char(Sequences{j,1}),Digest,enzymes);
end
fileID = fopen(strcat(filename,int2str(GenotypeMix),'.txt'),'w');
for ii=1:size(Sequences,1)
    for iii=1:size(Fragments{ii},1)
        startID = Fragments{ii}(iii)+1;
        if(iii==size(Fragments{ii},1))
            fprintf(fileID,'%s\n',char(Sequences{ii}(startID:end)));
        else
            endID = Fragments{ii}(iii+1);
            fprintf(fileID,'%s\n',char(Sequences{ii}(startID:endID)));
        end
    end
end
fclose(fileID);
end