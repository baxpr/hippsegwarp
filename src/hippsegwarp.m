function hippsegwarp(varargin)


%% Parse inputs
P = inputParser;

addOptional(P,'seg_niigz','/INPUTS/seg.nii.gz');
addOptional(P,'deffwd_niigz','/INPUTS/y_t1.nii.gz');
addOptional(P,'mnigeom_nii','avg152T1.nii')

addOptional(P,'project','UNK_PROJ');
addOptional(P,'subject','UNK_SUBJ');
addOptional(P,'session','UNK_SESS');
addOptional(P,'scan','UNK_SCAN');

addOptional(P,'out_dir','/OUTPUTS');

parse(P,varargin{:});

disp(P.Results)


%% Process
hippsegwarp_main(P.Results)

