library(fslr)

# Segmentation with FSL FAST
eve_brain <- readNIfTI("../data/JHU_MNI_SS_T1_Brain.nii.gz")
eve_seg_fast <- fast(eve_brain, opts="-t 1 -n 3", verbose=FALSE, retimg=FALSE, outfile="../data/JHU_MNI_SS_T1_Brain_FAST")
