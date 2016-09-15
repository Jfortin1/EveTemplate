#' @title Get Eve Path of File
#' @description Returns the path of a MNI file to the user.
#' @param what Type of image to return
#'
#' @return Character filename of path
#' @export
#'
#' @importFrom oro.nifti readNIfTI
#' @examples
#' getEvePath()
getEvePath <- function(what=c("T1", "T2", "Brain", "Brain_Mask")){
  what <- match.arg(what)
  app = switch(what, 
               "T1" = "T1",
               "Brain" = "T1_Brain",
               "Brain_Mask" = "T1_Brain_Mask",
               "T2" = "T2"
  )    
  fname = file.path("extdata", paste0("JHU_MNI_SS_", app, ".nii.gz"))
  
  file <- system.file(fname, package = "EveTemplate")
  return(file)
}

#' @title Reads Eve File into R
#' @description Matches the argument to pass to \code{\link{getEvePath}},
#' then reads the NIfTI image into R
#' @param ... Arguments to pass to \code{\link{getEvePath}}
#' @param reorient Should the image be reoriented? 
#' Passed to \code{\link{readNIfTI}}
#'
#' @return Object of class \code{nifti}
#' @export
#'
#' @examples
#' readEve(what = "Brain_Mask")
readEve  <- function(..., reorient=FALSE){
  readNIfTI(getEvePath(...), reorient = reorient)
}

#' @title Get Eve Path of Look up Table/Map Image
#' @description Returns the path of a Eve look up table (LUT) image/map.
#' @param type Version of table/map to use
#'
#' @return Character filename of path
#' @export
#'
#' @examples
#' getEveMapPath()
getEveMapPath <- function(type=c("I", "II", "III")){
  type <- match.arg(type)
  fname = file.path("extdata", paste0("JHU_MNI_SS_WMPM_Type-", type, ".nii.gz"))
  file <- system.file(fname, package="EveTemplate")
  return(file)
}

#' @title Reads Eve Map File into R
#' @description Matches the argument to pass to \code{\link{getEveMapPath}},
#' then reads the NIfTI image into R
#' @param ... Arguments to pass to \code{\link{getEveMapPath}}
#' @param reorient Should the image be reoriented? 
#' Passed to \code{\link{readNIfTI}}
#'
#' @return Object of class \code{nifti}
#' @export
#'
#' @examples
#' readEveMap()
readEveMap <- function(..., reorient=FALSE){
  readNIfTI(getEveMapPath(...), reorient = reorient)
}


#' @title Get the Structure Labels for an Eve Segmentation
#' @description Returns the structure labels for the different look up table 
#' images/maps from an Eve segmentation
#' @param type Version of table/map to use
#'
#' @return \code{data.frame} of labels and indices
#' @export
#'
#' @examples
#' getEveMapLabels()
getEveMapLabels <- function(type=c("I", "II", "III")){
  type <- match.arg(type)
  labels <- EveTemplate::eve_map_labels[[type]]
  return(labels)
}

#' @title Get Eve Path of Segmentation File
#' @description Returns the path of a Eve file of a segmentation to the user.
#' @param alg Algorithm of the segmentation
#'
#' @return Character filename of path
#' @export
#'
#' @examples
#' getEveSegPath()
getEveSegPath <- function(alg="FAST"){
  alg = match.arg(alg)
  if (alg != "FAST"){
    stop("Only FAST segmentation available at the moment.")
  }
  fname = file.path("extdata", 
                    paste0("JHU_MNI_SS_T1_Brain_", alg, "_seg.nii.gz")
  )
  file <- system.file(fname, package = "EveTemplate")
  return(file)
}

#' @title Reads Eve Segmentation File into R
#' @description Matches the argument to pass to \code{\link{getEveSegPath}},
#' then reads the NIfTI image of the segmetation into R
#' @param ... Arguments to pass to \code{\link{getEveSegPath}}
#' @param reorient Should the image be reoriented? 
#' Passed to \code{\link{readNIfTI}}
#' @param verbose Print diagnostic messages of the labels
#'
#' @return Object of class \code{nifti}
#' @export
#'
#' @examples
#' readEveSeg()
readEveSeg <- function(..., reorient=FALSE, verbose=TRUE){
  if (verbose) {
    message("Label 0: Background \n")
    message("Label 1: CSF \n")
    message("Label 2: GM \n")
    message("Label 3: WM \n")
  }
  readNIfTI(getEveSegPath(...), reorient = reorient)
}
