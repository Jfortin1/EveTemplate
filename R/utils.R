getEveTemplatePath <- function(what=c("T1", "T2", "Brain", "Brain_Mask")){
    what <- match.arg(what)
    if (what=="T1"){
        file <- system.file(package="EveTemplate", "data/JHU_MNI_SS_T1.nii.gz")
    } else if (what=="Brain"){
        file <- system.file(package="EveTemplate", "data/JHU_MNI_SS_T1_Brain.nii.gz")
    } else if (what=="Brain_mask"){
        file <- system.file(package="EveTemplate", "data/JHU_MNI_SS_T1_Brain_Mask.nii.gz")
    } else if (what=="T2"){
        file <- system.file(package="EveTemplate", "data/JHU_MNI_SS_T2.nii.gz")
    }
    file
}

readEveTemplate  <- function(what=c("T1","T2", "Brain", "Brain_Mask"), reorient=FALSE){
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


getEveMapLabels <- function(type=c("I", "II", "III")){
    type <- match.arg(type)
    file <- system.file(package="EveTemplate", "data/eve_map_labels.rda")
    load(file)
    labels <- eve_map_labels[[type]]
    rm(eve_map_labels)
    labels
}

getEveSegPath <- function(alg="FAST"){
    if (alg!="FAST"){
        stop("Only FAST segmentation available at the moment.")
    }
    file <- system.file(package="EveTemplate", "data/JHU_MNI_SS_T1_Brain_FAST_seg.nii.gz")
    file
}

readEveSeg <- function(alg="FAST", reorient=FALSE, verbose=TRUE){
    if (alg!="FAST"){
        stop("Only FAST segmentation available at the moment.")
    }
    if (verbose){
        cat("Label 0: Background \n")
        cat("Label 1: CSF \n")
        cat("Label 2: GM \n")
        cat("Label 3: WM \n")
    }
    readNIfTI(getEveSegPath(alg=alg), reorient=reorient)
}