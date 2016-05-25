enzymes = {'RsaI';
             'HaeIII';
             'ScrFI';
             'HinfI';
             'MvaI'};
         %W = A or T
         %N = A, T, C or G
        
 HCVGenomeDataPath = 'C:/Users/BatoolAbbas/Dropbox/Hep-C/HCVGenomeData/';
 HCV = [];
HCV = [HCV;fastaread(strcat(HCVGenomeDataPath,'HCV1a.fasta'))];
HCV = [HCV;fastaread(strcat(HCVGenomeDataPath,'HCV2a.fasta'))];
HCV = [HCV;fastaread(strcat(HCVGenomeDataPath,'HCV3.fasta'))];
HCV = [HCV;fastaread(strcat(HCVGenomeDataPath,'HCV4a.fasta'))];
HCV = [HCV;fastaread(strcat(HCVGenomeDataPath,'HCV5a.fasta'))];
HCV = [HCV;fastaread(strcat(HCVGenomeDataPath,'HCV6.fasta'))];

Digest = [1;2;];
GenotypeMixes = {[1,4];
                [1,4,5];
                2;
                3;
                6};

for i=1:size(GenotypeMixes,1)
    restrictAndSave(strcat(HCVGenomeDataPath,'RestrictionMappingResults/DigestA_'),HCV,Digest,GenotypeMixes{i},enzymes);
end

DigestB = [4;3;];
GenotypeMixes = {[1,5];
                1;
                2;
                3;
                4;
                6};
for i=1:size(GenotypeMixes,1)            
    restrictAndSave(strcat(HCVGenomeDataPath,'RestrictionMappingResults/DigestB_'),HCV,Digest,GenotypeMixes{i},enzymes);
end

DigestC = [4;5;];
GenotypeMixes = {1;
                2;
                [3,4];
                5;
                6};
for i=1:size(GenotypeMixes,1)
    restrictAndSave(strcat(HCVGenomeDataPath,'RestrictionMappingResults/DigestC_'),HCV,Digest,GenotypeMixes{i},enzymes);
end