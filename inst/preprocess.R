library(fslr)

eve <- readNIfTI("../data/JHU_MNI_SS_T1.nii.gz")
eve_brain <- readNIfTI("../data/JHU_MNI_SS_T1_Brain.nii.gz")

# Creation of the brain mask:
eve_mask <- eve_brain
eve_mask[eve_mask!=0] <- 1
cal_min(eve_mask) <-0
cal_max(eve_mask) <-1
writeNIfTI(eve_mask, "../data/JHU_MNI_SS_T1_Brain_Mask")