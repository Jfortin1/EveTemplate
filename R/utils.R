getEveTemplatePath <- function(what=c("full", "brain", "brain_mask", "T2")){
    what <- match.arg(what)
    if (what=="full"){
        file <- system.file(package="EveTemplate", "data/JHU_MNI_SS_T1.nii.gz")
    } else if (what=="brain"){
        file <- system.file(package="EveTemplate", "data/JHU_MNI_SS_T1_Brain.nii.gz")
    } else if (what=="brain_mask"){
        file <- system.file(package="EveTemplate", "data/JHU_MNI_SS_T1_Brain_Mask.nii.gz")
    } else {
        file <- system.file(package="EveTemplate", "data/JHU_MNI_SS_T2.nii.gz")
    }
    file
}


readEveTemplate  <- function(what=c("full", "brain", "brain_mask", "T2"), reorient=FALSE){
    what <- match.arg(what)
    readNIfTI(getEveTemplatePath(what=what), reorient=reorient)
}


getEveMapPath <- function(type=c("I", "II", "III")){
    type <- match.arg(type)
    file <- system.file(package="EveTemplate", paste0("data/JHU_MNI_SS_WMPM_Type-", type, ".nii.gz"))
    file
}

readEveMap <- function(type=c("I", "II", "III"), reorient=FALSE){
    type <- match.arg(type)
    readNIfTI(getEveMapPath(type=type), reorient=reorient)
}



