# EveTemplate
### JHU-MNI-ss (Eve) Template
--------

**Creator**: Jean-Philippe Fortin, jeanphi@mail.med.upenn.edu

**Authors**: Jean-Philippe Fortin, John Muschelli, Russell T. Shinohara

##### Software status

| Resource:      | Travis CI     |
| -------------  |  ------------- |
| Platform:      | OSX       |
| R CMD check    | <a href="https://travis-ci.org/Jfortin1/EveTemplate"><img src="https://travis-ci.org/Jfortin1/EveTemplate.svg?branch=master" alt="Build status"></a> |


## Table of content
- [1. Introduction](#id-section1)
- [2. Reading the data into R](#id-section2)
- [3. White Matter Parcellation Map](#id-section4)
- [4. Files](#id-section4)
- [5. Miscellaneous](#id-section5)


<div id='id-section1'/>
## 1. Introduction

<div id='id-section2'/>
## 2. Reading the data into R

<div id='id-section3'/>
## 3. White Matter Parcellation Map

- Curation of the labels
- Use 
- 3 different types

<div id='id-section4'/>
## 4. Files

| File      | Description     | Reader | 
| -------------  | -------------  | -------------  |
| JHU_MNI_SS_TI.nii.gz    | T1-w Eve Template |  `readEveTemplate("T1")`| 
| JHU_MNI_SS_T2.nii.gz    | T2-w Eve Template |  `readEveTemplate("T2")`| 
| JHU_MNI_SS_Brain.nii.gz | T1-w Eve Template, skull stripped  |  `readEveTemplate("Brain")`| 
| JHU_MNI_SS_Brain_Mask.nii.gz    | T1-w Eve Template, brain mask |  `readEveTemplate("Brain_Mask")`| 
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


