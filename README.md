# EveTemplate
### JHU-MNI-ss (Eve) Template
--------

**Creator**: Jean-Philippe Fortin, jeanphi@mail.med.upenn.edu

**Authors**: Jean-Philippe Fortin, John Muschelli, Russell T. Shinohara

##### Software status

| Resource:      | Travis CI     |
| -------------  |  ------------- |
| Platform:      | Linux       |
| R CMD check    | <a href="https://travis-ci.org/Jfortin1/EveTemplate"><img src="https://travis-ci.org/Jfortin1/EveTemplate.svg?branch=master" alt="Build status"></a> |

##### References
If using the `EveTemplate` package, please cite the following:

|  | Description | Citation     | Link |
| -------------  | -------------  | -------------  | -------------  |
| JHU-MNI-ss Atlas    | `RegLib_C26_MoriAtlas.zip`   | Kenichi Oishi, Andreia V Faria and Susumu Mori, _JHU-MNI-ss Atlas_, 2010, Johns Hopkins University School of Medicine, Department of Radiology, Center for Brain Imaging Science| [Link](https://www.slicer.org/publications/item/view/1883) |
| WMPM    | White Matter Parcellation Map |Oishi et al., _Atlas-based whole brain white matter analysis using large deformation diffeomorphic metric mapping: Application to normal elderly and Alzheimer’s disease participants_, Neuroimage, 2009 |[Link](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=0ahUKEwiOmpCg4bvNAhWBQj4KHfQFAP8QFggeMAA&url=http%3A%2F%2Fwww.ncbi.nlm.nih.gov%2Fpubmed%2F19385016&usg=AFQjCNHwuv1ECKcDOdCtInmlGi05ww4mIg&sig2=hSaDBY4FN4IpdDsg2GL4Ag)|

Complete BibTeX citations can be found [here](https://github.com/Jfortin1/EveTemplate/blob/master/CITATIONS.bib).

## Table of content
- [1. Introduction](#id-section1)
- [2. Reading the data into R](#id-section2)
- [3. White Matter Parcellation Map](#id-section4)
- [4. Files](#id-section4)
- [5. Miscellaneous](#id-section5)


<div id='id-section1'/>
## 1. Introduction

> The JHU-MNI-ss atlas, which is often called "Eve Atlas", is based on a single-subject data as described in Oishi et al, 2009. There are co-registered T1 (MPRAGE), T2, and DTI images as well as white matter parcellation map (WMPM). Once the image of interest is normalized to this atlas coordinate, the WMPM (which also includes gray matter structures) can be superimposed for anatomical definition (e.g. which structure is affected by a lesion or where exactly is the fMRI activation site) or automated segmentation.

The `EveTemplate` package contains the anatomical T1 and T1 images, together with or without the skull on, as well as a brain mask. It also contains the three types of White Matter Parcellaton Map (WMPM) with the dictionary of the labels. Finally, we have performed a 3-tissue class segmentaiton with the FSL FAST algorithm and have included the segmentation classes in the package. 

<div id='id-section2'/>
## 2. Reading the data into R

We first load the package into R:
```{r}
library(EveTemplate)
```
The default command `readEve()` imports the Eve template T1-w image as a `nifti` object into R:
```{r}
eve <- readEve()
```
In many preprocessing pipelines, the path of the template file must be specified instead. For this, use the following:
```{r}
eve_path <- getEvePath()
```


<div id='id-section3'/>
## 3. White Matter Parcellation Map

#### Curation of the labels

#### Use

#### 3 different types



<div id='id-section4'/>
## 4. Files

| File      | Description     | Reader | 
| -------------  | -------------  | -------------  |
| JHU_MNI_SS_TI.nii.gz    | T1-w Eve Template |  `readEve("T1")`| 
| JHU_MNI_SS_T2.nii.gz    | T2-w Eve Template |  `readEve("T2")`| 
| JHU_MNI_SS_Brain.nii.gz | T1-w Eve Template, skull stripped  |  `readEve("Brain")`| 
| JHU_MNI_SS_Brain_Mask.nii.gz    | T1-w Eve Template, brain mask |  `readEve("Brain_Mask")`| 
|**Tissue Segmentation:**  | | |
| JHU_MNI_SS_Brain_FAST_seg.nii.gz    | FSL FAST tissue classes (1=CSF, 2=GM, 3=WM) |  `readEveSeg()`| 
|**White Matter Parcellation Map:**  | | |
| JHU_MNI_SS_WMPM_Type-I.nii.gz    | White Matter Parcellation Map (Type I) |  `readEveMap("I")`| 
| JHU_MNI_SS_WMPM_Type-II.nii.gz    | White Matter Parcellation Map (Type II) |  `readEveMap("II")`| 
| JHU_MNI_SS_WMPM_Type-III.nii.gz    | White Matter Parcellation Map (Type III) |  `readEveMap("III")`|
| eve_map_labels.rda    | White Matter Parcellation Map labels (I) |  `getEveMapLabels("I")`|
| eve_map_labels.rda    | White Matter Parcellation Map labels (II) |  `getEveMapLabels("II")`|
| eve_map_labels.rda    | White Matter Parcellation Map labels (III) |  `getEveMapLabels("III")`|

<div id='id-section5'/>
## 5. Miscellaneous

The GitHub repository [https://github.com/muschellij2/Eve_Atlas](https://github.com/muschellij2/Eve_Atlas) from John Muschelli includes a useful discussion on how the Eve template compares to the MNI152 template and to the Rorden T1 image. The dimensions of the 3 templates do not agree, and different solutions are proposed to match the voxel locations, either by dropping slides, interpolating or performing a non-linear transformation. The files for the transformed templates are included in the repository. 


