library(fslr)

# Segmentation with FSL FAST
eve_brain <- readNIfTI("../data/JHU_MNI_SS_T1_Brain.nii.gz")
eve_seg_fast <- fast(eve_brain, opts="-t 1 -n 3", verbose=FALSE)






writeNIfTI(eve_seg_fast, "../data/JHU_MNI_SS_T1_Brain_")












