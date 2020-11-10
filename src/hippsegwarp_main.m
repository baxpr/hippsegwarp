function hippsegwarp_main(inp)


%% SPM init
spm_jobman('initcfg')


%% Get reference geometry
mnigeom_nii = which(inp.mnigeom_nii);


%% Copy files to working directory with consistent names and unzip
disp('File prep')
[seg_nii,deffwd_nii] = prep_files(inp);


%% Warp SEG to MNI space
disp('Warping')
wseg_nii = warp_images(seg_nii,deffwd_nii,mnigeom_nii,0,inp.out_dir);


%% Make output PDF
% Show warped seg on BIAS_NORM and on mnigeom atlas, hippocampus COM


%% Zip output images
system(['gzip ' wseg_nii]);


%% Exit
if isdeployed
	exit
end

