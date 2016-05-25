enzymes = {'RsaI';
             'HaeIII';
             'ScrFI';
             'HinfI';
             'MvaI'};
         %W = A or T
         %N = A, T, C or G
         
HCVGenomeDataPath = 'C:/Users/BatoolAbbas/Dropbox/Hep-C/HCVGenomeData/';
FastaFileNames = {'HCV1a.fasta';
                  'HCV2a.fasta';
                  'HCV3.fasta';
                  'HCV4a.fasta';
                  'HCV5a.fasta';
                  'HCV6.fasta'};
        
 HCV = [];
 for i=1:size(FastaFileNames,1)
     HCV = [HCV;fastaread(strcat(HCVGenomeDataPath,char(FastaFileNames{i})))];
 end

Digests = [1;2;];
GenotypeMixes = {[1,4];
                [1,4,5];
                2;
                3;
                6};

for i=1:size(GenotypeMixes,1)
    [Fragments,Sequences] = restrictAndSave(strcat(HCVGenomeDataPath,'RestrictionMappingResults/DigestA_'),HCV,Digests,GenotypeMixes{i},enzymes);
    plotRFLP(Fragments,Sequences,1,strcat('DigestA_',int2str(GenotypeMixes{i})));
    print(strcat(HCVGenomeDataPath,'RestrictionMappingResults/DigestA ',int2str(GenotypeMixes{i})),'-djpeg');
    close all;
end

Digests = [4;3;];
GenotypeMixes = {[1,5];
                1;
                2;
                3;
                4;
                6};
for i=1:size(GenotypeMixes,1)            
    [Fragments,Sequences] = restrictAndSave(strcat(HCVGenomeDataPath,'RestrictionMappingResults/DigestB_'),HCV,Digests,GenotypeMixes{i},enzymes);
    plotRFLP(Fragments,Sequences,1,strcat('DigestB_',int2str(GenotypeMixes{i})));
    print(strcat(HCVGenomeDataPath,'RestrictionMappingResults/DigestB ',int2str(GenotypeMixes{i})),'-djpeg');
    close all;
end

Digests = [4;5;];
GenotypeMixes = {1;
                2;
                [3,4];
                5;
                6};
for i=1:size(GenotypeMixes,1)            
    [Fragments,Sequences] = restrictAndSave(strcat(HCVGenomeDataPath,'RestrictionMappingResults/DigestC_'),HCV,Digests,GenotypeMixes{i},enzymes);
    plotRFLP(Fragments,Sequences,1,strcat('DigestC_',int2str(GenotypeMixes{i})));
    print(strcat(HCVGenomeDataPath,'RestrictionMappingResults/DigestC ',int2str(GenotypeMixes{i})),'-djpeg');
    close all;
end
